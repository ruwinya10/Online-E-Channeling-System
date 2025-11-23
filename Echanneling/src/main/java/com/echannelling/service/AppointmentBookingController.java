package com.echannelling.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.echannelling.model.AppointmentBookingModel;
import com.echannelling.util.DBConnection;

/**
 * Handles database operations for appointment bookings.
 */
public class AppointmentBookingController {

    /**
     * Inserts a new booking into appointmentbooking table.
     * @return true if successful, false otherwise
     */
    public static boolean insertBooking(int appointmentID, int methodID, String doctorName, 
                                       String specialization, String hospital, String date, String time) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean isSuccess = false;

        try {
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to insert booking
            String sql = "INSERT INTO appointmentbooking (appointmentID, methodID, doctorName, specialization, hospital, date, time) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            // Set parameters
            pstmt.setInt(1, appointmentID);
            pstmt.setInt(2, methodID);
            pstmt.setString(3, doctorName);
            pstmt.setString(4, specialization);
            pstmt.setString(5, hospital);
            pstmt.setString(6, date);
            pstmt.setString(7, time);

            // Log query
            System.out.println("Insert Booking SQL: " + sql + " [appointmentID=" + appointmentID + ", methodID=" + methodID +
                    ", doctorName=" + doctorName + ", specialization=" + specialization + ", hospital=" + hospital +
                    ", date=" + date + ", time=" + time + "]");
            // Execute insert
            int rs = pstmt.executeUpdate();
            isSuccess = rs > 0;

            // Get generated bookingID
            if (isSuccess) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int bookingID = generatedKeys.getInt(1);
                    System.out.println("Generated Booking ID: " + bookingID);
                }
            } else {
                // Log failure
                System.out.println("Insert Booking Failed: No rows affected.");
            }
        } catch (SQLException e) {
            // Log error
            e.printStackTrace();
            System.out.println("Insert Booking Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, null);
        }
        return isSuccess;
    }

    /**
     * Retrieves the latest booking.
     * @return Latest booking or null if none found
     */
    public static AppointmentBookingModel getLatestBooking() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AppointmentBookingModel booking = null;

        try {
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to get latest booking
            String sql = "SELECT * FROM appointmentbooking ORDER BY bookingID DESC LIMIT 1";
            pstmt = con.prepareStatement(sql);

            // Log query
            System.out.println("Get Latest Booking SQL: " + sql);
            // Execute query
            rs = pstmt.executeQuery();

            // Process result
            if (rs.next()) {
                int bookingID = rs.getInt("bookingID");
                int appointmentID = rs.getInt("appointmentID");
                int methodID = rs.getInt("methodID");
                String doctorName = rs.getString("doctorName");
                String specialization = rs.getString("specialization");
                String hospital = rs.getString("hospital");
                String date = rs.getString("date");
                String time = rs.getString("time");

                // Create booking model
                booking = new AppointmentBookingModel(bookingID, appointmentID, methodID, doctorName, 
                                                    specialization, hospital, date, time);
            } else {
                // Log no booking found
                System.out.println("Get Latest Booking: No booking found.");
            }
        } catch (SQLException e) {
            // Log error
            e.printStackTrace();
            System.out.println("Get Latest Booking Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, rs);
        }
        return booking;
    }

    /**
     * Closes database resources.
     */
    private static void closeResources(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            // Close ResultSet
            if (rs != null) rs.close();
            // Close PreparedStatement
            if (pstmt != null) pstmt.close();
            // Close Connection
            if (con != null) con.close();
        } catch (SQLException e) {
            // Log error
            e.printStackTrace();
        }
    }
}