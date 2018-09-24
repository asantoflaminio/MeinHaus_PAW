package ar.edu.itba.webapp.form;

import javax.validation.constraints.Size;

public class NewPasswordForm {

	@Size(min = 6, max = 20)
	private String password;
	
	@Size(min = 6, max = 20)
	private String newpassword;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNewPassword() {
		return newpassword;
	}

	public void setNewPassword(String password) {
		this.newpassword = password;
	}
}
