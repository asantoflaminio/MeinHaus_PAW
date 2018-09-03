package ar.edu.itba.paw;

import ar.edu.itba.paw.models.Publication;

public interface PublicationService {

	public Publication create(String title, String address,String operation, Integer price);
}
