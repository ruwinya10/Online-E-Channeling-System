package com.echannelling.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.Doctor;
import com.echannelling.service.DoctorDAO;

@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Retrieve doctor_id from the form submitted via POST
    	String doctor_id = request.getParameter("doctor_id");
        
    	// Call the DAO method to delete the doctor record from the database
    	boolean isTrue = DoctorDAO.deletedata(doctor_id);
    	
    	// If deletion is successful, Show success message using JavaScript alert and redirect to GetDoctorServlet
        if (isTrue) {
            String alertMessage = "Data deleted successfully";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetDoctorServlet';</script>");
        } else {
        	// If deletion fails, retrieve doctor details and forward to an error page (wrong.jsp)
            List<Doctor> dctrdetails = DoctorDAO.getById(doctor_id);
            request.setAttribute("dctrdetails", dctrdetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}