package com.echannelling.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.service.AvailabilityDAO;

@WebServlet("/DeleteAvailabilityServlet")
public class DeleteAvailabilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests sent to /DeleteAvailabilityServlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Retrieves the availability_id parameter sent from the client (e.g., form submission)
    	String availability_id = request.getParameter("availability_id");
        
    	// Calls the deletedata method in AvailabilityDAO to delete the availability record
    	boolean isTrue = AvailabilityDAO.deletedata(availability_id);
    	
        if (isTrue) {
        	// If deletion is successful, send a JavaScript alert and redirect to GetDoctorServlet
            String alertMessage = "Availability deleted successfully";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetDoctorServlet';</script>");
        } else {
        	// If deletion fails, forward the request to a JSP page that handles errors
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}