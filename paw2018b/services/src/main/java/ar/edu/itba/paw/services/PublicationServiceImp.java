package ar.edu.itba.paw.services;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.interfaces.PublicationDao;
import ar.edu.itba.paw.interfaces.PublicationService;
import ar.edu.itba.paw.models.Publication;

@Service
public class PublicationServiceImp implements PublicationService{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);
	
	private final static int FIRST_FORM_MIN_LENGTH = 3;
	private final static int FIRST_FORM_MAX_LENGTH = 50;
	private final static int FIRST_FORM_MAX_LENGTH_ADDRESS = 140;
	private final static int SECOND_FORM_MIN_LENGTH = 1;
	private final static int SECOND_FORM_MAX_LENGTH = 2500;
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
	
	public void deleteById(final long publicationdid) {
		publicationDao.deleteById(publicationdid);
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
		final String lettesNumersAndSpacesRegexComma = "[a-zA-Z0-9, ]+";
		final String descriptionRegex = "[a-zA-Z0-9 ]+";
		
		if(title.length() > FIRST_FORM_MAX_LENGTH || title.length() < FIRST_FORM_MIN_LENGTH) {
			LOGGER.debug("Title length is wrong");
			return false;
		}
		
		if(address.length() > FIRST_FORM_MAX_LENGTH_ADDRESS|| address.length() < FIRST_FORM_MIN_LENGTH) {
			LOGGER.debug("Address length is wrong");
			return false;
		}
		
		if(! title.matches(lettesNumersAndSpacesRegex) || ! address.matches(lettesNumersAndSpacesRegexComma))
			return false;
		
		if(price.length() > FIRST_FORM_MAX_LENGTH || price.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(! price.matches(numbersRegex)) {
			LOGGER.debug("Price format is wrong");
			return false;
		}
		
		if(! operation.equals("FSale") && ! operation.equals("FRent"))
			return false;
		
		if(description.length() > SECOND_FORM_MAX_LENGTH || description.length() < SECOND_FORM_MIN_LENGTH) {
			LOGGER.debug("Description length is wrong");
			return false;
		}
		
		if(! description.matches(descriptionRegex))
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
		
		LOGGER.debug("The publication with title {} of user {} is valid", title, userid);
		return true;
	}

}