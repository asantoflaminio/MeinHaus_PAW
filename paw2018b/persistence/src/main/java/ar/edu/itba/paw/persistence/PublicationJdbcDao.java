package ar.edu.itba.paw.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
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
			return new Publication(rs.getString("title"), 
							rs.getString("address"),
							rs.getString("operation"),
							rs.getString("price"));
		}
		
	};

	@Autowired
	public PublicationJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("publications")
				.usingColumns("title","address","operation","price");

		jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS publications ("
			+ "title varchar(30),"
			+ "address varchar(30) PRIMARY KEY,"
			+ "operation varchar(30),"
			+ "price varchar(30)"
			+ ")");
	}

	public Publication create(String title, String address,String operation, String price) {
		final Map<String, Object> args = new HashMap<String, Object>();
    	
		args.put("title", title);
		args.put("address", address);
		args.put("operation", operation);
		args.put("price", price);
		jdbcInsert.execute(args);
		return new Publication(title, address, operation, price);
	}
	

}