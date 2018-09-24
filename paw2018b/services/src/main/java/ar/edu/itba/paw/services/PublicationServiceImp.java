package ar.edu.itba.paw.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.PublicationDao;
import ar.edu.itba.paw.PublicationService;
import ar.edu.itba.paw.models.Publication;

@Service
public class PublicationServiceImp implements PublicationService{
	
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

}