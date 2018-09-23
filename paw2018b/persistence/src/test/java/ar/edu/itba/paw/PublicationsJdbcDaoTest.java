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

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.persistence.PublicationJdbcDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Sql("classpath:publicationScript.sql")
public class PublicationsJdbcDaoTest {
	
	private static final String TITLE = "TestTitle";
	private static final String ADDRESS = "TestAddress";
	private static final String OPERATION = "TestOperation";
	private static final String PRICE = "TestPrice";
	private static final String DESCRIPTION = "TestDescription";
	private static final String PROPERTYTYPE = "TestPropertyType";
	private static final String BEDROOMS = "3";
	private static final String BATHROOMS = "1";
	private static final String FLOORSIZE = "50";
	private static final String PARKING = "1";
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private PublicationJdbcDao pbDao;
	private JdbcTemplate jdbcTemplate;
	
	@Before
	public void setUp() {
		jdbcTemplate = new JdbcTemplate(ds);
		JdbcTestUtils.deleteFromTables(jdbcTemplate, "publications");
	}
	
	@After
	public void after(){
        JdbcTestUtils.deleteFromTables(jdbcTemplate, "publications");
    }
	
	@Test
	public void testCreate() {
		final Publication pb = pbDao.create(TITLE, ADDRESS, OPERATION, PRICE, DESCRIPTION, PROPERTYTYPE, BEDROOMS, BATHROOMS, FLOORSIZE, PARKING);
		Assert.assertNotNull(pb);
		Assert.assertEquals(TITLE, pb.getTitle());
		Assert.assertEquals(ADDRESS, pb.getAddress());
		Assert.assertEquals(OPERATION, pb.getOperation());
		Assert.assertEquals(PRICE, pb.getPrice());
		Assert.assertEquals(DESCRIPTION, pb.getDescription());
		Assert.assertEquals(PROPERTYTYPE, pb.getPropertyType());
		Assert.assertEquals(BEDROOMS, pb.getBedrooms());
		Assert.assertEquals(BATHROOMS, pb.getBathrooms());
		Assert.assertEquals(FLOORSIZE, pb.getFloorSize());
		Assert.assertEquals(PARKING, pb.getParking());
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTable(jdbcTemplate, "publications"));
	}
	
	
	
}
