package ar.edu.itba.paw.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.PublicationDao;
import ar.edu.itba.paw.PublicationService;
import ar.edu.itba.paw.models.Publication;

@Service
public class PublicationServiceImp implements PublicationService{
	
	private final static int FIRST_FORM_MIN_LENGTH = 3;
	private final static int FIRST_FORM_MAX_LENGTH = 20;
	private final static int SECOND_FORM_MIN_LENGTH = 1;
	private final static int SECOND_FORM_MAX_LENGTH = 180;
	private final static int THIRD_FORM_MIN_LENGTH = 1;
	private final static int THIRD_FORM_MAX_LENGTH = 3;
	
	@Autowired
	private PublicationDao publicationDao;
	
	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid) {
		
		if(! validate(title, address, operation, price,
				   description, propertyType, bedrooms,
				   bathrooms, floorSize, parking, userid))
			return null;
			
		return publicationDao.create(title, address, operation, price,
				   description, propertyType, bedrooms,
				   bathrooms, floorSize, parking, userid);
	}
	
	public Publication findById(final long publicationid) {
		return publicationDao.findById(publicationid);
	}
	
	public List<Publication> findAll(String operation){
		return publicationDao.findAll(operation);
	}
	
	public List<Publication> findByUserId(long id){
		return publicationDao.findByUserId(id);
	}
	
	public List<Publication> findSearch(String operation, String search){
		return publicationDao.findSearch(operation,search);
	}
	
	public List<Publication> findSearchFiltering(String operation, String address, String price, String bedrooms){
		return publicationDao.findSearchFiltering(operation, address, price, bedrooms);
	}
	
	public boolean validate(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid){
		
		final String numbersRegex = "[0-9]+";
		final String lettesNumersAndSpacesRegex = "[a-zA-Z0-9 ]+";
		
		
		System.out.println("analizando");
		if(title.length() > FIRST_FORM_MAX_LENGTH || title.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		System.out.println("analizando");
		if(address.length() > FIRST_FORM_MAX_LENGTH || address.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(! title.matches(lettesNumersAndSpacesRegex) || ! address.matches(lettesNumersAndSpacesRegex))
			return false;
		System.out.println("analizando");
		if(price.length() > FIRST_FORM_MAX_LENGTH || price.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(! price.matches(numbersRegex))
			return false;
		System.out.println("analizando");
		if(! operation.equals("FSale") && ! operation.equals("FRent"))
			return false;
		
		if(description.length() > SECOND_FORM_MAX_LENGTH || description.length() < SECOND_FORM_MIN_LENGTH)
			return false;
		System.out.println("analizando");
		if(! description.matches(lettesNumersAndSpacesRegex))
			return false;
		
		if(! propertyType.equals("House") && ! propertyType.equals("Apartment"))
			return false;
		
		if(bedrooms.length() > THIRD_FORM_MAX_LENGTH || bedrooms.length() < THIRD_FORM_MIN_LENGTH)
			return false;
		
		if(bathrooms.length() > THIRD_FORM_MAX_LENGTH || bathrooms.length() < THIRD_FORM_MIN_LENGTH)
			return false;
		
		if(floorSize.length() > THIRD_FORM_MAX_LENGTH || floorSize.length() < THIRD_FORM_MIN_LENGTH)
			return false;
		
		if(parking.length() > THIRD_FORM_MAX_LENGTH || parking.length() < THIRD_FORM_MIN_LENGTH)
			return false;
		
		if(! bedrooms.matches(numbersRegex) || ! bathrooms.matches(numbersRegex) || ! floorSize.matches(numbersRegex)
			|| ! parking.matches(numbersRegex))
			return false;
		
		System.out.println("Pasa el validate del back");
		
		return true;
	}

}