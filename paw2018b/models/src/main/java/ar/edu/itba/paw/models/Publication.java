package ar.edu.itba.paw.models;

public class Publication {
	
	private String title;
	private String address;
	private String operation;
	private String price;
	
	public Publication(String title, String address, String operation, String price) {
		this.title = title;
		this.address = address;
		this.operation = operation;
		this.price = price;
	}
	
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
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

}
