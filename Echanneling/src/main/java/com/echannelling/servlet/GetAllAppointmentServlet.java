package com.echannelling.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.AppointmentModel;
import com.echannelling.service.AppointmentController;

// Servlet annotation to map this class to the "/GetAllAppointment" URL
@WebServlet("/GetAllAppointment")
// Servlet class to handle HTTP requests for retrieving all appointment details
public class GetAllAppointmentServlet extends HttpServlet {
    // Serial version UID for serialization (required for HttpServlet)
    private static final long serialVersionUID = 1L;

    // Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all appointments from the database using AppointmentController
        List<AppointmentModel> allAppointments = AppointmentController.getAllAppointment();
        // Check if the list of appointments is not empty
        if (!allAppointments.isEmpty()) {
            // Use the first appointment for Index.jsp (adjust if specific ID is needed)
            AppointmentModel appointment = allAppointments.get(0);
            // Set the entire appointment object as a request attribute
            request.setAttribute("Appointment", appointment);
            // Set individual appointment fields as request attributes for use in JSP
            request.setAttribute("name", appointment.getName());
            request.setAttribute("age", appointment.getAge());
            request.setAttribute("gender", appointment.getGender());
            request.setAttribute("email", appointment.getEmail());
            request.setAttribute("phone", appointment.getPhone());
        }
        // Set the full list of appointments as a request attribute
        request.setAttribute("allAppointments", allAppointments);

        // Create a RequestDispatcher to forward the request to Index.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index1.jsp");
        // Forward the request and response to the JSP for rendering
        dispatcher.forward(request, response);
    }

    // Handles HTTP POST requests by delegating to doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Call doGet to handle POST requests in the same way as GET requests
        doGet(request, response);
    }
}