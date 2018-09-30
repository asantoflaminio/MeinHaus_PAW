package ar.edu.itba.paw.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import ar.edu.itba.paw.ImageDao;
import ar.edu.itba.paw.models.UploadFile;

@Repository
public class ImageJdbcDao implements ImageDao{

	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private final static RowMapper<UploadFile> ROW_MAPPER = new RowMapper<UploadFile>(){

		public UploadFile mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new UploadFile(
							rs.getInt("upload_id"),
							rs.getString("publicationid"),	
							rs.getBytes("file_data")
							);
		}
		
	};
	
	@Autowired
	public ImageJdbcDao(final DataSource dateSource){
		jdbcTemplate = new JdbcTemplate(dateSource);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("image")
				.usingGeneratedKeyColumns("upload_id")
				.usingColumns("title","address","operation","price","description","propertyType","bedrooms",
							  "bathrooms","floorSize","parking","userid");
	}

	public UploadFile findFirstById(long id) {
		final List<UploadFile> list = jdbcTemplate.query("SELECT * FROM images WHERE publicationid = ?",ROW_MAPPER,Long.toString(id));
		if(list.isEmpty())
			return null;
		return list.get(0);
	}
	
	public UploadFile findByUploadId(int id) {
		final List<UploadFile> list = jdbcTemplate.query("SELECT * FROM images WHERE upload_id = ?",ROW_MAPPER,id);
		if(list.isEmpty())
			return null;
		return list.get(0);
	}
	
	public List<UploadFile> findAllById(long id) {
		final List<UploadFile> list = jdbcTemplate.query("SELECT * FROM images WHERE publicationid = ?",ROW_MAPPER,Long.toString(id));
		if(list.isEmpty())
			return null;
		return list;
	}
	
	

}