package ar.edu.itba.paw;

import org.junit.Assert;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.jdbc.JdbcTestUtils;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.persistence.PublicationJdbcDao;
import ar.edu.itba.paw.persistence.UserJdbcDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Sql("classpath:publicationScript.sql")
@Transactional
public class PublicationsJdbcDaoTest {


	private static final String TITLE = "TestTitle";
	private static final String ADDRESS = "TestAddress";
	private static final String NEIGHBORHOOD = "TestNeighborhood";
	private static final String CITY = "TestCity";
	private static final String PROVINCE = "TestProvince";
	private static final String OPERATION = "TestOperation";
	private static final String PRICE = "4242412";
	private static final String DESCRIPTION = "TestDescription";
	private static final String PROPERTYTYPE = "TestPropertyType";
	private static final String BEDROOMS = "3";
	private static final String BATHROOMS = "1";
	private static final String FLOORSIZE = "50";
	private static final String PARKING = "1";
	private static final long USERID = 2;
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private PublicationJdbcDao pbDao;
	private UserJdbcDao userDao;
	
	private JdbcTemplate jdbcTemplate;
	
	@Before
	public void setUp() {
		jdbcTemplate = new JdbcTemplate(ds);
		userDao = Mockito.mock(UserJdbcDao.class);
	}
	
	
	@Test
	public void testCreate() {
		
	}
}
