package ar.edu.itba.persistence;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.paw.FileUploadDao;
import ar.edu.itba.paw.models.UploadFile;

@Repository
public class FileUpload implements FileUploadDao {
    
	@Autowired
    private SessionFactory sessionFactory;
     
    public FileUpload() {
    }
 
    public FileUpload(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    public void save(UploadFile uploadFile) {
       sessionFactory.getCurrentSession().save(uploadFile);
    }
}
