package ar.edu.itba.webapp.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class SecondPublicationForm extends FirstPublicationForm {
	
	@Size(min = 1, max = 60)
	@Pattern(regexp = "[-a-zA-Z0-9,.!?:%;()$\r\n ]+")
	private String description;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
