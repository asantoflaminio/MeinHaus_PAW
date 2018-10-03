package ar.edu.itba.paw.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.itba.paw.interfaces.ImageDao;
import ar.edu.itba.paw.models.UploadFile;

@Service
public class ImageServiceImp implements ImageDao{
	
	@Autowired
	private ImageDao imageDao;

	public UploadFile findFirstById(long id) {
		return imageDao.findFirstById(id);
	}
	
	public UploadFile findByUploadId(int id) {
		return imageDao.findByUploadId(id);
	}

	public List<UploadFile> findAllById(long id) {
		return imageDao.findAllById(id);
	}
	
	public void deleteById(long publicationid) {
		imageDao.deleteById(publicationid);
	}
	
	

}
