package com.echannelling.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.service.LabTestController;


@WebServlet("/LabTestInsertServlet")
public class LabTestInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   String test_name= request.getParameter("test_name");
	   String description= request.getParameter("description");
	   String price = request.getParameter("price");
	  
	   boolean isTrue;
	   
	   isTrue = LabTestController.insertdata(test_name, description, price);
	   
	   
	   if(isTrue ==true) {
		   response.sendRedirect("admin_dashboard.jsp");
	   }
	   
	   else {
		   RequestDispatcher dis2 = request.getRequestDispatcher("wrong1.jsp");
		   dis2.forward(request, response);
	   }
	}

   
}
