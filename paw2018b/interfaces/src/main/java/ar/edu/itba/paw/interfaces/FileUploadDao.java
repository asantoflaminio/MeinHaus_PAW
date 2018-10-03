package ar.edu.itba.paw.interfaces;

import ar.edu.itba.paw.models.UploadFile;

public interface FileUploadDao {
   void save(UploadFile uploadFile);
}