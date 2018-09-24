package ar.edu.itba.webapp.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class ProfileForm {
	
	@Size(min = 3, max = 20)
	@Pattern(regexp = "[a-zA-Z]+")
	private String firstName;
	
	@Size(min = 3, max = 20)
	@Pattern(regexp = "[a-zA-Z]+")
	private String lastName;
	
	@Size(min = 3, max = 20)
	@Email
	private String email;
	
	@Size(min = 6, max = 20)
	private String password;
	
	@Size(min = 6, max = 20)
	@Pattern(regexp = "[0-9]+")
	private String phoneNumber;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

}
