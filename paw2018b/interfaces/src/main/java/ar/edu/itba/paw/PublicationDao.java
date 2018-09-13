package ar.edu.itba.paw;

import java.util.List;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.User;

@Service
public interface PublicationDao {
	
	public Publication findById(final long id); 
	
	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking);
	
	public List<Publication> findAll(String operation);
	
	public List<Publication> findSearch(String operation, String search);

}
