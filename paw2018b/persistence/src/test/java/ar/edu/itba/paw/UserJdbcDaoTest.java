package ar.edu.itba.paw;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.jdbc.JdbcTestUtils;

import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.persistence.UserJdbcDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
public class UserJdbcDaoTest {
	
	private static final String FIRSTNAME = "FirstName";
	private static final String LASTNAME = "LastName";
	private static final String EMAIL = "Email";
	private static final String PASSWORD = "Password";
	private static final String PHONENUMBER = "PhoneNumber";
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private UserJdbcDao userDao;
	private JdbcTemplate jdbcTemplate;
	
	@Before
	public void setUp() {
		jdbcTemplate = new JdbcTemplate(ds);
		JdbcTestUtils.deleteFromTables(jdbcTemplate, "users");
	}
	
	@Test
	public void testCreate() {
		final User user = userDao.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
		assertNotNull(user);
		assertEquals(FIRSTNAME, user.getFirstName());
		assertEquals(LASTNAME, user.getLastName());
		assertEquals(EMAIL, user.getEmail());
		assertEquals(PASSWORD, user.getPassword());
		assertEquals(PHONENUMBER, user.getPhoneNumber());
		assertEquals(1, JdbcTestUtils.countRowsInTable(jdbcTemplate, "users"));
	}
}