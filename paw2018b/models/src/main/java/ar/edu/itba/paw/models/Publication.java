package ar.edu.itba.paw.models;

public class Publication {
	
	private long publicationid;
	private String title;
	private String address;
	private String operation;
	private String price;
	private String description;
	private String propertyType;
	private String bedrooms;
	private String bathrooms;
	private String floorSize;
	private String parking;
	
	public Publication(long publicationid, String title, String address, String operation, String price,
					   String description, String propertyType, String bedrooms,
					   String bathrooms, String floorSize, String parking) {
		
		this.publicationid = publicationid;
		this.title = title;
		this.address = address;
		this.operation = operation;
		this.price = price;
		this.description = description;
		this.propertyType = propertyType;
		this.bedrooms = bedrooms;
		this.bathrooms = bathrooms;
		this.floorSize = floorSize;
		this.parking = parking;
	}
	
	public long getPublicationid() {
		return publicationid;
	}

	public void setPublicationid(long publicationid) {
		this.publicationid = publicationid;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getBedrooms() {
		return bedrooms;
	}

	public void setBedrooms(String bedrooms) {
		this.bedrooms = bedrooms;
	}

	public String getBathrooms() {
		return bathrooms;
	}

	public void setBathrooms(String bathrooms) {
		this.bathrooms = bathrooms;
	}

	public String getFloorSize() {
		return floorSize;
	}

	public void setFloorSize(String floorSize) {
		this.floorSize = floorSize;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

}
