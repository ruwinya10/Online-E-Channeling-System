package com.echannelling.servlet;

import com.echannelling.service.LabAppointmentController;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LabPaymentServlet")
public class LabPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data for payment
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");
        String appointmentId = request.getParameter("appointmentId");
        String paymentAmountStr = request.getParameter("paymentAmount");

        // Validate fields
        if (cardName == null || cardNumber == null || expiry == null || cvv == null || appointmentId == null || paymentAmountStr == null) {
            response.sendRedirect("LabPayment.jsp?error=Missing payment details. Please try again.");
            return;
        }

        cardNumber = cardNumber.replaceAll("\\s+", "");

        try {
            double paymentAmount = Double.parseDouble(paymentAmountStr);

            // Update payment status in database
            boolean isUpdated = LabAppointmentController.updatePaymentStatus(appointmentId, "Completed", paymentAmount);

            if (isUpdated) {
                response.sendRedirect("LabPayment.jsp?success=true&appointmentId=" + appointmentId);
            } else {
                response.sendRedirect("LabPayment.jsp?error=Failed to update payment status.");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("LabPayment.jsp?error=Invalid card number or payment amount. Please try again.");
        }
    }
}
