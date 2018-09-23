package ar.edu.itba.paw.services;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.itba.paw.FileUploadDao;
import ar.edu.itba.paw.models.UploadFile;

@Service
public class FileUploadImpl implements FileUploadDao {
	
	@Autowired
    private SessionFactory sessionFactory;
	
	@Autowired
	private FileUploadDao fileUploadDao;
     
    public FileUploadImpl() {
    }
 
    public FileUploadImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional
    public void save(UploadFile uploadFile) {
    	fileUploadDao.save(uploadFile);
    	sessionFactory.getCurrentSession().save(uploadFile);
    }
}
