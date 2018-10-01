package ar.edu.itba.webapp.form;

import javax.validation.constraints.Size;

public class PasswordForm {
	
	@Size(min = 6, max = 30)
	private String passwordOld;
	
	@Size(min = 6, max = 30)
	private String passwordNew;

	public String getPasswordOld() {
		return passwordOld;
	}

	public void setPasswordOld(String passwordOld) {
		this.passwordOld = passwordOld;
	}

	public String getPasswordNew() {
		return passwordNew;
	}

	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}

}
