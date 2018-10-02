package ar.edu.itba.paw.services;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.paw.FileUploadDao;
import ar.edu.itba.paw.models.UploadFile;

@Repository
public class FileUploadImple implements FileUploadDao {
    
	@Autowired
    private SessionFactory sessionFactory;
     
    public FileUploadImple() {
    }
 
    public FileUploadImple(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    public void save(UploadFile uploadFile) {
       sessionFactory.getCurrentSession().save(uploadFile);
    }
}
