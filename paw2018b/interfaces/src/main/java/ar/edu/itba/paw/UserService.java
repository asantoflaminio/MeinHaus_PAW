package ar.edu.itba.paw;

import ar.edu.itba.paw.models.User;

public interface UserService {
	
	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber);
	
	public User findById(final long userid);

	public User findByUsername(String username);
	
	public boolean validate(String firstName, String lastName,String email,
			String password, String phoneNumber);
	

}
