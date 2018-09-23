package ar.edu.itba.paw.models;

public class User {

	private long userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phoneNumber;
	
	public User(long userId, String firstName, String lastName,
			String email, String password, String phoneNumber) {
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
		
	}
	
	public long getUserId() {
		return this.userId;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

}
