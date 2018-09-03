package ar.edu.itba.paw.webapp.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ar.edu.itba.paw.services.PublicationServiceImp;

@Controller
@RequestMapping("/hello/")
public class PublishController extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	@Autowired
	private PublicationServiceImp psi;

	@RequestMapping("publishServlet")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	String title = request.getParameter("title");
    	String address = request.getParameter("address");
    	String operation = request.getParameter("operation");
    	Integer price = Integer.parseInt(request.getParameter("price"));
    	
    	if ("For sale".equals(operation))
    		operation = "For sale";
    	else
    		operation = "For rent";
    	
    	System.out.println("title:" + title);
    	System.out.println("address:" + address);
    	System.out.println("operation:" + operation);
    	System.out.println("price:" + price);
    	
    	psi.create(title,address,operation,price);
    	
    	System.out.println("Success!!");
    	response.sendRedirect("home.html");
    }
   

}