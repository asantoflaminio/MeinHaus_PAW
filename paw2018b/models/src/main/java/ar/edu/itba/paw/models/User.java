package ar.edu.itba.paw.models;

public class User {

	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phoneNumber;
	
	public User(String firstName, String lastName,String email,
			String password, String phoneNumber) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
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
