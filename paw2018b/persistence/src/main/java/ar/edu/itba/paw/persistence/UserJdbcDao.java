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

import ar.edu.itba.paw.UserDao;
import ar.edu.itba.paw.models.User;

@Repository
public class UserJdbcDao implements UserDao{

	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private final static RowMapper<User> ROW_MAPPER = new RowMapper<User>(){
		
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new User(rs.getInt("userid"),
							rs.getString("firstName"), 
							rs.getString("lastName"),
							rs.getString("email"),
							rs.getString("password"),
							rs.getString("phoneNUmber")
							);
		}
		
	};

	@Autowired
	public UserJdbcDao(final DataSource dataSource){
		jdbcTemplate = new JdbcTemplate(dataSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("users")
				.usingGeneratedKeyColumns("userid")
				.usingColumns("firstName","lastName","email","password","phoneNumber");
	}

	public User findById(final long id) {
		final List<User> list = jdbcTemplate.query("SELECT * FROM users WHERE userid = ?",ROW_MAPPER,id);
		if(list.isEmpty())
			return null;
		return list.get(0);
	}

	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		final Map<String, Object> args = new HashMap<String, Object>();
    	
		args.put("firstName", firstName);
		args.put("lastName", lastName);
		args.put("email", email);
		args.put("password", password);
		args.put("phoneNumber", phoneNumber);

		final Number userId = jdbcInsert.executeAndReturnKey(args);
		
		return new User(userId.longValue(), firstName, lastName, email, password, phoneNumber);
	}

	public User findByUsername(String email) {
		final List<User> list = jdbcTemplate.query("SELECT * FROM users WHERE email = ?",ROW_MAPPER,email);
		if(list.isEmpty())
			return null;
		return list.get(0);
	}
	

}