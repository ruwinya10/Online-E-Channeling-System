package com.echannelling.service;

import com.echannelling.model.LabAppointmentModel;
import com.echannelling.util.DBConnection;
import java.sql.*;

public class LabAppointmentController {

    // Save Appointment and return generated ID
    public static int saveAppointment(LabAppointmentModel appointment) {
        String sql = "INSERT INTO lab_appointments (test_id, test_name, test_price, patient_name, email, appointment_date, appointment_time, hospital, payment_status, payment_date, payment_amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, appointment.getTestId());
            ps.setString(2, appointment.getTestName());
            ps.setDouble(3, appointment.getTestPrice());
            ps.setString(4, appointment.getPatientName());
            ps.setString(5, appointment.getEmail());
            ps.setString(6, appointment.getAppointmentDate());
            ps.setString(7, appointment.getAppointmentTime());
            ps.setString(8, appointment.getHospital());
            ps.setString(9, "Pending");
            ps.setNull(10, Types.DATE);
            ps.setDouble(11, 0.0);

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return the generated appointment ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Return 0 if failed
    }

    // Update Payment Status
    public static boolean updatePaymentStatus(String appointmentId, String paymentStatus, double paymentAmount) {
        String sql = "UPDATE lab_appointments SET payment_status = ?, payment_date = CURDATE(), payment_amount = ? WHERE appointment_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, paymentStatus);
            ps.setDouble(2, paymentAmount);
            ps.setInt(3, Integer.parseInt(appointmentId));

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    
}
