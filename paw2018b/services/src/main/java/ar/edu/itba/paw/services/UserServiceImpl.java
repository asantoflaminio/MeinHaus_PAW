package ar.edu.itba.paw.services;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.interfaces.UserDao;
import ar.edu.itba.paw.interfaces.UserService;
import ar.edu.itba.paw.models.User;

@Service
public class UserServiceImpl implements UserService{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDao userDaoInt;
	
	//@Autowired
	//private PasswordEncoder passwordEncoder;
	
	private final static int SHORT_STRING_MIN_LENGTH = 3;
	private final static int SHORT_STRING_MAX_LENGTH = 30;
	private final static int EMAIL_MAX_LENGTH = 250;
	private final static int LONG_STRING_MIN_LENGTH = 6;
	private final static int LONG_STRING_MAX_LENGTH = 30;
	private final static int LONG_STRING_MAX_LENGTH_PASS = 70;
	private final static String PASSWORD = "correct";
	
	private static final String LETTERSANDSPACESREGEX = "[a-zA-Z ]+";
	private static final String NUMBERSREGEX = "[0-9]+";
	private static final Pattern EMAILREGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		if(! validate(firstName, lastName, email, password, phoneNumber))
			return null;
		
		if(userDaoInt.findByUsername(email) != null)
			return null;
		
		return userDaoInt.create(firstName, lastName, email, password, phoneNumber);
	}
	
	public boolean editData(String firstName, String lastName, String email, String phoneNumber, String oldEmail) {
		if(! validate(firstName,lastName, email, PASSWORD, phoneNumber))
			return false;
		
		userDaoInt.editData(firstName, lastName, email, phoneNumber,userDaoInt.findByUsername(oldEmail).getUserId());
		LOGGER.trace("Editing data of user with email {}", email);
		return true;
	}
	
	public String editPassword(String oldPassword,String newPassword, String oldEmail) {
		User user = userDaoInt.findByUsername(oldEmail);
		if(! oldPassword.equals(user.getPassword()))
			return "error";
		if(! validatePassword(newPassword))
			return "exception";
		
		userDaoInt.editPassword(newPassword, user.getUserId());
		LOGGER.trace("Editing password of user with email {}", oldEmail);
		return "correct";
	}
	
	public User findById(final long userid) {
		if(userid < 0){
            LOGGER.error("Attempted to find a user with a negative id");
            throw new IllegalArgumentException("id must be positive");
        }
		
        LOGGER.trace("Looking up user with id {}", userid);
        return userDaoInt.findById(userid);
	}

	public User findByUsername(String email) {
		LOGGER.debug("Looking up user with email {}", email);
		return userDaoInt.findByUsername(email);
	}

	public boolean validate(String firstName, String lastName, String email, String password, String phoneNumber) {
		if(! validateFirstName(firstName) || ! validateLastName(lastName) || ! validateEmail(email)
				|| ! validatePassword(password) || ! validatePhone(phoneNumber))
			return false;
		
		LOGGER.debug("All fields are valid");
		LOGGER.trace("Creating user with email {} ", email);
		return true;
	}
	
	public boolean validateFirstName(String firstName) {
		if(firstName.length() > SHORT_STRING_MAX_LENGTH || firstName.length() < SHORT_STRING_MIN_LENGTH) {
			LOGGER.debug("First name length is wrong");
			return false;
		}
		if(! firstName.matches(LETTERSANDSPACESREGEX)) {
			LOGGER.debug("First name length is wrong");
			return false;
		}
		return true;
		
	}
	
	public boolean validateLastName(String lastName) {
		if(lastName.length() > SHORT_STRING_MAX_LENGTH || lastName.length() < SHORT_STRING_MIN_LENGTH) {
			LOGGER.debug("Last name length is wrong");
			return false;
		}
		if(! lastName.matches(LETTERSANDSPACESREGEX)) {
			LOGGER.debug("Last name length is wrong");
			return false;
		}
		return true;
	}
	
	public boolean validateEmail(String email) {
		if(email.length() > EMAIL_MAX_LENGTH || email.length() < SHORT_STRING_MIN_LENGTH) {
			LOGGER.debug("Email length is wrong");
			return false;
		}
		
		Matcher matcher = EMAILREGEX.matcher(email);
		if(! matcher.find()) {
			LOGGER.debug("Email format is wrong");
			return false;
		}	
		return true;
	}
	
	public boolean validatePassword(String password) {
		if(password.length() > LONG_STRING_MAX_LENGTH_PASS || password.length() < LONG_STRING_MIN_LENGTH) {
			LOGGER.debug("Password length is wrong");
			return false;
		}
		return true;
	}
	
	public boolean validatePhone(String phoneNumber) {
		if(phoneNumber.length() > LONG_STRING_MAX_LENGTH || phoneNumber.length() < LONG_STRING_MIN_LENGTH) {
			LOGGER.debug("Phone number length is wrong");
			return false;
		}
		if(! phoneNumber.matches(NUMBERSREGEX)) {
			LOGGER.debug("Phone number format is wrong");
			return false;
		}
		return true;
		
	}

}
