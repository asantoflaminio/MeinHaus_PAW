package ar.edu.itba.paw.interfaces;

import ar.edu.itba.paw.models.User;

public interface UserService {
	
	public User create(String firstName, String lastName,String email,
			String password, String phoneNumber);
	
	public User findById(final long userid);

	public User findByUsername(String email);
	
	public boolean editData(String firstName, String lastName, String email, String phoneNumber, String oldEmail);
	
	public String editPassword(String oldPassword,String newPassword, String oldEmail);
	

}
