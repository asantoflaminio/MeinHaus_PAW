package ar.edu.itba.paw.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import ar.edu.itba.paw.PublicationDao;
import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.User;

@Repository
public class PublicationJdbcDao implements PublicationDao{

	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private final static RowMapper<Publication> ROW_MAPPER = new RowMapper<Publication>(){

		public Publication mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Publication(rs.getString("title"), 
							rs.getString("address"),
							rs.getString("operation"),
							rs.getString("price"),
							rs.getString("description"),
							rs.getString("propertyType"),
							rs.getString("bedrooms"),
							rs.getString("bathrooms"),
							rs.getString("flooSize"),
							rs.getString("parking"),
							rs.getInt("publicationid"));
		}
		
	};

	@Autowired
	public PublicationJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("publications")
				.usingGeneratedKeyColumns("publicationid")
				.usingColumns("title","address","operation","price","description","propertyType","bedrooms",
							  "bathrooms","flooSize","parking");
	}

	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking) {
		final Map<String, Object> args = new HashMap<String, Object>();
    	
		args.put("title", title);
		args.put("address", address);
		args.put("operation", operation);
		args.put("price", price);
		args.put("description", description);
		args.put("propertyType", propertyType);
		args.put("bedrooms", bedrooms);
		args.put("bathrooms", bathrooms);
		args.put("flooSize", floorSize);
		args.put("parking", parking);
		final Number publicationid = jdbcInsert.executeAndReturnKey(args);
		return new Publication(title, address, operation, price,
				   description, propertyType, bedrooms,
				   bathrooms, floorSize, parking, publicationid.longValue());
	}

	public Publication findById(long id) {
		final List<Publication> list = jdbcTemplate.query("SELECT * FROM publications WHERE publicationid = ?",ROW_MAPPER,id);
		if(list.isEmpty())
			return null;
		return list.get(0);
	}
	
	public List<Publication> findAll(String operation){
		return jdbcTemplate.query("SELECT * FROM publications WHERE operation = ?", ROW_MAPPER,operation); 
	}
	
	public List<Publication> findSearch(String operation, String search){
		final String queryAddress = "%" + search + "%";
		return jdbcTemplate.query("SELECT * FROM publications WHERE operation = ? AND address LIKE ?", ROW_MAPPER,operation,queryAddress);
	}
	

}