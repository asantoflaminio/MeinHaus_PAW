package ar.edu.itba.paw.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.itba.paw.interfaces.FileUploadDao;
import ar.edu.itba.paw.models.UploadFile;

@Service
public class FileUploadImpl {

    @Autowired
    private FileUploadDao fileUploadDao;

    public FileUploadImpl() {
    }

    @Transactional
    public void save(UploadFile uploadFile) {
        fileUploadDao.save(uploadFile);
    }

}
