package ar.edu.itba.paw.webapp.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.SignUpForm;

@Controller
@RequestMapping("/meinHaus/")
public class SignUpController{
 
	@Autowired
	private UserServiceImpl us;
	
	@RequestMapping("signUp")
	public ModelAndView signUp(@ModelAttribute("signUpForm") final SignUpForm form, @RequestParam(value = "error", required=false) String error) {
		System.out.println("en signUp");
		final ModelAndView mav = new ModelAndView("signUp");
		mav.addObject("error",error);
		return mav;
	}
	
	
	@RequestMapping (value = "signUp/create", method = RequestMethod.POST )
	public ModelAndView create(@Valid @ModelAttribute("signUpForm") final SignUpForm form, final BindingResult errors)  {
		System.out.println("Creando usuario");
		if (errors.hasErrors()) {
			return signUp(form,null);
		}
		us.create(form.getFirstName(),
					form.getLastName(),
					form.getEmail(),
					form.getPassword(),
					form.getPhoneNumber());
		return new ModelAndView("redirect:/meinHaus/home");
	}
   

}