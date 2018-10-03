package ar.edu.itba.paw.services;
/*
import org.junit.Assert;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ar.edu.itba.paw.interfaces.UserDao;
import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.persistence.TestConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
public class UserServiceImplTest {

	private static final long USERID = 1;
	private static final long NONEXISTENTUSERID = 1;
	private static final String FIRSTNAME = "TestFirstName";
	private static final String LASTNAME = "TestLastName";
	private static final String EMAIL = "test1@mail.com";
	private static final String PASSWORD = "TestPassword";
	private static final String PHONENUMBER = "1522334455";
	
	private static final String INVALIDFIRSTNAME = "TestFirstName12345!";
	private static final String INVALIDLASTNAME = "TestLastName12345";
	private static final String INVALIDEMAIL = "test1";
	private static final String INVALIDPASSWORD = "TestPassword";
	private static final String INVALIDPHONENUMBER = "1522334455";
	
	
    @InjectMocks
    private UserServiceImpl userService;
	
    @Mock
    private UserDao userDao;
    
    private User user;
    
    @Rule
    public MockitoRule rule = MockitoJUnit.rule();
    
    @Before
    public void setUp() {
    	Mockito.reset(userDao);
    	
    	Mockito.when(userDao.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER)).thenReturn(new User(USERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER));
     //   Mockito.when(userDao.findByUsername(EMAIL)).thenReturn(new User(USERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER));
       // Mockito.when(userDao.findByUsername(NONEXISTENTEMAIL)).thenReturn(null);
    }
    
	@Test 
	public void createUserTest() {
	     User user = userService.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
	     Assert.assertNotNull(user); 
	     Assert.assertEquals(user.getFirstName(),FIRSTNAME);
	     Assert.assertEquals(user.getLastName(),LASTNAME);
	     Assert.assertEquals(user.getEmail(),EMAIL);
	     Assert.assertEquals(user.getPassword(),PASSWORD);
	     Assert.assertEquals(user.getPhoneNumber(),PHONENUMBER);
	}

	@Test
    public void testFindById(){
		Mockito.when(userDao.findById(USERID)).thenReturn(new User(USERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER));
		
		User userByID = userDao.findById(USERID);
		User user = userService.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
        User u1 = userService.findById(user.getUserId());
        Assert.assertNotNull(u1);
        Assert.assertNotNull(userByID);
        Assert.assertEquals(userByID,u1);
    }
	
	@Test
    public void testFindByNonExistentId(){
		Mockito.when(userDao.findById(NONEXISTENTUSERID)).thenReturn(null);
		
		User userByID = userDao.findById(NONEXISTENTUSERID);
		User user = userService.create(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
        User u1 = userService.findById(NONEXISTENTUSERID);
		Assert.assertNull(userByID);
        Assert.assertNull(u1);
        Assert.assertEquals(userByID,u1);
		
    }
	
	
	@Test
	public void testValidate() {
		User user = userService.create(INVALIDFIRSTNAME, LASTNAME, EMAIL, PASSWORD, PHONENUMBER);
		Assert.assertNull(user);
	}

}*/