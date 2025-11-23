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

/**
 * Servlet to handle insertion of appointment details.
 */
@WebServlet("/InsertAppointmentServlet")
public class InsertAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests to insert appointment details.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Get doctor details
        String doctorName = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");
        String hospital = request.getParameter("hospital");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Log received data
        System.out.println("InsertAppointmentServlet - Received: name=" + name + ", doctorName=" + doctorName);

        // Validate input
        String errorMessage = validateInput(name, age, gender, email, phone);
        if (errorMessage != null) {
            // Redirect on validation failure
            response.sendRedirect("AppointmentDetails.jsp?status=" + java.net.URLEncoder.encode(errorMessage, "UTF-8") +
                    "&name=" + (name != null ? java.net.URLEncoder.encode(name, "UTF-8") : "") +
                    "&age=" + (age != null ? java.net.URLEncoder.encode(age, "UTF-8") : "") +
                    "&gender=" + (gender != null ? java.net.URLEncoder.encode(gender, "UTF-8") : "") +
                    "&email=" + (email != null ? java.net.URLEncoder.encode(email, "UTF-8") : "") +
                    "&phone=" + (phone != null ? java.net.URLEncoder.encode(phone, "UTF-8") : "") +
                    "&doctorName=" + (doctorName != null ? java.net.URLEncoder.encode(doctorName, "UTF-8") : "") +
                    "&specialization=" + (specialization != null ? java.net.URLEncoder.encode(specialization, "UTF-8") : "") +
                    "&hospital=" + (hospital != null ? java.net.URLEncoder.encode(hospital, "UTF-8") : "") +
                    "&date=" + (date != null ? java.net.URLEncoder.encode(date, "UTF-8") : "") +
                    "&time=" + (time != null ? java.net.URLEncoder.encode(time, "UTF-8") : ""));
            return;
        }

        // Insert appointment details
        boolean isTrue = AppointmentController.insertdataappointmentdetails(name, age, gender, email, phone);
        // Log insertion result
        System.out.println("Insert Appointment Result: " + (isTrue ? "Success" : "Failed"));

        if (isTrue) {
            // Get all appointments
            List<AppointmentModel> allAppointments = AppointmentController.getAllAppointment();
            if (!allAppointments.isEmpty()) {
                // Get latest appointment
                AppointmentModel newAppointment = allAppointments.get(allAppointments.size() - 1);

                // Set appointment attributes
                request.setAttribute("Appointment", newAppointment);
                request.setAttribute("appointmentID", String.valueOf(newAppointment.getAppointmentID()));
                request.setAttribute("name", newAppointment.getName());
                request.setAttribute("age", newAppointment.getAge());
                request.setAttribute("gender", newAppointment.getGender());
                request.setAttribute("email", newAppointment.getEmail());
                request.setAttribute("phone", newAppointment.getPhone());
                request.setAttribute("status", "Data Insert Successful");

                // Set doctor details
                request.setAttribute("doctorName", doctorName);
                request.setAttribute("specialization", specialization);
                request.setAttribute("hospital", hospital);
                request.setAttribute("date", date);
                request.setAttribute("time", time);

                // Forward to Index.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("Index1.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle no appointments found
                request.setAttribute("status", "Error: No appointments found after insert");
                RequestDispatcher dispatcher = request.getRequestDispatcher("AppointmentDetails.jsp");
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