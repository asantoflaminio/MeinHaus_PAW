package ar.edu.itba.paw.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.PublicationDao;
import ar.edu.itba.paw.PublicationService;
import ar.edu.itba.paw.models.Publication;

@Service
public class PublicationServiceImp implements PublicationService{
	
	private final static int FIRST_FORM_MIN_LENGTH = 20;
	private final static int FIRST_FORM_MAX_LENGTH = 20;
	private final static int SECOND_FORM_MIN_LENGTH = 1;
	private final static int SECOND_FORM_MAX_LENGTH = 180;
	
	@Autowired
	private PublicationDao publicationDao;
	
	public Publication create(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid) {
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
	
	public List<Publication> findSearch(String operation, String search){
		return publicationDao.findSearch(operation,search);
	}
	
	public List<Publication> findSearchFiltering(String operation, String address, String price, String bedrooms){
		return publicationDao.findSearchFiltering(operation, address, price, bedrooms);
	}
	
	public boolean validate(String title, String address, String operation, String price,
			   String description, String propertyType, String bedrooms,
			   String bathrooms, String floorSize, String parking, long userid){
		
		final String lettesAndSpacesRegex = "[a-zA-Z ]+";
		final String numbersRegex = "[0-9]+";
		
		if(title.length() > FIRST_FORM_MAX_LENGTH || title.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(address.length() > FIRST_FORM_MAX_LENGTH || address.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(! title.matches(lettesAndSpacesRegex) || ! address.matches(lettesAndSpacesRegex))
			return false;
		
		if(price.length() > FIRST_FORM_MAX_LENGTH || price.length() < FIRST_FORM_MIN_LENGTH)
			return false;
		
		if(! price.matches(numbersRegex))
			return false;
		
		if(! operation.equals("FSale") && ! operation.equals("FRent"))
			return false;
		
		
		
		
		return true;
	}

}