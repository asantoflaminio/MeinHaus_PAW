package ar.edu.itba.paw.models;

public class ListFilters {
	private String price;
	private String bedrooms;
	
	public ListFilters(String price, String bedrooms) {
		this.price = price;
		this.bedrooms = bedrooms;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBedrooms() {
		return bedrooms;
	}
	public void setBedrooms(String bedrooms) {
		this.bedrooms = bedrooms;
	}
}
