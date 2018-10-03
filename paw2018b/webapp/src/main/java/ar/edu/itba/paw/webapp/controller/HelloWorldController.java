package ar.edu.itba.paw.webapp.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.UploadFile;
import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.services.FileUploadImpl;
import ar.edu.itba.paw.services.ImageServiceImp;
import ar.edu.itba.paw.services.MailServiceImpl;
import ar.edu.itba.paw.services.PublicationServiceImp;
import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.FirstPublicationForm;
import ar.edu.itba.webapp.form.FourthPublicationForm;
import ar.edu.itba.webapp.form.HomeSearchForm;
import ar.edu.itba.webapp.form.MessageForm;
import ar.edu.itba.webapp.form.SecondPublicationForm;
import ar.edu.itba.webapp.form.ThirdPublicationForm;

@Controller
@RequestMapping("/meinHaus/")
@ComponentScan({ "ar.edu.itba.paw.webapp.controller","ar.edu.itba.paw.webapp.form", "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence", "ar.edu.itba.paw.webapp.models" })
public class HelloWorldController {
	
	@Autowired
	private UserServiceImpl us;
	
	@Autowired
	private PublicationServiceImp ps;
	
	/*@Autowired
    private FileUploadDao fileUploadDao;*/
	
	@Autowired
	private FileUploadImpl fileUploadImpl;
	
	@Autowired
	private ImageServiceImp imageServiceImp;
	
	@Autowired
	private MailServiceImpl ms;
	
	@Autowired
	ServletContext servletContext;
	
	
	@RequestMapping("home")
	public ModelAndView home(@ModelAttribute("homeSearchForm") final HomeSearchForm form, @RequestParam(value = "error", required=false) String error) {
		System.out.println("Home");
		final ModelAndView mav = new ModelAndView("home");
		mav.addObject("error",error);
		return mav;
	}
	
	@RequestMapping(value = "home",method = RequestMethod.POST)
	public ModelAndView homeLogin() {
		System.out.println("Me llamo login");
		final ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@RequestMapping(value = "homeSearch",method = RequestMethod.POST)
	public ModelAndView homeSearch(@Valid @ModelAttribute("homeSearchForm") final HomeSearchForm form, final BindingResult errors,
								   @RequestParam("oper") String operation) {
		System.out.println("Me llamo list");
		if(errors.hasErrors()) {
			System.out.println("Tengo errores :c");
			return home(form,null);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/list");
		mav.addObject("operation", operation);
		if(! form.getSearch().equals(""))
			mav.addObject("address", form.getSearch());
		else
			mav.addObject("address", "all");
		mav.addObject("page",1);
		return mav;
	}

	
	@RequestMapping("list")
	public ModelAndView list(@ModelAttribute("homeSearchForm") final HomeSearchForm form, @RequestParam("operation") String operation,
			@RequestParam("address") String address, @RequestParam(value = "page", defaultValue="1") String page, 
			@RequestParam(value = "price", required=false) String price,
			@RequestParam(value = "bedrooms", required=false) String bedrooms) {
		System.out.println("en List");
		List<Publication> publications;
		final ModelAndView mav = new ModelAndView("list");
		if((price == null && bedrooms == null) || (price.equals("") && bedrooms.equals(""))) {
			if(address.equals("all")) 
				publications = ps.findAll(operation);
			else
				publications = ps.findSearch(operation,address);
		}else {
			publications = ps.findSearchFiltering(operation,address,price,bedrooms);
		}
		if(page != null)
			mav.addObject("page", page);
		else
			mav.addObject("page", 1);
		mav.addObject("operation", operation);
		mav.addObject("address", address);
		mav.addObject("publications", publications);
		mav.addObject("bedrooms",bedrooms);
		mav.addObject("price",price);
		return mav;
	}
	
	
	@RequestMapping(value = "list" ,method = RequestMethod.POST)
	public ModelAndView listSearch(@Valid @ModelAttribute("homeSearchForm") final HomeSearchForm form, final BindingResult errors,
			   						@RequestParam("oper") String operation, @RequestParam(value = "page", defaultValue="1") String page,
			   						@RequestParam(value = "price", required=false) String price,
			   						@RequestParam(value = "bedrooms", required=false) String bedrooms){
		System.out.println("Bedrooms:" + bedrooms);
		if (errors.hasErrors()) {
			return list(form, operation,form.getSearch(),page,price,bedrooms);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/list");
		
		if(page != null)
			mav.addObject("page", page);
		else
			mav.addObject("page", 1);
		if(! form.getSearch().equals(""))
			mav.addObject("address", form.getSearch());
		else
			mav.addObject("address", "all");
		
		mav.addObject("operation", operation); 
		mav.addObject("bedrooms",bedrooms);
		mav.addObject("price",price);
		return mav;
	}
	
	
	
	@RequestMapping(value = "details", method = RequestMethod.GET)
	public ModelAndView details(@ModelAttribute("MessageForm") final MessageForm form, @RequestParam("publicationid") String publicationid,
								@RequestParam(value = "sent", required=false) String sent) {
		System.out.println("Details");
		final Publication pub = ps.findById(Integer.valueOf(publicationid));
		final User user = us.findById(pub.getUserid());
	    final ModelAndView mav = new ModelAndView("details");
	    
	    List<UploadFile> myImages = imageServiceImp.findAllById(pub.getPublicationid());
	    
	    if(myImages == null) {
	    	UploadFile aux = new UploadFile(-1, "Default", null);
	    	myImages = new ArrayList<UploadFile>();
	    	myImages.add(aux);
	    	mav.addObject("amountImages", 1);
	    }else {
	    	mav.addObject("amountImages", myImages.size());
	    }	 
	    mav.addObject("myImages", myImages);
	    mav.addObject("address", pub.getAddress());
	    mav.addObject("title", pub.getTitle());
	    mav.addObject("price", "$" + pub.getPrice());
	    mav.addObject("description", pub.getDescription());
	    mav.addObject("bedrooms", pub.getBedrooms());
	    mav.addObject("bathrooms", pub.getBathrooms());
	    mav.addObject("parking", pub.getParking());
	    mav.addObject("floorSize", pub.getFloorSize());
	    mav.addObject("phoneNumber",user.getPhoneNumber());
	    mav.addObject("publicationid", pub.getPublicationid());
	    mav.addObject("sellerEmail",user.getEmail());
	    mav.addObject("sent", sent);
	    
	    return mav;
	}
	
	@RequestMapping(value = "detailsSend", method = RequestMethod.POST)
	public ModelAndView detailsMessage(@Valid @ModelAttribute("MessageForm") final MessageForm form, final BindingResult errors,
									   @RequestParam("publicationid") String publicationid, @RequestParam("emailSeller") String email) throws AddressException, MessagingException{
		System.out.println("Details send email: " + email);
		if (errors.hasErrors()) {
			System.out.println("Errors: " + errors.getErrorCount());
			return details(form, publicationid,null);
		}
		final String sent = "true";
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/details");
		
		ms.sendEmail(email,form.getEmail(), form.getMessage());
		
		mav.addObject("publicationid",publicationid);
		mav.addObject("sent",sent);
		return mav;
	}
	@RequestMapping(value = "publish")
	public ModelAndView publish(@ModelAttribute("firstPublicationForm") final FirstPublicationForm form) {
		final ModelAndView mav = new ModelAndView("publish");
		return mav;
	}

	
	@RequestMapping(value = "publish" ,method = RequestMethod.POST)
	public ModelAndView publish(@Valid @ModelAttribute("firstPublicationForm") final FirstPublicationForm form, final BindingResult errors, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
			return publish(form);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/publish2");
		mav.addObject("title", form.getTitle());
		mav.addObject("address", form.getAddress());
		mav.addObject("price", form.getPrice());
		mav.addObject("operation",operation);
		return mav;
	}
		
	@RequestMapping(value = "publish2")
	public ModelAndView publish2(@ModelAttribute("secondPublicationForm") final SecondPublicationForm form, @RequestParam("operation") String operation) {
		final ModelAndView mav = new ModelAndView("publish2");
		mav.addObject("operation",operation);
		return mav;
	}
	
	@RequestMapping(value = "publish2" ,method = RequestMethod.POST)
	public ModelAndView publish2(@Valid @ModelAttribute("secondPublicationForm") final SecondPublicationForm form, final BindingResult errors, 
								 @RequestParam("type") String type, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
				
			return publish2(form,operation);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/publish3");
		mav.addObject("title", form.getTitle());
		mav.addObject("address", form.getAddress());
		mav.addObject("price", form.getPrice());
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		mav.addObject("description",form.getDescription());
		return mav;
	}
	
	@RequestMapping(value = "publish3")
	public ModelAndView publish3(@ModelAttribute("thirdPublicationForm") final ThirdPublicationForm form, @RequestParam("operation") String operation, @RequestParam("type") String type) {
		final ModelAndView mav = new ModelAndView("publish3");
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		return mav;
	}
	
	@RequestMapping(value = "publish3" ,method = RequestMethod.POST)
	public ModelAndView publish3(@Valid @ModelAttribute("thirdPublicationForm") final ThirdPublicationForm form, final BindingResult errors,
								 @RequestParam("type") String type, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
			return publish3(form,operation,type);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/publish4");
		mav.addObject("title", form.getTitle());
		mav.addObject("address", form.getAddress());
		mav.addObject("price", form.getPrice());
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		mav.addObject("description",form.getDescription());
		mav.addObject("bedrooms",form.getBedrooms());
		mav.addObject("bathrooms",form.getBathrooms());
		mav.addObject("floorSize",form.getFloorSize());
		mav.addObject("parking",form.getParking());
		//System.out.println("operation: "+ operation);
		//System.out.println("type: "+ type);
		//ps.create(form.getTitle(), form.getAddress(), operation, form.getPrice(), form.getDescription(), 
		//		type, form.getBedrooms(), form.getBathrooms(), form.getFloorSize(), form.getParking());
		return mav;
	}
	
	@RequestMapping("publish4")
	public ModelAndView publish4(@ModelAttribute("fourthPublicationForm") final FourthPublicationForm form,
			 @RequestParam("type") String type, @RequestParam("operation") String operation) {
		final ModelAndView mav = new ModelAndView("publish4");
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		return mav;
	}
	
	@RequestMapping(value = "publish4" ,method = RequestMethod.POST)
	public ModelAndView publish4(@Valid @ModelAttribute("fourthPublicationForm") final FourthPublicationForm form, final BindingResult errors,
								 @RequestParam("type") String type, @RequestParam("operation") String operation , @RequestParam CommonsMultipartFile[] fileUpload) {
		if (errors.hasErrors()) {
			ModelAndView mav = publish4(form,type, operation);
			return mav;
		}
		
		
		if(fileUpload.length > 15) {
			
			ModelAndView mav = publish4(form,type, operation);
			List<String> l= new ArrayList<String>();
			l.add("Too many files");
			mav.addObject("maxFiles", l);
			return mav;

		}
		
		long userid = us.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName()).getUserId();
		Publication aux = ps.create(form.getTitle(), form.getAddress(), operation, form.getPrice(), form.getDescription(), 
				type, form.getBedrooms(), form.getBathrooms(), form.getFloorSize(), form.getParking(),userid);
		
		if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload){
            	
                
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                //hay que chequear q si o si sea jpg o el formato q queramos
                UploadFile uploadFile = new UploadFile();
                
                uploadFile.setId((int) (Math.random()*1000000));
                
                uploadFile.setPublicationId(Long.toString(aux.getPublicationid())); 
                
                uploadFile.setData(aFile.getBytes());
               
                final long limit = 20 * 1024 * 1024; //20MB
                
                System.out.println("I'm about to save with id: " + uploadFile.getId());
                if(aFile.getSize() < limit && uploadFile.getData().length > 0) {
                	if(aFile.getContentType().equals("image/jpeg")) {
                		fileUploadImpl.save(uploadFile); 
                	}else {
                		System.out.println("Sth went wrong with file format");
                	}
                	
                }else {
                	System.out.println("File is too big or it's empty");
                }
                
                
            }
        }
		return new ModelAndView("redirect:/meinHaus/home");
	}
	
	@ExceptionHandler({MultipartException.class})
	public ModelAndView handleMaxSizeException(Exception excptn, HttpServletRequest request) {
		System.out.println("I'm here");
		return new ModelAndView("redirect:/meinHaus/home");
	}
	


	@RequestMapping(value = "/images/{uniqueId}",method = RequestMethod.GET)
    public ResponseEntity<byte[]> getFirstPic(@PathVariable long uniqueId) {

        try{ 

        	UploadFile ufa = imageServiceImp.findFirstById(uniqueId);
            
            if(ufa == null) {
            	String relativeWebPath = "/resources/pics/default.jpg";
            	InputStream input =  servletContext.getResourceAsStream(relativeWebPath);
            	byte[] fileContent =  IOUtils.toByteArray(input);
            	final HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.IMAGE_JPEG);
                return new ResponseEntity<byte[]>(fileContent, headers, HttpStatus.OK);
            
            }
            
           
            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);
            return new ResponseEntity<byte[]>(ufa.getData(), headers, HttpStatus.OK);
            
        }catch(Exception ex){
            ex.printStackTrace();
        	System.out.println("Sth went wrong");
            final HttpHeaders headers = new HttpHeaders();
            return new ResponseEntity<byte[]>(null, headers, HttpStatus.NOT_FOUND);
            //return null;
        }
    }
    
    @RequestMapping(value = "/imagesByUpload/{uniqueId}",method = RequestMethod.GET)
    public ResponseEntity<byte[]> getPicByUpload(@PathVariable int uniqueId) {

        try{ 

        	UploadFile ufa = imageServiceImp.findByUploadId(uniqueId);
        	System.out.println("ok my uploadId es " + uniqueId);
            
            if(ufa == null) {
            	String relativeWebPath = "/resources/pics/default.jpg";
            	InputStream input =  servletContext.getResourceAsStream(relativeWebPath);
            	byte[] fileContent =  IOUtils.toByteArray(input);
            	final HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.IMAGE_JPEG);
                return new ResponseEntity<byte[]>(fileContent, headers, HttpStatus.OK);
            
            }
            
           
            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);
            return new ResponseEntity<byte[]>(ufa.getData(), headers, HttpStatus.OK);
            
        }catch(Exception ex){
            ex.printStackTrace();
        	System.out.println("Sth went wrong");
            final HttpHeaders headers = new HttpHeaders();
            return new ResponseEntity<byte[]>(null, headers, HttpStatus.NOT_FOUND);
            //return null;
        }
    }

	
}
