package ar.edu.itba.paw.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.interfaces.UserService;

@Controller
@RequestMapping("/hello/")
public class HelloWorldController {
	
	 @Autowired
	 @Qualifier("userServiceImpl")
	 private UserService us;
	
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
	public ModelAndView helloSignUp() {
		final ModelAndView mav = new ModelAndView("signUp");
		return mav;
	}
	
	@RequestMapping("list")
	public ModelAndView helloList() {
		final ModelAndView mav = new ModelAndView("list");
		return mav;
	}
	
}