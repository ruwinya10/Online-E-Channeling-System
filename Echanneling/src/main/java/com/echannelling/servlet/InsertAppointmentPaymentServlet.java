package com.echannelling.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.model.AppointmentModel;
import com.echannelling.model.AppointmentPaymentModel;
import com.echannelling.service.AppointmentController;
import com.echannelling.service.AppointmentPaymentController;

/**
 * Servlet to handle insertion of appointment payment details.
 */
@WebServlet("/InsertAppointmentPaymentServlet")
public class InsertAppointmentPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests to insert payment details.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String cardHolder = request.getParameter("cardHolder");
        String cardNo = request.getParameter("cardNo");
        String expMonth = request.getParameter("expMonth");
        String cvv = request.getParameter("cvv");
        String appointmentID = request.getParameter("appointmentID");

        // Get doctor details
        String doctorName = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Log received data
        System.out.println("InsertAppointmentPaymentServlet - Received: cardHolder=" + cardHolder + ", appointmentID=" + appointmentID + ", doctorName=" + doctorName);

        // Validate input
        String errorMessage = validateInput(cardHolder, cardNo, expMonth, cvv);
        if (errorMessage != null) {
            // Redirect on validation failure
            response.sendRedirect("AppointmentPaymentDetails.jsp?status=" + java.net.URLEncoder.encode(errorMessage, "UTF-8") +
                    "&cardHolder=" + (cardHolder != null ? java.net.URLEncoder.encode(cardHolder, "UTF-8") : "") +
                    "&cardNo=" + (cardNo != null ? java.net.URLEncoder.encode(cardNo, "UTF-8") : "") +
                    "&expMonth=" + (expMonth != null ? java.net.URLEncoder.encode(expMonth, "UTF-8") : "") +
                    "&cvv=" + (cvv != null ? java.net.URLEncoder.encode(cvv, "UTF-8") : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                    "&appointmentID=" + (appointmentID != null ? java.net.URLEncoder.encode(appointmentID, "UTF-8") : ""));
            return;
        }

        // Insert payment details and get generated methodID
        int methodID = AppointmentPaymentController.insertPaymentDetails(cardHolder, cardNo, expMonth, cvv);
        // Log insertion result
        System.out.println("Insert Payment Result: methodID=" + (methodID != -1 ? methodID : "Failed"));

        if (methodID != -1) {
            // Fetch the newly inserted payment
            List<AppointmentPaymentModel> paymentDetails = AppointmentPaymentController.getById(String.valueOf(methodID));
            if (!paymentDetails.isEmpty()) {
                AppointmentPaymentModel newPayment = paymentDetails.get(0);
                // Set payment attributes
                request.setAttribute("Payment", newPayment);
                request.setAttribute("methodID", String.valueOf(newPayment.getMethodID()));
                request.setAttribute("cardHolder", newPayment.getCardHolder());
                request.setAttribute("cardNo", newPayment.getCardNo());
                request.setAttribute("expMonth", newPayment.getExpMonth());
                request.setAttribute("cvv", newPayment.getCVV());
                request.setAttribute("status", "Payment Method Added Successfully!");
                request.getSession().setAttribute("currentMethodID", String.valueOf(methodID));

                // Set doctor details
                request.setAttribute("doctorName", doctorName);
                request.setAttribute("specialization", specialization);
                request.setAttribute("hospital", hospital);
                request.setAttribute("date", date);
                request.setAttribute("time", time);
                request.setAttribute("appointmentID", appointmentID);

                // Fetch patient details
                if (appointmentID != null && !appointmentID.isEmpty()) {
                    try {
                        List<AppointmentModel> patientDetailsList = AppointmentController.getById(appointmentID);
                        if (patientDetailsList != null && !patientDetailsList.isEmpty()) {
                            AppointmentModel patientDetails = patientDetailsList.get(0);
                            // Set patient attributes
                            request.setAttribute("appointmentID", String.valueOf(patientDetails.getAppointmentID()));
                            request.setAttribute("name", patientDetails.getName());
                            request.setAttribute("age", patientDetails.getAge());
                            request.setAttribute("gender", patientDetails.getGender());
                            request.setAttribute("email", patientDetails.getEmail());
                            request.setAttribute("phone", patientDetails.getPhone());
                        }
                    } catch (Exception e) {
                        // Log patient details error
                        System.out.println("Error fetching patient details: " + e.getMessage());
                        request.setAttribute("status", "Error: Failed to fetch patient details");
                    }
                }

                // Forward to Index.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("Index1.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle no payment found
                request.setAttribute("status", "Error: Payment not found after insert");
                RequestDispatcher dispatcher = request.getRequestDispatcher("AppointmentPaymentDetails.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // Handle insertion failure
            request.setAttribute("status", "Error: Insertion failed");
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }

    /**
     * Validates payment input fields.
     * @return Error message or null if valid
     */
    private String validateInput(String cardHolder, String cardNo, String expMonth, String cvv) {
        // Check for empty fields
        if (cardHolder == null || cardNo == null || expMonth == null || cvv == null ||
            cardHolder.trim().isEmpty() || cardNo.trim().isEmpty() || expMonth.trim().isEmpty() || cvv.trim().isEmpty()) {
            return "Fill All Data!";
        }
        // Validate card number
        if (cardNo.length() != 12 || !cardNo.matches("\\d+")) {
            return "Invalid Card No!";
        }
        // Validate card holder name
        if (cardHolder.length() < 3 || cardHolder.length() > 50) {
            return "Invalid Card Holder's Name!";
        }
        // Validate CVV
        if (cvv.length() != 3 || !cvv.matches("\\d+")) {
            return "Invalid CVV No!";
        }
        // Validate expiry date
        try {
            LocalDate currentDate = LocalDate.now(ZoneId.of("Asia/Colombo"));
            LocalDate expiryDate = LocalDate.parse(expMonth + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            if (expiryDate.isBefore(currentDate.withDayOfMonth(1))) {
                return "Invalid Expiry Date!";
            }
        } catch (Exception e) {
            return "Invalid Expiry Date Format!";
        }
        return null;
    }
}