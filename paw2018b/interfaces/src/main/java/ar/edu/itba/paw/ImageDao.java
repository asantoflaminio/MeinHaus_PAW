package ar.edu.itba.paw;

import java.util.List;

import org.springframework.stereotype.Service;

import ar.edu.itba.paw.models.UploadFile;

@Service
public interface ImageDao {
	
	public UploadFile findFirstById(long id);
	
	public UploadFile findByUploadId(int id);
	
	public List<UploadFile> findAllById(long id);
}
