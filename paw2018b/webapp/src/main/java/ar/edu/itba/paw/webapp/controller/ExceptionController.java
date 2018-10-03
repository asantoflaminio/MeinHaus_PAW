package ar.edu.itba.paw.webapp.controller;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@RequestMapping("/meinHaus/")
public class ExceptionController {
	
	public ModelAndView forbidden() {
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("status","406");
        return mav;
	}
	
    @RequestMapping(value="500")
    public ModelAndView internalServerError(){
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("status","500");
        return mav;
    }
    
    @RequestMapping(value="404")
    public ModelAndView notFoundPage(){
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("status","404");
        return mav;
    }
    
    @RequestMapping(value="GlobalError")
    @ExceptionHandler(Exception.class)
    public ModelAndView globalException() {
    	final ModelAndView mav = new ModelAndView("errorPage");
    	mav.addObject("status","-1");
        return mav;
    }
	
	


}
