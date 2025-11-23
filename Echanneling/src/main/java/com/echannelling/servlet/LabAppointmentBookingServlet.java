package com.echannelling.servlet;

import com.echannelling.model.LabAppointmentModel;
import com.echannelling.service.LabAppointmentController;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.util.ArrayList;
import com.echannelling.util.DBConnection;

@WebServlet("/LabAppointmentBookingServlet")
public class LabAppointmentBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int testId = Integer.parseInt(request.getParameter("testId"));
        String testName = request.getParameter("testName");
        double testPrice = Double.parseDouble(request.getParameter("testPrice"));
        String patientName = request.getParameter("name");
        String email = request.getParameter("email");
        String appointmentDate = request.getParameter("date");
        String hospital = request.getParameter("hospital");

        String appointmentTime = calculateNextAvailableTime(appointmentDate, hospital);

        LabAppointmentModel appointment = new LabAppointmentModel(testId, testName, testPrice, patientName, email, appointmentDate, appointmentTime, hospital);

        int appointmentId = LabAppointmentController.saveAppointment(appointment);

        if (appointmentId > 0) {
            response.sendRedirect("LabPayment.jsp?appointmentId=" + appointmentId + "&testPrice=" + testPrice);
        } else {
            response.sendRedirect("book_lab_appointment.jsp?error=Failed to book appointment. Please try again.");
        }
    }

    private String calculateNextAvailableTime(String date, String hospital) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT appointment_time FROM lab_appointments WHERE appointment_date = ? AND hospital = ? ORDER BY appointment_time ASC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, date);
            ps.setString(2, hospital);
            ResultSet rs = ps.executeQuery();

            ArrayList<LocalTime> bookedTimes = new ArrayList<>();
            while (rs.next()) {
                bookedTimes.add(LocalTime.parse(rs.getString("appointment_time")));
            }

            LocalTime time = LocalTime.of(8, 0);
            while (time.isBefore(LocalTime.of(20, 0))) {
                if (!bookedTimes.contains(time)) {
                    return time.toString();
                }
                time = time.plusMinutes(10);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "08:00"; // Default if error
    }
}
