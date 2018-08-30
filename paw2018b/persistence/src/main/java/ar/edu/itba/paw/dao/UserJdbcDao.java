package ar.edu.itba.paw.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import ar.edu.itba.paw.UserDao;
import ar.edu.itba.paw.models.User;


//@Repository
public class UserJdbcDao implements UserDao{

	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private final static RowMapper<User> ROW_MAPPER = new RowMapper<User>(){

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new User(rs.getString("firstName"), 
							rs.getString("lastName"),
							rs.getString("email"),
							rs.getString("password"),
							rs.getString("phoneNUmber"));
		}
		
	};

	@Autowired
	public UserJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("users")
				.usingColumns("firstName","lastName","email","password","phoneNumber");

		jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS users ("
			+ "firstName varchar(20)"
			+ "lastName varchar(20)"
			+ "email SERIAL PRIMERY KEY"
			+ "password varchar(20)"
			+ "phoneNumber varchar(20)"
			+")");
	}

	public Optional<User> findById(final long id) {
		return jdbcTemplate.query("SELECT * FROM users WHERE userid = ?",ROW_MAPPER,id).stream().findFirst(); 
	}

	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		final Map<String, String> args = new HashMap<String, String>();
    	
		args.put("firstName", firstName);
		args.put("lastName", lastName);
		args.put("email", email);
		args.put("password", password);
		args.put("phoneNumber", phoneNumber);
		final Number userId = jdbcInsert.executeAndReturnKey(args);
		return new User(firstName, lastName, email, password, phoneNumber);
	}
	

}