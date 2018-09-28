package ar.edu.itba.paw.services;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.UserDao;
import ar.edu.itba.paw.UserService;
import ar.edu.itba.paw.models.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDaoInt;
	
	private final static int SHORT_STRING_MIN_LENGTH = 3;
	private final static int SHORT_STRING_MAX_LENGTH = 30;
	private final static int LONG_STRING_MIN_LENGTH = 6;
	private final static int LONG_STRING_MAX_LENGTH = 30;

	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		if(! validate(firstName, lastName, email,
				password, phoneNumber))
			return null;
		
		return userDaoInt.create(firstName, lastName, email,
				password, phoneNumber);
	}
	
	public User findById(final long userid) {
		return userDaoInt.findById(userid);
	}

	public User findByUsername(String username) {
		return userDaoInt.findByUsername(username);
	}

	public boolean validate(String firstName, String lastName, String email, String password, String phoneNumber) {
		
		final String lettesAndSpacesRegex = "[a-zA-Z ]+";
		final String numbersRegex = "[0-9]+";
		final Pattern emailRegex = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
		
		if(firstName.length() > SHORT_STRING_MAX_LENGTH || firstName.length() < SHORT_STRING_MIN_LENGTH)
			return false;
		
		if(lastName.length() > SHORT_STRING_MAX_LENGTH || lastName.length() < SHORT_STRING_MIN_LENGTH)
			return false;
		
		if(email.length() > SHORT_STRING_MAX_LENGTH || email.length() < SHORT_STRING_MIN_LENGTH)
			return false;
		
		if(password.length() > LONG_STRING_MAX_LENGTH || password.length() < LONG_STRING_MIN_LENGTH)
			return false;
		
		if(phoneNumber.length() > LONG_STRING_MAX_LENGTH || phoneNumber.length() < LONG_STRING_MIN_LENGTH)
			return false;
		
		if(! firstName.matches(lettesAndSpacesRegex))
			return false;
		
		if(! lastName.matches(lettesAndSpacesRegex))
			return false;
		
		Matcher matcher = emailRegex.matcher(email);
		
		if(! matcher.find())
			return false;
		
		if(! phoneNumber.matches(numbersRegex))
			return false;
		
		System.out.println("Pasa el validate del back");
		return true;
	}

}
