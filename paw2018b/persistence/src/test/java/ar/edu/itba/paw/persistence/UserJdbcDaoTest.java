package ar.edu.itba.paw.persistence;

import org.junit.Assert;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.jdbc.JdbcTestUtils;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.persistence.UserJdbcDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Sql("classpath:userScript.sql")
@Transactional
public class UserJdbcDaoTest {
	
	private static final long USERID = 1;
	private static final long NONEXISTENTUSERID = -1;
	private static final String FIRSTNAME = "TestFirstName";
	private static final String NEWFIRSTNAME = "TestNewFirstName";
	private static final String LASTNAME = "TestLastName";
	private static final String EMAIL = "test1@mail.com";
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
	}
	
	@Test
	public void testCreateUser() {
		JdbcTestUtils.deleteFromTables(jdbcTemplate, "users");
		final User user = userDao.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
		
		Assert.assertNotNull(user);
		Assert.assertEquals(FIRSTNAME, user.getFirstName());
		Assert.assertEquals(LASTNAME, user.getLastName());
		Assert.assertEquals(EMAIL, user.getEmail());
		Assert.assertEquals(PASSWORD, user.getPassword());
		Assert.assertEquals(PHONENUMBER, user.getPhoneNumber());
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTable(jdbcTemplate, "users"));
	}
	
	@Test
	public void testFindByEmail() {
		final User user = userDao.findByUsername(EMAIL);
		String email = "'" + EMAIL + "'";
		
		Assert.assertNotNull(user);
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "users", "email = " + email));
	}
	
	@Test
	public void testFindById() {
		final User user = userDao.findById(USERID);
		String userid = "'" + USERID + "'";
		
		Assert.assertNotNull(user);
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "users", "userid = " + userid));
	}
	
	@Test
	public void testFindByNonExistentId() {
		final User user = userDao.findById(NONEXISTENTUSERID);
		String userid = "'" + NONEXISTENTUSERID + "'";
		
		Assert.assertNull(user);
		Assert.assertEquals(0, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "users", "userid = " + userid));
	}
	
	@Test
	public void testEditData() {
		userDao.editData(NEWFIRSTNAME, LASTNAME, EMAIL, PHONENUMBER, USERID);
		String firstname = "'" + FIRSTNAME + "'";
		String newfirstname = "'" + NEWFIRSTNAME + "'";
		String userid = "'" + USERID + "'";
		
		Assert.assertEquals(0, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "users", "firstname = " + firstname + " AND userid= " + userid));
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "users", "firstname = " + newfirstname + " AND userid= " + userid));
	}
	
	
}