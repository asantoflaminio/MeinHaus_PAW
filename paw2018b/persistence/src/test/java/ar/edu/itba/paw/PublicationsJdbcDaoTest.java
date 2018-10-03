package ar.edu.itba.paw;

import org.junit.Assert;

import java.util.List;

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

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.persistence.PublicationJdbcDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Sql("classpath:publicationScript.sql")
@Transactional
public class PublicationsJdbcDaoTest {

	private static final long USERID = 1;
	private static final long PUBLICATIONID = 1;
	private static final long NONEXISTENTPUBLICATIONID = -1;
	private static final String TITLE = "TestTitle";
	private static final String ADDRESS = "TestAddress";
	//private static final String NEIGHBORHOOD = "TestNeighborhood";
	//private static final String CITY = "TestCity";
	//private static final String PROVINCE = "TestProvince";
	private static final String OPERATION = "TestOperation";
	private static final String PRICE = "4242412";
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
	}
	
	@Test
	public void testCreate() {
		JdbcTestUtils.deleteFromTables(jdbcTemplate, "publications");
		final Publication pb = pbDao.create(TITLE, ADDRESS, OPERATION, PRICE, DESCRIPTION, PROPERTYTYPE, BEDROOMS, BATHROOMS, FLOORSIZE, PARKING, USERID);
		Assert.assertNotNull(pb);
		Assert.assertEquals(TITLE, pb.getTitle());
		Assert.assertEquals(ADDRESS, pb.getAddress());
		Assert.assertEquals(OPERATION, pb.getOperation());
		Assert.assertEquals(PRICE, pb.getPrice().toString());
		Assert.assertEquals(DESCRIPTION, pb.getDescription());
		Assert.assertEquals(PROPERTYTYPE, pb.getPropertyType());
		Assert.assertEquals(BEDROOMS, pb.getBedrooms().toString());
		Assert.assertEquals(BATHROOMS, pb.getBathrooms().toString());
		Assert.assertEquals(FLOORSIZE, pb.getFloorSize().toString());
		Assert.assertEquals(PARKING,pb.getParking().toString());
		Assert.assertEquals(USERID, pb.getUserid());
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTable(jdbcTemplate, "publications"));
	}
	
	@Test
	public void testFindByUserId() {
		final List<Publication> publications = pbDao.findByUserId(USERID);
		String userid = "'" + USERID + "'";
	
		Assert.assertNotNull(publications);
		Assert.assertEquals(publications.size(), JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "publications", "userid = " + userid));
	}
	
	@Test
	public void testFindById() {
		final Publication pb = pbDao.findById(PUBLICATIONID);
		final Publication nonexistentpb = pbDao.findById(NONEXISTENTPUBLICATIONID);
		String publicationid = "'" + PUBLICATIONID + "'";
		String nonexistentpublicationid = "'" + NONEXISTENTPUBLICATIONID + "'";
		
		Assert.assertNotNull(pb);
		Assert.assertNull(nonexistentpb);
		Assert.assertEquals(1, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "publications", "publicationid = " + publicationid));
		Assert.assertEquals(0, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "publications", "publicationid = " + nonexistentpublicationid));
	}
	
	@Test
	public void testFindAll() {
		List<Publication> publications = pbDao.findAll(OPERATION);
		Assert.assertEquals(publications.size(), JdbcTestUtils.countRowsInTable(jdbcTemplate, "publications"));
	}

	@Test
	public void testFindSearchFiltering() {
		String operation1 = "TestOperation";
		String address1 = "TestAdress1";
		String price1 = "4350000";
		String bedrooms1 = "2";
		List<Publication> publications1 = pbDao.findSearchFiltering(operation1, address1, price1, bedrooms1);
		
		Assert.assertEquals(publications1.size(), JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "publications", "operation = '" + operation1
				+ "' AND address = '" + address1 + "' AND price = '" + price1 + "' AND bedrooms = '" + bedrooms1 + "'"));
	}
	
	@Test
	public void testDelete() {
		pbDao.deleteById(PUBLICATIONID);
		String pbid = "'" + PUBLICATIONID + "'";
		Assert.assertEquals(0, JdbcTestUtils.countRowsInTableWhere(jdbcTemplate, "publications", "publicationid = " + pbid));
	}
	
	@Test
	public void testDeleteNonExistentPublication() {
		int before = JdbcTestUtils.countRowsInTable(jdbcTemplate,"publications");
		pbDao.deleteById(NONEXISTENTPUBLICATIONID);
		int after = JdbcTestUtils.countRowsInTable(jdbcTemplate,"publications");
		Assert.assertEquals(before, after);
	}
}
