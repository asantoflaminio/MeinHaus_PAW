package ar.edu.itba.paw.webapp.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.signUpForm;

@Controller
@RequestMapping("/hello/")
public class HelloWorldController {
	@Autowired
	private UserServiceImpl us;
	
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
	
	@RequestMapping("signUp")
	public ModelAndView helloSignUp(@ModelAttribute("signUpForm") final signUpForm form) {
		final ModelAndView mav = new ModelAndView("signUp");
		return mav;
	}
	
	@RequestMapping("list")
	public ModelAndView helloList() {
		final ModelAndView mav = new ModelAndView("list");
		return mav;
	}
	
	@RequestMapping("publish")
	public ModelAndView helloPublish() {
		final ModelAndView mav = new ModelAndView("publish");
		return mav;
	}
	
	@RequestMapping("publish2")
	public ModelAndView helloPublish2() {
		final ModelAndView mav = new ModelAndView("publish2");
		return mav;
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
		System.out.println("Success!!");
		return new ModelAndView("redirect:/hello/home");
	}
	
}
