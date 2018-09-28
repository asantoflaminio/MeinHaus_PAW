package ar.edu.itba.paw;

import java.util.List;

import ar.edu.itba.paw.models.Publication;

public interface PublicationService {

	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid);
	
	public Publication findById(final long publicationid);
	
	public boolean validate(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid);
	
	public List<Publication> findAll(String operation);
	
	public List<Publication> findSearch(String operation, String search);
	
	public List<Publication> findSearchFiltering(String operation, String address, String price, String bedrooms);
}
