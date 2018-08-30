package ar.edu.itba.paw.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import ar.edu.itba.paw.UserDao;
import ar.edu.itba.paw.models.User;


//@Repository
public class UserJdbcDao implements UserDao{

	private final JdbcTemplate jdbcTemplate;
	
	private final static RowMapper<User> ROW_MAPPER = new RowMapper<User>(){

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new User(rs.getString("username"), rs.getInt("userid"));
		}
		
	};

	@Autowired
	public UserJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
	}

	public Optional<User> findById(final long id) {
		return jdbcTemplate.query("SELECT * FROM users WHERE userid = ?",ROW_MAPPER,id).stream().findFirst(); 
	}
	

}