package ar.edu.itba.paw;


import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import ar.edu.itba.paw.models.User;

@Service
public interface UserDao{
	
	public User findById(final long id); 
	
	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber);
	
}