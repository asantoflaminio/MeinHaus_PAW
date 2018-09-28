package ar.edu.itba.webapp.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class MessageForm {
	
	@Pattern(regexp = "[a-zA-Z ]+")
	@Size(min = 2, max = 15)
	private String name;
	
	@Size(min = 3, max = 30)
	@Email
	private String email;
	
	@Pattern(regexp = "[a-zA-Z0-9.@ ]+")
	@Size(min = 1, max = 60)
	private String message;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
