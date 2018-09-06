package ar.edu.itba.paw.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.PublicationDao;
import ar.edu.itba.paw.PublicationService;
import ar.edu.itba.paw.models.Publication;

@Service
public class PublicationServiceImp implements PublicationService{
	
	@Autowired
	private PublicationDao publicationDao;
	
	public Publication create(String title, String address, String operation, String price) {
		return publicationDao.create(title, address, operation, price);
	}

}