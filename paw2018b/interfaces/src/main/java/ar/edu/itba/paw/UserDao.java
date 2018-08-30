package ar.edu.itba.paw;

import java.util.Optional;

import ar.edu.itba.paw.models.User;

public interface UserDao{
	
	public Optional<User> findById(final long id); 
	
	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber);
	
}