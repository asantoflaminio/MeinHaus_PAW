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
    private String address;
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
 
    @Column(name = "address")
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "file_data")
    public byte[] getData() {
        return data;
    }
 
    public void setData(byte[] data) {
        this.data = data;
    }
}