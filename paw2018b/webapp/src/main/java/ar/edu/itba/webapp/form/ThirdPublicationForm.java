package ar.edu.itba.webapp.form;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ThirdPublicationForm extends SecondPublicationForm {
	
	@Size(min = 1, max = 2)
	@Pattern(regexp = "[0-9]+")
	private String bedrooms;
	
	@Size(min = 1, max = 2)
	@Pattern(regexp = "[0-9]+")
	private String bathrooms;
	
	@Size(min = 1, max = 3)
	@Pattern(regexp = "[0-9]+")
	private String floorSize;
	
	@Size(min = 1, max = 2)
	@Pattern(regexp = "[0-9]+")
	private String parking;

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
