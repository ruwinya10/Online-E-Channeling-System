package com.echannelling.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.AppointmentPaymentModel;
import com.echannelling.service.AppointmentPaymentController;

// Servlet annotation to map this class to the "/GetAllPaymentServlet" URL
@WebServlet("/GetAllPaymentServlet")
// Servlet class to handle HTTP requests for retrieving all payment details
public class GetAllPaymentServlet extends HttpServlet {
    // Serial version UID for serialization (required for HttpServlet)
    private static final long serialVersionUID = 1L;

    // Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all payment records from the database using AppointmentPaymentController
        List<AppointmentPaymentModel> allAppointmentPayments = AppointmentPaymentController.getAllPayments();
        // Check if the list of payments is not empty
        if (!allAppointmentPayments.isEmpty()) {
            // Use the first appointment for Index.jsp (adjust if specific ID is needed)
            AppointmentPaymentModel payment = allAppointmentPayments.get(0);
            // Set the entire payment object as a request attribute
            request.setAttribute("Payment", payment);
            // Set individual payment fields as request attributes for use in JSP
            request.setAttribute("cardHolder", payment.getCardHolder());
            request.setAttribute("cardNo", payment.getCardNo());
            request.setAttribute("expMonth", payment.getExpMonth());
            request.setAttribute("CVV", payment.getCVV());
        }
        // Set the full list of payments as a request attribute
        request.setAttribute("allAppointmentPayments", allAppointmentPayments);

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