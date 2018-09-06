package ar.edu.itba.webapp.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class FirstPublicationForm {
	
	@Size(min = 3, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9 ]+")
	private String title;
	
	@Size(min = 3, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9 ]+")
	private String address;
	
	private boolean Operation;
	
	@Size(min = 3, max = 20)
	@Pattern(regexp = "[0-9]+")
	private String price;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isOperation() {
		return Operation;
	}
	public void setOperation(boolean operation) {
		Operation = operation;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	

}
