package ar.edu.itba.paw.webapp.controller;

import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.UploadFile;
import ar.edu.itba.paw.services.FileUploadImpl;
import ar.edu.itba.paw.services.PublicationServiceImp;
import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.FirstPublicationForm;
import ar.edu.itba.webapp.form.FourthPublicationForm;
import ar.edu.itba.webapp.form.HomeSearchForm;
import ar.edu.itba.webapp.form.MessageForm;
import ar.edu.itba.webapp.form.NewPasswordForm;
import ar.edu.itba.webapp.form.ProfileForm;
import ar.edu.itba.webapp.form.SecondPublicationForm;
import ar.edu.itba.webapp.form.ThirdPublicationForm;
import ar.edu.itba.webapp.form.SignUpForm;

@Controller
@RequestMapping("/meinHaus/")
@ComponentScan({ "ar.edu.itba.paw.webapp.controller", "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence", "ar.edu.itba.paw.webapp.models" })
public class HelloWorldController {
	
	@Autowired
	private UserServiceImpl us;
	
	@Autowired
	private PublicationServiceImp ps;
	
	/*@Autowired
    private FileUploadDao fileUploadDao;*/
	
	@Autowired
	private FileUploadImpl fileUploadImpl;
	
	@RequestMapping("/403")
	public ModelAndView forbidden() {
		return new ModelAndView("403");
	}
	
	
	@RequestMapping("home")
	public ModelAndView home(@ModelAttribute("homeSearchForm") final HomeSearchForm form) {
		System.out.println("Home");
		final ModelAndView mav = new ModelAndView("home");
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
			return home(form);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/list");
		mav.addObject("operation", operation);
		if(! form.getSearch().equals(""))
			mav.addObject("address", form.getSearch());
		else
			mav.addObject("address", "all");
		return mav;
	}

	
	@RequestMapping("profile")
	public ModelAndView profile(@ModelAttribute("ProfileForm") final ProfileForm form) {
		final ModelAndView mav = new ModelAndView("profile");
		return mav;
	}
	
	/*@RequestMapping("profile")
	public ModelAndView helloProfile(@ModelAttribute("NewPasswordForm") final NewPasswordForm form) {
		final ModelAndView mav = new ModelAndView("profile");
		return mav;
	}*/
	
	@RequestMapping (value = "profile", method = RequestMethod.POST )
	public ModelAndView profile(@Valid @ModelAttribute("ProfileForm") final ProfileForm form, final BindingResult errors) {
		if (errors.hasErrors()) {
			return profile(form);
		}
		
		return new ModelAndView("redirect:/meinHaus/profile"); //!!!!!!!!!! no
	}
	
	/*@RequestMapping (value = "profile", method = RequestMethod.POST )
	public ModelAndView newpassword(@Valid @ModelAttribute("NewPasswordForm") final NewPasswordForm form, final BindingResult errors) {
		if (errors.hasErrors()) {
			return helloProfile(form);
		}
		
		return new ModelAndView("redirect:/hello/profile"); //!!!!!!!!!! no
	}*/
	
	
	@RequestMapping("list")
	public ModelAndView list(@ModelAttribute("homeSearchForm") final HomeSearchForm form, @RequestParam("operation") String operation,@RequestParam("address") String address) {
		List<Publication> publications;
		final ModelAndView mav = new ModelAndView("list");
		mav.addObject("operation", operation);
		mav.addObject("address", address);
		if(address.equals("all")) 
			publications = ps.findAll(operation);
		else
			publications = ps.findSearch(operation,address);
		mav.addObject("publications", publications);
		return mav;
	}
	
	
	@RequestMapping(value = "list" ,method = RequestMethod.POST)
	public ModelAndView listSearch(@Valid @ModelAttribute("homeSearchForm") final HomeSearchForm form, final BindingResult errors,
			   						@RequestParam("oper") String operation) {
		List<Publication> publications;
		if (errors.hasErrors()) {
			return list(form, operation,form.getSearch());
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/list");
		mav.addObject("operation", operation);
		if(form.getSearch().equals("")) {
			publications = ps.findAll(operation);
			mav.addObject("address", "all");
		}
		else {
			publications = ps.findSearch(operation,form.getSearch());
			mav.addObject("address", form.getSearch());
		}
		mav.addObject("publications", publications);
		return mav;
	}
	
	
	
	@RequestMapping("details")
	public ModelAndView details(@Valid @ModelAttribute("MessageForm") final MessageForm form, @RequestParam("publicationid") String publicationid) {
		final Publication pub = ps.findById(Integer.valueOf(publicationid));
		//final User user = us.findById(1);
	    final ModelAndView mav = new ModelAndView("details");
	    mav.addObject("address", pub.getAddress());
	    mav.addObject("title", pub.getTitle());
	    mav.addObject("price", "$" + pub.getPrice());
	    mav.addObject("description", pub.getDescription());
	    mav.addObject("bedrooms", pub.getBedrooms());
	    mav.addObject("bathrooms", pub.getBathrooms());
	    mav.addObject("parking", pub.getParking());
	    mav.addObject("floorSize", pub.getFloorSize());
	    //mav.addObject("phoneNumber",user.getPhoneNumber());
	    
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
	public ModelAndView publish4() {
		final ModelAndView mav = new ModelAndView("publish4");
		return mav;
	}
	
	@RequestMapping(value = "publish4" ,method = RequestMethod.POST)
	public ModelAndView publish4(@Valid @ModelAttribute("fourthPublicationForm") final FourthPublicationForm form, final BindingResult errors,
								 @RequestParam("type") String type, @RequestParam("operation") String operation , @RequestParam CommonsMultipartFile[] fileUpload) {
		if (errors.hasErrors()) {
			//return publish4();
		}
		long userid = us.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName()).getUserId();
		ps.create(form.getTitle(), form.getAddress(), operation, form.getPrice(), form.getDescription(), 
				type, form.getBedrooms(), form.getBathrooms(), form.getFloorSize(), form.getParking(),userid);
		
		
		if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload){
                  
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                //hay que chequear q si o si sea jpg o el formato q queramos
                UploadFile uploadFile = new UploadFile();
                
                uploadFile.setId((int) (Math.random()*1000000));
                uploadFile.setAddress(form.getAddress());
                uploadFile.setData(aFile.getBytes());
                System.out.println("I'm about to save with id: " + uploadFile.getId());
                if(uploadFile.getData().length > 0) {
                	if(aFile.getOriginalFilename().contains(".jpg")) {
                		fileUploadImpl.save(uploadFile); 
                	}else {
                		//error mostrarlo!
                		System.out.println("Sth went wrong with file format");
                	}
                	
                }else {
                	System.out.println("Nope");
                }
                
                
            }
        }
		return new ModelAndView("redirect:/meinHaus/home");
	}

	
}
