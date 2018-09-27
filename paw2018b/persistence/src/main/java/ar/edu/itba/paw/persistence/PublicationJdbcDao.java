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

@Repository
public class PublicationJdbcDao implements PublicationDao{

	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private final static RowMapper<Publication> ROW_MAPPER = new RowMapper<Publication>(){

		public Publication mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Publication(rs.getInt("publicationid"),
							rs.getString("title"), 
							rs.getString("address"),
							rs.getString("operation"),
							rs.getInt("price"),
							rs.getString("description"),
							rs.getString("propertyType"),
							rs.getInt("bedrooms"),
							rs.getInt("bathrooms"),
							rs.getInt("floorSize"),
							rs.getInt("parking"),
							rs.getLong("userid"));
		}
		
	};

	@Autowired
	public PublicationJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("publications")
				.usingGeneratedKeyColumns("publicationid")
				.usingColumns("title","address","operation","price","description","propertyType","bedrooms",
							  "bathrooms","floorSize","parking","userid");
	}

	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid) {
		final Map<String, Object> args = new HashMap<String, Object>();
    	
		args.put("title", title);
		args.put("address", address);
		args.put("operation", operation);
		args.put("price", Integer.valueOf(price));
		args.put("description", description);
		args.put("propertyType", propertyType);
		args.put("bedrooms", Integer.valueOf(bedrooms));
		args.put("bathrooms", Integer.valueOf(bathrooms));
		args.put("floorSize", Integer.valueOf(floorSize));
		args.put("parking", Integer.valueOf(parking));
		args.put("userid", userid);
		final Number publicationid = jdbcInsert.executeAndReturnKey(args);
		return new Publication(publicationid.longValue(), title, address, operation, Integer.valueOf(price),
				   description, propertyType, Integer.valueOf(bedrooms),
				   Integer.valueOf(bathrooms), Integer.valueOf(floorSize), Integer.valueOf(parking), userid);
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
	
	public List<Publication> findSearchFiltering(String operation, String address, String price, String bedrooms){
		System.out.println("Searching with parameters: " + operation + " " + address + " " + price + " " + bedrooms);
		String queryAddress;
		if(address.equals("all"))
			queryAddress = "%%";
		else
			queryAddress = "%" + address + "%";
		if(! price.equals("") && ! bedrooms.equals("")) {
			System.out.print("Busco con todo: " + bedrooms + " " + price);
			return jdbcTemplate.query("SELECT * FROM publications WHERE operation = ? AND address LIKE ? AND bedrooms = ? AND price <= ?", ROW_MAPPER,operation,queryAddress,Integer.valueOf(bedrooms),Integer.valueOf(price)	);
		}
		else if(! price.equals("")) {
			System.out.print("Busco con price: " + price);
			return jdbcTemplate.query("SELECT * FROM publications WHERE operation = ? AND address LIKE ? AND price <= ?", ROW_MAPPER,operation,queryAddress,Integer.valueOf(price));
		}
		else {
			System.out.print("Busco con bedrooms: " + bedrooms);
			return jdbcTemplate.query("SELECT * FROM publications WHERE operation = ? AND address LIKE ? AND bedrooms = ?", ROW_MAPPER,operation,queryAddress,Integer.valueOf(bedrooms)	);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}