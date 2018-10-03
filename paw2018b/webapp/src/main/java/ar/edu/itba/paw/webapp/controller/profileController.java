package ar.edu.itba.paw.webapp.controller;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.models.Publication;
import ar.edu.itba.paw.models.User;
import ar.edu.itba.paw.services.ImageServiceImp;
import ar.edu.itba.paw.services.PublicationServiceImp;
import ar.edu.itba.paw.services.UserServiceImpl;
import ar.edu.itba.webapp.form.PasswordForm;
import ar.edu.itba.webapp.form.ProfileForm;


@Controller
@RequestMapping("/meinHaus/")
@ComponentScan({ "ar.edu.itba.paw.webapp.controller", "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence", "ar.edu.itba.paw.webapp.models" })
public class profileController {
	
	@Autowired
	private UserServiceImpl us;
	
	@Autowired
	private PublicationServiceImp ps;
	
	@Autowired
	private ImageServiceImp imageServiceImp;
	
	@RequestMapping("profile")
	public ModelAndView profile(@ModelAttribute("ProfileForm") final ProfileForm form, @ModelAttribute("PasswordForm") final PasswordForm passForm,
								@RequestParam(value = "error", required=false) String error, @RequestParam(value = "page", defaultValue = "1") String page,
								@RequestParam(value = "option", defaultValue = "myPublications") String option) {
		final ModelAndView mav = new ModelAndView("profile");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String oldEmail = authentication.getName();
		System.out.println(oldEmail);
		User user = us.findByUsername(oldEmail);
		List<Publication> publications = ps.findByUserId(user.getUserId());
		mav.addObject("firstNameValue",user.getFirstName());
		mav.addObject("lastNameValue",user.getLastName());
		mav.addObject("emailValue",user.getEmail());
		mav.addObject("phoneNumberValue",user.getPhoneNumber());
		mav.addObject("publications", publications);
		mav.addObject("option", option);
		mav.addObject("error",error);
		mav.addObject("page",page);
		return mav;
	}
	
	
	@RequestMapping (value = "profileData", method = RequestMethod.POST )
	public ModelAndView profileData(@Valid @ModelAttribute("ProfileForm") final ProfileForm form, final BindingResult errors, 
									@ModelAttribute("PasswordForm") final PasswordForm passForm, @RequestParam(value = "page", defaultValue = "1") String page) {
		User user = us.findByUsername(form.getEmail());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String oldEmail = authentication.getName();
		if(user != null && ! form.getEmail().equals(oldEmail))
			return profile(form,passForm,"email",page,"myDetails");
		else if(errors.hasErrors()) {
			return profile(form,passForm,"errorOnForm",page,"myDetails");
		}
			
	
		us.editData(form.getFirstName(), form.getLastName(), form.getEmail(), form.getPhoneNumber(), oldEmail);
		if(! oldEmail.equals(form.getEmail())) {
			final Collection<? extends GrantedAuthority> authorities = Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"),new SimpleGrantedAuthority("ROLE_ADMIN"));
			Authentication auth = new UsernamePasswordAuthenticationToken (form.getEmail(),null,authorities);
			SecurityContextHolder.getContext().setAuthentication(auth);
		}
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/profile");
		mav.addObject("option", "myDetails");
		return mav; 
	}
	
	@RequestMapping (value = "profilePassword", method = RequestMethod.POST )
	public ModelAndView newpassword(@Valid @ModelAttribute("PasswordForm") final PasswordForm passForm, final BindingResult errors, 
									@ModelAttribute("ProfileForm") final ProfileForm form, @RequestParam(value = "page", defaultValue = "1") String page) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String oldEmail = authentication.getName();
		User user = us.findByUsername(oldEmail);

		if(! user.getPassword().equals(passForm.getPasswordOld()))
			return profile(form,passForm,"password",page,"myDetails");
		else if(errors.hasErrors()) {
			System.out.println("ok so you made sth wrong");
			return profile(form,passForm,"errorOnForm",page,"myDetails");
		}
			
		
		us.editPassword(passForm.getPasswordOld(), passForm.getPasswordNew(), oldEmail);
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/profile");
		mav.addObject("option", "myDetails");
		return mav; 
	}
	
	@RequestMapping (value = "profileDelete")
	public ModelAndView newpassword(@ModelAttribute("PasswordForm") final PasswordForm passForm,  @ModelAttribute("ProfileForm") final ProfileForm form, 
													@RequestParam(value = "page", defaultValue = "1") String page, @RequestParam(value = "pubid") long pubid) {
		ps.deleteById(pubid);
		imageServiceImp.deleteById(pubid);
		final ModelAndView mav = new ModelAndView("redirect:/meinHaus/profile");
		mav.addObject("option", "myPublications");
		return mav; 
	}
	

}
