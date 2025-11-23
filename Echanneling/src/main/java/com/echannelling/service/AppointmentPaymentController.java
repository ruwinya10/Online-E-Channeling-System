package com.echannelling.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.echannelling.model.AppointmentPaymentModel;
import com.echannelling.util.DBConnection;

/**
 * Handles database operations for appointment payment details.
 */
public class AppointmentPaymentController {

    /**
     * Inserts payment details into appointmentpayment table.
     * @return true if successful, false otherwise
     */
    public static int insertPaymentDetails(String cardHolder, String cardNo, String expMonth, String cvv) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet generatedKeys = null;
        int generatedID = -1;

        try {
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to insert payment
            String sql = "INSERT INTO appointmentpayment (methodID, cardHolder, cardNo, expMonth, cvv) VALUES (0, ?, ?, ?, ?)";
            
            // Set parameters
            pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, cardHolder);
            pstmt.setString(2, cardNo);
            pstmt.setString(3, expMonth);
            pstmt.setString(4, cvv);

            // Log query
            System.out.println("Insert Payment SQL: " + sql + " [cardHolder=" + cardHolder + ", cardNo=" + cardNo +
                    ", expMonth=" + expMonth + ", cvv=" + cvv + "]");
            // Execute insert
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedID = generatedKeys.getInt(1);
                    System.out.println("Generated methodID: " + generatedID);
                }
            }
        } catch (SQLException e) {
            // Log error
            e.printStackTrace();
            System.out.println("Insert Payment Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, generatedKeys);
        }
        return generatedID;
    }

    /**
     * Retrieves payments by method ID.
     * @param methodId The payment method ID
     * @return List of matching payments
     */
    public static List<AppointmentPaymentModel> getById(String methodId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<AppointmentPaymentModel> payments = new ArrayList<>();

        try {
            // Convert ID to integer
            int convertedID = Integer.parseInt(methodId);
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to select payment by ID
            String sql = "SELECT * FROM appointmentpayment WHERE methodID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);

            // Log query
            System.out.println("GetById Payment SQL: " + sql + " [methodID=" + convertedID + "]");
            // Execute query
            rs = pstmt.executeQuery();

            // Process results
            while (rs.next()) {
                int methodID = rs.getInt("methodID");
                String cardHolder = rs.getString("cardHolder");
                String cardNo = rs.getString("cardNo");
                String expMonth = rs.getString("expMonth");
                String cvv = rs.getString("cvv");

                // Create and add payment model
                AppointmentPaymentModel pm = new AppointmentPaymentModel(methodID, cardHolder, cardNo, expMonth, cvv);
                payments.add(pm);
            }
        } catch (SQLException | NumberFormatException e) {
            // Log error
            e.printStackTrace();
            System.out.println("GetById Payment Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, rs);
        }
        return payments;
    }

    /**
     * Retrieves all payment records.
     * @return List of all payments
     */
    public static List<AppointmentPaymentModel> getAllPayments() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<AppointmentPaymentModel> payments = new ArrayList<>();

        try {
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to select all payments
            String sql = "SELECT * FROM appointmentpayment ORDER BY methodID DESC";
            pstmt = con.prepareStatement(sql);

            // Log query
            System.out.println("GetAll Payments SQL: " + sql);
            // Execute query
            rs = pstmt.executeQuery();

            // Process results
            while (rs.next()) {
                int methodID = rs.getInt("methodID");
                String cardHolder = rs.getString("cardHolder");
                String cardNo = rs.getString("cardNo");
                String expMonth = rs.getString("expMonth");
                String cvv = rs.getString("cvv");

                // Create and add payment model
                AppointmentPaymentModel pm = new AppointmentPaymentModel(methodID, cardHolder, cardNo, expMonth, cvv);
                payments.add(pm);
            }
        } catch (SQLException e) {
            // Log error
            e.printStackTrace();
            System.out.println("GetAll Payments Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, rs);
        }
        return payments;
    }

    /**
     * Updates payment details for a given method ID.
     * @return true if successful, false otherwise
     */
    public static boolean updatePayment(String methodID, String cardHolder, String cardNo, String expMonth, String cvv) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean isSuccess = false;

        try {
            // Convert ID to integer
            int convertedID = Integer.parseInt(methodID);
            // Get DB connection
            con = DBConnection.getConnection();
            // SQL query to update payment
            String sql = "UPDATE appointmentpayment SET cardHolder = ?, cardNo = ?, expMonth = ?, cvv = ? WHERE methodID = ?";
            pstmt = con.prepareStatement(sql);
            // Set parameters
            pstmt.setString(1, cardHolder);
            pstmt.setString(2, cardNo);
            pstmt.setString(3, expMonth);
            pstmt.setString(4, cvv);
            pstmt.setInt(5, convertedID);

            // Log query
            System.out.println("Update Payment SQL: " + sql + " [methodID=" + convertedID + ", cardHolder=" + cardHolder +
                    ", cardNo=" + cardNo + ", expMonth=" + expMonth + ", cvv=" + cvv + "]");
            // Execute update
            int rs = pstmt.executeUpdate();
            isSuccess = rs > 0;
            // Log result
            System.out.println("Update Payment Result: " + (isSuccess ? "Success" : "No rows updated"));
        } catch (SQLException | NumberFormatException e) {
            // Log error
            e.printStackTrace();
            System.out.println("Update Payment Exception: " + e.getMessage());
        } finally {
            // Close resources
            closeResources(con, pstmt, null);
        }
        return isSuccess;
    }

    /**
     * Closes database resources to prevent leaks.
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