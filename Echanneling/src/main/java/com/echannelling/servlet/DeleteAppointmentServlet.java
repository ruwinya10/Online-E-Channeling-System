package com.echannelling.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.util.DBConnection;

/**
 * Servlet to handle appointment deletion.
 */
@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests to delete an appointment.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get bookingID from request
        String bookingIDStr = request.getParameter("bookingID");
        // Validate bookingID
        if (bookingIDStr == null || bookingIDStr.trim().isEmpty()) {
            request.setAttribute("status", "Error: Invalid bookingID.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
            dispatcher.forward(request, response);
            return;
        }

        int bookingID = 0;
        int appointmentID = 0;
        int methodID = 0;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Convert bookingID to integer
            bookingID = Integer.parseInt(bookingIDStr);
            // Get DB connection
            con = DBConnection.getConnection();

            // Get appointmentID and methodID
            String selectSql = "SELECT appointmentID, methodID FROM appointmentbooking WHERE bookingID = ?";
            pstmt = con.prepareStatement(selectSql);
            pstmt.setInt(1, bookingID);
            ResultSet rs = pstmt.executeQuery();
            boolean bookingFound = false;
            if (rs.next()) {
                appointmentID = rs.getInt("appointmentID");
                methodID = rs.getInt("methodID");
                bookingFound = true;
            }
            rs.close();

            // Check if booking exists
            if (!bookingFound) {
                request.setAttribute("status", "Error: Booking not found.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Delete from appointmentbooking
            String deleteBookingSql = "DELETE FROM appointmentbooking WHERE bookingID = ?";
            pstmt = con.prepareStatement(deleteBookingSql);
            pstmt.setInt(1, bookingID);
            int bookingRows = pstmt.executeUpdate();
            // Log deletion
            System.out.println("Deleted " + bookingRows + " rows from appointmentbooking.");

            // Delete from appointmentdetails
            String deletePatientSql = "DELETE FROM appointmentdetails WHERE appointmentID = ?";
            pstmt = con.prepareStatement(deletePatientSql);
            pstmt.setInt(1, appointmentID);
            int patientRows = pstmt.executeUpdate();
            // Log deletion
            System.out.println("Deleted " + patientRows + " rows from appointmentdetails.");

            // Delete from appointmentpayment
            String deletePaymentSql = "DELETE FROM appointmentpayment WHERE methodID = ?";
            pstmt = con.prepareStatement(deletePaymentSql);
            pstmt.setInt(1, methodID);
            int paymentRows = pstmt.executeUpdate();
            // Log deletion
            System.out.println("Deleted " + paymentRows + " rows from appointmentpayment.");

            // Set success message
            request.setAttribute("status", "Appointment Deleted Successfully!");
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            request.setAttribute("status", "Error: Invalid bookingID format.");
            e.printStackTrace();
        } catch (SQLException e) {
            // Handle SQL errors
            request.setAttribute("status", "Error: Failed to delete appointment - " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // Forward to Search.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
        dispatcher.forward(request, response);
    }
}