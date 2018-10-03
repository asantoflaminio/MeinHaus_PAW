package ar.edu.itba.paw.interfaces;

import java.util.List;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.models.Publication;

@Service
public interface PublicationDao {
	
	public Publication findById(final long id); 
	
	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid);
	
	public List<Publication> findAll(String operation);
	
	public List<Publication> findByUserId(long id);
	
	public List<Publication> findSearch(String operation, String search);
	
	public List<Publication> findSearchFiltering(String operation, String address, String price, String bedrooms);
	
	public void deleteById(final long publicationdid);

}
