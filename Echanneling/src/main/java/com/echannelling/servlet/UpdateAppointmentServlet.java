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
import com.echannelling.model.AppointmentPaymentModel;
import com.echannelling.service.AppointmentController;
import com.echannelling.service.AppointmentPaymentController;

/**
 * Servlet to handle updating appointment details.
 */
@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests to update appointment details.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String appointmentID = request.getParameter("appointmentID");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String methodID = request.getParameter("methodID");
        String doctorName = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Log received data
        System.out.println("UpdateAppointmentServlet - Received: appointmentID=" + appointmentID + ", name=" + name +
                ", methodID=" + methodID + ", doctorName=" + doctorName);

        // Validate input
        String errorMessage = validateInput(name, age, gender, email, phone);
        if (errorMessage != null) {
            // Redirect on validation failure
            response.sendRedirect("AppointmentDetails.jsp?status=" + errorMessage +
                    "&appointmentID=" + (appointmentID != null ? appointmentID : "") +
                    "&name=" + (name != null ? name : "") +
                    "&age=" + (age != null ? age : "") +
                    "&gender=" + (gender != null ? gender : "") +
                    "&email=" + (email != null ? email : "") +
                    "&phone=" + (phone != null ? phone : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                    "&methodID=" + (methodID != null ? methodID : ""));
            return;
        }

        // Update appointment details
        boolean isTrue = AppointmentController.updateAppointment(appointmentID, name, age, gender, email, phone);
        // Log update result
        System.out.println("Update Result: " + (isTrue ? "Success" : "Failed"));

        if (isTrue) {
            // Get updated patient details
            List<AppointmentModel> patientDetailsList = AppointmentController.getById(appointmentID);
            if (!patientDetailsList.isEmpty()) {
                AppointmentModel patientDetails = patientDetailsList.get(0);
                // Set patient attributes
                request.setAttribute("appointmentID", String.valueOf(patientDetails.getAppointmentID()));
                request.setAttribute("name", patientDetails.getName());
                request.setAttribute("age", patientDetails.getAge());
                request.setAttribute("gender", patientDetails.getGender());
                request.setAttribute("email", patientDetails.getEmail());
                request.setAttribute("phone", patientDetails.getPhone());
                request.setAttribute("status", "Patient Details Update Succeed!");
                // Set doctor details
                request.setAttribute("doctorName", doctorName);
                request.setAttribute("specialization", specialization);
                request.setAttribute("hospital", hospital);
                request.setAttribute("date", date);
                request.setAttribute("time", time);
                request.setAttribute("methodID", methodID);

                // Fetch payment details
                if (methodID != null && !methodID.isEmpty()) {
                    List<AppointmentPaymentModel> paymentDetails = AppointmentPaymentController.getById(methodID);
                    if (!paymentDetails.isEmpty()) {
                        AppointmentPaymentModel payment = paymentDetails.get(0);
                        // Set payment attributes
                        request.setAttribute("cardHolder", payment.getCardHolder());
                        request.setAttribute("cardNo", payment.getCardNo());
                        request.setAttribute("expMonth", payment.getExpMonth());
                        request.setAttribute("cvv", payment.getCVV());
                    }
                }

                // Forward to Index.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("Index1.jsp");
                dispatcher.forward(request, response);
            } else {
                // Redirect on patient not found
                response.sendRedirect("AppointmentDetails.jsp?status=Error: Patient not found after update" +
                        "&appointmentID=" + (appointmentID != null ? appointmentID : "") +
                        "&name=" + (name != null ? name : "") +
                        "&age=" + (age != null ? age : "") +
                        "&gender=" + (gender != null ? gender : "") +
                        "&email=" + (email != null ? email : "") +
                        "&phone=" + (phone != null ? phone : "") +
                        "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                        "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                        "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                        "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                        "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                        "&methodID=" + (methodID != null ? methodID : ""));
            }
        } else {
            // Redirect on update failure
            response.sendRedirect("AppointmentDetails.jsp?status=Error: Update failed" +
                    "&appointmentID=" + (appointmentID != null ? appointmentID : "") +
                    "&name=" + (name != null ? name : "") +
                    "&age=" + (age != null ? age : "") +
                    "&gender=" + (gender != null ? gender : "") +
                    "&email=" + (email != null ? email : "") +
                    "&phone=" + (phone != null ? phone : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : "") +
                    "&methodID=" + (methodID != null ? methodID : ""));
        }
    }

    /**
     * Validates appointment input fields.
     * @return Error message or null if valid
     */
    private String validateInput(String name, String age, String gender, String email, String phone) {
        // Check for empty fields
        if (name == null || age == null || gender == null || email == null || phone == null ||
            name.trim().isEmpty() || age.trim().isEmpty() || gender.trim().isEmpty() || email.trim().isEmpty() || phone.trim().isEmpty()) {
            return "Fill All Data!";
        }
        // Validate name length
        if (name.length() < 3 || name.length() > 50) {
            return "Invalid Name!";
        }
        // Validate age
        try {
            int ageValue = Integer.parseInt(age);
            if (ageValue < 1 || ageValue > 120) {
                return "Invalid Age!";
            }
        } catch (NumberFormatException e) {
            return "Invalid Age Format!";
        }
        // Validate gender
        if (!gender.equals("Male") && !gender.equals("Female")) {
            return "Invalid Gender!";
        }
        // Validate email
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Invalid Email!";
        }
        // Validate phone
        if (phone.length() != 10 || !phone.matches("\\d+")) {
            return "Invalid Phone Number!";
        }
        return null;
    }
}