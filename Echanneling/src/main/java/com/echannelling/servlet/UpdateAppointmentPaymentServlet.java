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
 * Servlet to handle updating appointment payment details.
 */
@WebServlet("/UpdateAppointmentPaymentServlet")
public class UpdateAppointmentPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests to update payment details.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String methodID = request.getParameter("methodID");
        String cardHolder = request.getParameter("cardHolder");
        String cardNo = request.getParameter("cardNo");
        String expMonth = request.getParameter("expMonth");
        String cvv = request.getParameter("cvv");
        String doctorName = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String appointmentID = request.getParameter("appointmentID");

        // Log received data
        System.out.println("UpdateAppointmentPaymentServlet - Received: methodID=" + methodID + ", cardHolder=" + cardHolder +
                ", cardNo=" + cardNo + ", expMonth=" + expMonth + ", cvv=" + cvv + ", appointmentID=" + appointmentID);

        // Validate input
        String errorMessage = validateInput(cardHolder, cardNo, expMonth, cvv);
        if (errorMessage != null) {
            // Redirect on validation failure
            System.out.println("UpdateAppointmentPaymentServlet - Validation failed: " + errorMessage);
            response.sendRedirect("AppointmentPaymentDetails.jsp?status=" + errorMessage + "&methodID=" + (methodID != null ? methodID : "") +
                    "&cardHolder=" + (cardHolder != null ? cardHolder : "") +
                    "&cardNo=" + (cardNo != null ? cardNo : "") +
                    "&expMonth=" + (expMonth != null ? expMonth : "") +
                    "&cvv=" + (cvv != null ? cvv : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                    "&appointmentID=" + (appointmentID != null ? appointmentID : ""));
            return;
        }

        // Handle invalid or missing methodID
        boolean isNewPayment = false;
        if (methodID == null || methodID.trim().isEmpty() || methodID.equals("null")) {
            methodID = (String) request.getSession().getAttribute("currentMethodID");
            System.out.println("UpdateAppointmentPaymentServlet - Retrieved methodID from session: " + methodID);
            if (methodID == null || methodID.trim().isEmpty()) {
                // Generate new methodID by inserting a new payment record
                int newMethodID = AppointmentPaymentController.insertPaymentDetails(cardHolder, cardNo, expMonth, cvv);
                if (newMethodID == -1) {
                    System.out.println("UpdateAppointmentPaymentServlet - Failed to generate new methodID");
                    response.sendRedirect("AppointmentPaymentDetails.jsp?status=Error: Unable to generate methodID" +
                            "&cardHolder=" + (cardHolder != null ? cardHolder : "") +
                            "&cardNo=" + (cardNo != null ? cardNo : "") +
                            "&expMonth=" + (expMonth != null ? expMonth : "") +
                            "&cvv=" + (cvv != null ? cvv : "") +
                            "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                            "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                            "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                            "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                            "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                            "&appointmentID=" + (appointmentID != null ? appointmentID : ""));
                    return;
                }
                methodID = String.valueOf(newMethodID);
                request.getSession().setAttribute("currentMethodID", methodID);
                System.out.println("UpdateAppointmentPaymentServlet - Generated new methodID: " + methodID);
                isNewPayment = true; // Flag to indicate a new payment was created
            }
        }

        // Update payment details if not a new payment
        if (!isNewPayment) {
            boolean isTrue = AppointmentPaymentController.updatePayment(methodID, cardHolder, cardNo, expMonth, cvv);
            System.out.println("UpdateAppointmentPaymentServlet - Update result: " + isTrue);
            if (!isTrue) {
                List<AppointmentPaymentModel> paymentCheck = AppointmentPaymentController.getById(methodID);
                String detailedError = paymentCheck.isEmpty() ?
                    "Error: Update failed - methodID " + methodID + " not found in database" :
                    "Error: Update failed - database error";
                System.out.println("UpdateAppointmentPaymentServlet - Update failed: " + detailedError);
                response.sendRedirect("AppointmentPaymentDetails.jsp?status=" + detailedError + "&methodID=" + methodID +
                        "&cardHolder=" + (cardHolder != null ? cardHolder : "") +
                        "&cardNo=" + (cardNo != null ? cardNo : "") +
                        "&expMonth=" + (expMonth != null ? expMonth : "") +
                        "&cvv=" + (cvv != null ? cvv : "") +
                        "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                        "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                        "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                        "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                        "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                        "&appointmentID=" + (appointmentID != null ? appointmentID : ""));
                return;
            }
        }

        // Get payment details (new or updated)
        List<AppointmentPaymentModel> paymentDetails = AppointmentPaymentController.getById(methodID);
        System.out.println("UpdateAppointmentPaymentServlet - Payment details fetched: " + (paymentDetails != null ? paymentDetails.size() : "null"));
        if (!paymentDetails.isEmpty()) {
            AppointmentPaymentModel payment = paymentDetails.get(0);
            request.setAttribute("Payment", payment);
            request.setAttribute("methodID", String.valueOf(payment.getMethodID()));
            request.setAttribute("cardHolder", payment.getCardHolder());
            request.setAttribute("cardNo", payment.getCardNo());
            request.setAttribute("expMonth", payment.getExpMonth());
            request.setAttribute("cvv", payment.getCVV());
            request.setAttribute("status", isNewPayment ? "Payment Method Created Successfully!" : "Payment Method Update Succeeded!");
            request.getSession().setAttribute("currentMethodID", String.valueOf(payment.getMethodID()));
            request.setAttribute("doctorName", doctorName);
            request.setAttribute("specialization", specialization);
            request.setAttribute("hospital", hospital);
            request.setAttribute("date", date);
            request.setAttribute("time", time);
            request.setAttribute("appointmentID", appointmentID);

            // Fetch patient details
            if (appointmentID != null && !appointmentID.isEmpty()) {
                List<AppointmentModel> patientDetailsList = AppointmentController.getById(appointmentID);
                if (patientDetailsList != null && !patientDetailsList.isEmpty()) {
                    AppointmentModel patientDetails = patientDetailsList.get(0);
                    request.setAttribute("appointmentID", String.valueOf(patientDetails.getAppointmentID()));
                    request.setAttribute("name", patientDetails.getName());
                    request.setAttribute("age", patientDetails.getAge());
                    request.setAttribute("gender", patientDetails.getGender());
                    request.setAttribute("email", patientDetails.getEmail());
                    request.setAttribute("phone", patientDetails.getPhone());
                }
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("Index1.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("AppointmentPaymentDetails.jsp?status=Error: Payment not found after update&methodID=" + methodID +
                    "&cardHolder=" + (cardHolder != null ? cardHolder : "") +
                    "&cardNo=" + (cardNo != null ? cardNo : "") +
                    "&expMonth=" + (expMonth != null ? expMonth : "") +
                    "&cvv=" + (cvv != null ? cvv : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                    "&appointmentID=" + (appointmentID != null ? appointmentID : ""));
        }
    }

    /**
     * Validates payment input fields.
     * @return Error message or null if valid
     */
    private String validateInput(String cardHolder, String cardNo, String expMonth, String cvv) {
        if (cardHolder == null || cardNo == null || expMonth == null || cvv == null ||
            cardHolder.trim().isEmpty() || cardNo.trim().isEmpty() || expMonth.trim().isEmpty() || cvv.trim().isEmpty()) {
            return "Fill All Data!";
        }
        if (cardNo.length() != 12 || !cardNo.matches("\\d+")) {
            return "Invalid Card No!";
        }
        if (cardHolder.length() < 3 || cardHolder.length() > 50) {
            return "Invalid Card Holder's Name!";
        }
        if (cvv.length() != 3 || !cvv.matches("\\d+")) {
            return "Invalid CVV No!";
        }
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