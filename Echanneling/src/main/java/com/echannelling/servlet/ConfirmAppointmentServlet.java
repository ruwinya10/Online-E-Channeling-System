package com.echannelling.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.AppointmentBookingModel;
import com.echannelling.service.AppointmentBookingController;

/**
 * Servlet to handle appointment confirmation.
 */
@WebServlet("/ConfirmAppointmentServlet")
public class ConfirmAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests for appointment confirmation.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String appointmentIDStr = request.getParameter("appointmentID");
        String methodIDStr = request.getParameter("methodID");
        String doctorName = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String cardHolder = request.getParameter("cardHolder");
        String cardNo = request.getParameter("cardNo");
        String expMonth = request.getParameter("expMonth");
        String cvv = request.getParameter("cvv");

        // Validate and convert IDs
        int appointmentID = 0;
        int methodID = 0;
        try {
            appointmentID = appointmentIDStr != null && !appointmentIDStr.trim().isEmpty() ? Integer.parseInt(appointmentIDStr) : 0;
            methodID = methodIDStr != null && !methodIDStr.trim().isEmpty() ? Integer.parseInt(methodIDStr) : 0;
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            request.setAttribute("status", "Error: Invalid appointmentID or methodID format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        // Validate required fields
        if (doctorName == null || doctorName.trim().isEmpty() ||
            specialization == null || specialization.trim().isEmpty() ||
            hospital == null || hospital.trim().isEmpty() ||
            date == null || date.trim().isEmpty() ||
            time == null || time.trim().isEmpty()) {
            // Handle missing fields
            request.setAttribute("status", "Error: Missing required fields (doctorName, specialization, hospital, date, or time).");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Validate date format
        LocalDate parsedDate = null;
        try {
            parsedDate = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE);
        } catch (Exception e) {
            // Handle invalid date
            request.setAttribute("status", "Error: Invalid date format. Use YYYY-MM-DD.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        // Insert booking
        boolean isTrue = AppointmentBookingController.insertBooking(appointmentID, methodID, doctorName, specialization, hospital, date, time);

        if (isTrue) {
            // Get latest booking
            AppointmentBookingModel booking = AppointmentBookingController.getLatestBooking();
            if (booking != null) {
                // Set booking attributes
                request.setAttribute("bookingID", booking.getBookingID());
                request.setAttribute("doctorName", booking.getDoctorName());
                request.setAttribute("specialization", booking.getSpecialization());
                request.setAttribute("hospital", booking.getHospital());
                request.setAttribute("date", booking.getDate());
                request.setAttribute("time", booking.getTime());

                // Set patient attributes
                request.setAttribute("name", name);
                request.setAttribute("age", age);
                request.setAttribute("gender", gender);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);

                // Set payment attributes
                request.setAttribute("cardHolder", cardHolder);
                request.setAttribute("cardNo", cardNo);
                request.setAttribute("expMonth", expMonth);
                request.setAttribute("cvv", cvv);

                // Set success message
                request.setAttribute("status", "Appointment Confirmed Successfully!");
            } else {
                // Handle booking retrieval failure
                request.setAttribute("status", "Error: Could not retrieve booking details.");
            }
        } else {
            // Handle booking insertion failure
            request.setAttribute("status", "Error: Failed to confirm appointment.");
        }

        // Forward to Search.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
        dispatcher.forward(request, response);
    }
}