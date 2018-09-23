package ar.edu.itba.paw;

import org.junit.Assert;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.jdbc.JdbcTestUtils;

import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.persistence.UserJdbcDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Sql("classpath:userScript.sql")
public class UserJdbcDaoTest {
	
	private static final String FIRSTNAME = "TestFirstName";
	private static final String LASTNAME = "TestLastName";
	private static final String EMAIL = "test@mail.com";
	private static final String PASSWORD = "TestPassword";
	private static final String PHONENUMBER = "1522334455";
	
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
	
	@After
	public void after(){
        JdbcTestUtils.deleteFromTables(jdbcTemplate, "users");
    }
	
	@Test
	public void testCreate() {
		final User user = userDao.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
		Assert.assertNotNull(user);
		Assert.assertEquals(FIRSTNAME, user.getFirstName());
		Assert.assertEquals(LASTNAME, user.getLastName());
		Assert.assertEquals(EMAIL, user.getEmail());
		Assert.assertEquals(PASSWORD, user.getPassword());
		Assert.assertEquals(PHONENUMBER, user.getPhoneNumber());
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTable(jdbcTemplate, "users"));
	}
	
	
	
	
	
}