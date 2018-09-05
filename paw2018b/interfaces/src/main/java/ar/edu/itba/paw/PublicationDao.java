package ar.edu.itba.paw;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.models.Publication;

@Service
public interface PublicationDao {
	
	public Publication create(String title, String address,String operation, Integer price);

}