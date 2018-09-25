package ar.edu.itba.paw.persistence;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.itba.paw.FileUploadDao;
import ar.edu.itba.paw.models.UploadFile;

@Repository
public class FileUploadDAOImpl implements FileUploadDao {
    @Autowired
    private SessionFactory sessionFactory;
     
    public FileUploadDAOImpl() {
    }
 
    public FileUploadDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    public void save(UploadFile uploadFile) {
       sessionFactory.getCurrentSession().save(uploadFile);
    }
}
