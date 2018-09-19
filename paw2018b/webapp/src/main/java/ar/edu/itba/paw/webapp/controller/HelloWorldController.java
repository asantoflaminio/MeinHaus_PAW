package ar.edu.itba.paw.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.services.PublicationServiceImp;
import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.FirstPublicationForm;
import ar.edu.itba.webapp.form.HomeSearchForm;
import ar.edu.itba.webapp.form.MessageForm;
import ar.edu.itba.webapp.form.SecondPublicationForm;
import ar.edu.itba.webapp.form.ThirdPublicationForm;
import ar.edu.itba.webapp.form.signUpForm;

@Controller
@RequestMapping("/hello/")
public class HelloWorldController {
	@Autowired
	private UserServiceImpl us;
	
	@Autowired
	private PublicationServiceImp ps;
	
	@RequestMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("redirect:/hello/home");
	}
	
	@RequestMapping("/403")
	public ModelAndView forbidden() {
		return new ModelAndView("403");
	}
	
	
	@RequestMapping("home")
	public ModelAndView helloHome(@ModelAttribute("homeSearchForm") final HomeSearchForm form) {
		final ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@RequestMapping(value = "home",method = RequestMethod.POST)
	public ModelAndView homeSearch(@Valid @ModelAttribute("homeSearchForm") final HomeSearchForm form, final BindingResult errors,
								   @RequestParam("oper") String operation) {
		if(errors.hasErrors()) {
			return helloHome(form);
		}
		final ModelAndView mav = new ModelAndView("redirect:/hello/list");
		mav.addObject("operation", operation);
		if(! form.getSearch().equals(""))
			mav.addObject("address", form.getSearch());
		else
			mav.addObject("address", "all");
		return mav;
	}

	
	
	@RequestMapping("list")
	public ModelAndView helloList(@ModelAttribute("homeSearchForm") final HomeSearchForm form, @RequestParam("operation") String operation,@RequestParam("address") String address) {
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
			return helloList(form, operation,form.getSearch());
		}
		final ModelAndView mav = new ModelAndView("redirect:/hello/list");
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
	public ModelAndView helloDetails(@Valid @ModelAttribute("MessageForm") final MessageForm form, @RequestParam("publicationid") String publicationid) {
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
	public ModelAndView helloPublish(@ModelAttribute("firstPublicationForm") final FirstPublicationForm form) {
		final ModelAndView mav = new ModelAndView("publish");
		return mav;
	}

	
	@RequestMapping(value = "publish" ,method = RequestMethod.POST)
	public ModelAndView publish(@Valid @ModelAttribute("firstPublicationForm") final FirstPublicationForm form, final BindingResult errors, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
			return helloPublish(form);
		}
		final ModelAndView mav = new ModelAndView("redirect:/hello/publish2");
		mav.addObject("title", form.getTitle());
		mav.addObject("address", form.getAddress());
		mav.addObject("price", form.getPrice());
		mav.addObject("operation",operation);
		return mav;
	}
		
	@RequestMapping(value = "publish2")
	public ModelAndView helloPublish2(@ModelAttribute("secondPublicationForm") final SecondPublicationForm form, @RequestParam("operation") String operation) {
		final ModelAndView mav = new ModelAndView("publish2");
		mav.addObject("operation",operation);
		return mav;
	}
	
	@RequestMapping(value = "publish2" ,method = RequestMethod.POST)
	public ModelAndView publish2(@Valid @ModelAttribute("secondPublicationForm") final SecondPublicationForm form, final BindingResult errors, 
								 @RequestParam("type") String type, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
				
			return helloPublish2(form,operation);
		}
		final ModelAndView mav = new ModelAndView("redirect:/hello/publish3");
		mav.addObject("title", form.getTitle());
		mav.addObject("address", form.getAddress());
		mav.addObject("price", form.getPrice());
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		mav.addObject("description",form.getDescription());
		return mav;
	}
	
	@RequestMapping(value = "publish3")
	public ModelAndView helloPublish3(@ModelAttribute("thirdPublicationForm") final ThirdPublicationForm form, @RequestParam("operation") String operation, @RequestParam("type") String type) {
		final ModelAndView mav = new ModelAndView("publish3");
		mav.addObject("operation",operation);
		mav.addObject("type",type);
		return mav;
	}
	
	@RequestMapping(value = "publish3" ,method = RequestMethod.POST)
	public ModelAndView publish3(@Valid @ModelAttribute("thirdPublicationForm") final ThirdPublicationForm form, final BindingResult errors,
								 @RequestParam("type") String type, @RequestParam("operation") String operation) {
		if (errors.hasErrors()) {
			return helloPublish3(form,operation,type);
		}
		System.out.println("operation: "+ operation);
		System.out.println("type: "+ type);
		ps.create(form.getTitle(), form.getAddress(), operation, form.getPrice(), form.getDescription(), 
				type, form.getBedrooms(), form.getBathrooms(), form.getFloorSize(), form.getParking());
		return new ModelAndView("redirect:/hello/home");
	}
	
	@RequestMapping("publish4")
	public ModelAndView helloPublish4() {
		final ModelAndView mav = new ModelAndView("publish4");
		return mav;
	}
	
	@RequestMapping("signUp")
	public ModelAndView helloSignUp(@ModelAttribute("signUpForm") final signUpForm form) {
		final ModelAndView mav = new ModelAndView("signUp");
		return mav;
	}
	
	@RequestMapping (value = "signUp", method = RequestMethod.POST )
	public ModelAndView create(@Valid @ModelAttribute("signUpForm") final signUpForm form, final BindingResult errors) {
		if (errors.hasErrors()) {
			return helloSignUp(form);
		}
		us.create(form.getFirstName(),
					form.getLastName(),
					form.getEmail(),
					form.getPassword(),
					form.getPhoneNumber());
		return new ModelAndView("redirect:/hello/home");
	}
	
}
