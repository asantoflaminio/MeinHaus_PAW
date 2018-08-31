package ar.edu.itba.paw.webapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello/")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 2L;
	
	@RequestMapping("listServlet")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

	    	response.sendRedirect("./list");


    }

}
