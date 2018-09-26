package ar.edu.itba.paw.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "images")
public class UploadFile {
    private Integer id;
    private String publicationId;
    private byte[] data;
    
    public UploadFile() {


    }
 
    
    
    @Id
    //@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "upload_id")
    public Integer getId() {
        return id;
    }
 
    public void setId(Integer id) {
        this.id = id;
    }
 
    @Column(name = "publicationid")
    public String getPublicationId() {
        return publicationId;
    }
 
    public void setPublicationId(String pub) {
        this.publicationId = pub;
    }

    @Column(name = "file_data")
    public byte[] getData() {
        return data;
    }
 
    public void setData(byte[] data) {
        this.data = data;
    }
}