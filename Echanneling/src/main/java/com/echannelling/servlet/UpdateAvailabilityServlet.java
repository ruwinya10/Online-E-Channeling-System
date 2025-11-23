package com.echannelling.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.service.AvailabilityDAO;

@WebServlet("/UpdateAvailabilityServlet")
public class UpdateAvailabilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Retrieve form data submitted by user
    	String availability_id = request.getParameter("availability_id");
        String hospital_name = request.getParameter("hospital_name");
        String location = request.getParameter("location");
        String day = request.getParameter("day");
        String time = request.getParameter("time");
        String max_patients = request.getParameter("max_patients");
        String fee = request.getParameter("fee");

        // Convert time format from datetime-local (YYYY-MM-DDTHH:MM) to MySQL datetime (YYYY-MM-DD HH:MM:SS)
        if (time != null && !time.isEmpty()) {
            try {
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                java.util.Date date = inputFormat.parse(time);
                time = outputFormat.format(date);
            } catch (Exception e) {
                System.err.println("Error parsing time: " + time);
                e.printStackTrace();
            }
        }
        
        // Calls the DAO method to update availability details in the database
        boolean isTrue = AvailabilityDAO.updatedata(availability_id, hospital_name, location, day, time, max_patients, fee);
        
        // If update successful, alert user and redirect
        if (isTrue) {
            String alertMessage = "Availability Update Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='GetDoctorServlet'</script>");
         // If update failed, forward user to error page
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}