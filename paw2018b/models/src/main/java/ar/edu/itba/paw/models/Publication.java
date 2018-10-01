package ar.edu.itba.paw.models;

public class Publication {
	
	private long publicationid;
	private String title;
	private String address;
	private String neighborhood;
	private String city;
	private String province;
	private String operation;
	private Integer price;
	private String description;
	private String propertyType;
	private Integer bedrooms;
	private Integer bathrooms;
	private Integer floorSize;
	private Integer parking;
	private long userid;
	
	public Publication(long publicationid, String title, String address, String neighborhood, 
					   String city, String province, String operation, Integer price,
					   String description, String propertyType, Integer bedrooms,
					   Integer bathrooms, Integer floorSize, Integer parking, long userid) {
		
		this.publicationid = publicationid;
		this.title = title;
		this.address = address;
		this.setNeighborhood(neighborhood);
		this.setCity(city);
		this.setProvince(province);
		this.operation = operation;
		this.setPrice(price);
		this.description = description;
		this.propertyType = propertyType;
		this.setBedrooms(bedrooms);
		this.setBathrooms(bathrooms);
		this.setFloorSize(floorSize);
		this.setParking(parking);
		this.setUserid(userid);
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


	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getBedrooms() {
		return bedrooms;
	}

	public void setBedrooms(Integer bedrooms) {
		this.bedrooms = bedrooms;
	}

	public Integer getBathrooms() {
		return bathrooms;
	}

	public void setBathrooms(Integer bathrooms) {
		this.bathrooms = bathrooms;
	}

	public Integer getFloorSize() {
		return floorSize;
	}

	public void setFloorSize(Integer floorSize) {
		this.floorSize = floorSize;
	}

	public Integer getParking() {
		return parking;
	}

	public void setParking(Integer parking) {
		this.parking = parking;
	}

	public String getNeighborhood() {
		return neighborhood;
	}

	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

}
