package ar.edu.itba.paw.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.UserDao;
import ar.edu.itba.paw.UserService;
import ar.edu.itba.paw.models.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDaoInt;

	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		return userDaoInt.create(firstName, lastName, email,
				password, phoneNumber);
	}
	
	public User findById(final long userid) {
		return userDaoInt.findById(userid);
	}

}
