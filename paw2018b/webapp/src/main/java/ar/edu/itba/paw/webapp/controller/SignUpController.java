package ar.edu.itba.paw.webapp.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ar.edu.itba.paw.services.UserServiceImpl;

@Controller
@RequestMapping("/hello/")
public class SignUpController extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserServiceImpl us;

	@RequestMapping("signUpServlet")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	String firstName = request.getParameter("firstName");
    	String lastName = request.getParameter("lastName");
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	String phoneNumber = request.getParameter("phoneNumber");
    	System.out.println("First name:" + firstName);
    	System.out.println("Last name:" + lastName);
    	System.out.println("email:" + email);
    	System.out.println("password:" + password);
    	System.out.println("phoneNumber:" + phoneNumber);
    	
    	us.create(firstName,lastName,email,password,phoneNumber);
    	
    	System.out.println("Success!!");
    	response.sendRedirect("home.html");
    }
   

}