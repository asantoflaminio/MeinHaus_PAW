package ar.edu.itba.paw.webapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.services.PublicationServiceImp;
import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.FirstPublicationForm;
import ar.edu.itba.webapp.form.SecondPublicationForm;
import ar.edu.itba.webapp.form.signUpForm;

@Controller
@RequestMapping("/hello/")
public class HelloWorldController {
	@Autowired
	private UserServiceImpl us;
	
	@Autowired
	private PublicationServiceImp ps;
	
	@RequestMapping("world")
	public ModelAndView helloWorld() {
		final ModelAndView mav = new ModelAndView("index");
		mav.addObject("greeting", "PAW");
		return mav;
	}
	
	@RequestMapping("mars")
	public ModelAndView helloMars() {
		final ModelAndView mav = new ModelAndView("index");
		mav.addObject("greeting", "MARS");
		return mav;
	}	
	
	@RequestMapping("home")
	public ModelAndView helloHome() {
		final ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@RequestMapping("details")
	public ModelAndView helloDetails() {
		final ModelAndView mav = new ModelAndView("details");
		return mav;
	}
	
	@RequestMapping("list")
	public ModelAndView helloList() {
		final ModelAndView mav = new ModelAndView("list");
		return mav;
	}
	
	@RequestMapping("publish")
	public ModelAndView helloPublish(@ModelAttribute("firstPublicationForm") final FirstPublicationForm form) {
		final ModelAndView mav = new ModelAndView("publish");
		return mav;
	}
	
	@RequestMapping(value = "publish" ,method = RequestMethod.POST)
	public ModelAndView publish(@Valid @ModelAttribute("firstPublicationForm") final FirstPublicationForm form, final BindingResult errors, RedirectAttributes atributos) {
		if (errors.hasErrors()) {
			return helloPublish(form);
		}
		ps.create(form.getTitle(), 
				  form.getAddress(), 
				  String.valueOf(form.isOperation()),
				  form.getPrice());
		Publication pub = new Publication(form.getTitle(), form.getAddress(),"false",form.getPrice());
		atributos.addAttribute("publication", form.getTitle());
		
		return new ModelAndView("redirect:/hello/publish2");
	}
	
	@RequestMapping(value = "publish2")
	public ModelAndView helloPublish2(@ModelAttribute("secondPublicationForm") final SecondPublicationForm form, @ModelAttribute("publication") final String pub) {
		System.out.println("Entre a la funcion");
		final ModelAndView mav = new ModelAndView("publish2");
		System.out.println("My title is: " + pub);
		return mav;
	}
	
	@RequestMapping(value = "publish2" ,method = RequestMethod.POST)
	public ModelAndView publish2(@Valid @ModelAttribute("secondPublicationForm") final SecondPublicationForm form, final BindingResult errors, RedirectAttributes atributos) {
		if (errors.hasErrors()) {
			return helloPublish2(form,null);
		}
		return new ModelAndView("redirect:/hello/publish3");
	}
	
	@RequestMapping("publish3")
	public ModelAndView helloPublish3() {
		final ModelAndView mav = new ModelAndView("publish3");
		return mav;
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
		System.out.println("Me llamaron a mua");
		if (errors.hasErrors()) {
			return helloSignUp(form);
		}
		us.create(form.getFirstName(),
					form.getLastName(),
					form.getEmail(),
					form.getPassword(),
					form.getPhoneNumber());
		System.out.println("Success!!");
		return new ModelAndView("redirect:/hello/home");
	}
	
}
