package ar.edu.itba.paw.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.HttpStatus;

@ControllerAdvice
@RequestMapping("/meinHaus/")
public class ExceptionController {
	
	public ModelAndView forbidden() {
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("error", "Forbidden");
        return mav;
	}
	
    @RequestMapping(value="500")
    public ModelAndView internalServerError(){
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("error", "Internal server error");
        return mav;
    }
    
    @RequestMapping(value="404")
    public ModelAndView notFoundPage(){
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("error", "Page not found");
        return mav;
    }
	
	


}
