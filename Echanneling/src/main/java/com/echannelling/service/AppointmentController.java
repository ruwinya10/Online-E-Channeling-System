package com.echannelling.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.echannelling.model.AppointmentModel;
import com.echannelling.util.DBConnection;

// Class to handle database operations for managing appointment details
public class AppointmentController {

    // -----Insert Data-----//
    // Method to insert a new appointment record into the database
    public static boolean insertdataappointmentdetails(String name, String age, String gender, String email, String phone) {
        Connection con = null; // Database connection object
        PreparedStatement pstmt = null; // Prepared statement for executing SQL
        boolean isSuccess = false; // Flag to track if insertion was successful

        try {
            // Get a database connection from DBConnection utility
            con = DBConnection.getConnection();
            // SQL query to insert a new record; appointmentID set to 0 (likely auto-incremented by DB)
            String sql = "INSERT INTO appointmentdetails (appointmentID, name, age, gender, email, phone) VALUES (0, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql); // Prepare the SQL statement
            // Set parameter values for the prepared statement
            pstmt.setString(1, name);
            pstmt.setString(2, age);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);

            // Log the SQL query and parameters for debugging
            System.out.println("Insert SQL: " + sql + " [name=" + name + ", age=" + age + ", gender=" + gender +
                    ", email=" + email + ", phone=" + phone + "]");
            // Execute the insert query and get the number of affected rows
            int rs = pstmt.executeUpdate();
            // Mark as successful if rows were affected
            isSuccess = rs > 0;
        } catch (SQLException e) {
            // Handle SQL-related errors
            e.printStackTrace();
            System.out.println("Insert Exception: " + e.getMessage());
        } finally {
            // Close database resources to prevent leaks
            closeResources(con, pstmt, null);
        }
        // Return whether the insertion was successful
        return isSuccess;
    }

    // -----Get By ID-----//
    // Method to retrieve appointment details by appointment ID
    public static List<AppointmentModel> getById(String appointmentId) {
        Connection con = null; // Database connection object
        PreparedStatement pstmt = null; // Prepared statement for executing SQL
        ResultSet rs = null; // Result set to store query results
        ArrayList<AppointmentModel> appointments = new ArrayList<>(); // List to store retrieved appointments

        try {
            // Convert appointment ID from String to integer
            int convertedID = Integer.parseInt(appointmentId);
            // Get a database connection
            con = DBConnection.getConnection();
            // SQL query to select a record by appointmentID
            String sql = "SELECT * FROM appointmentdetails WHERE appointmentID = ?";
            pstmt = con.prepareStatement(sql); // Prepare the SQL statement
            // Set the appointmentID parameter
            pstmt.setInt(1, convertedID);

            // Log the SQL query and parameter for debugging
            System.out.println("GetById SQL: " + sql + " [appointmentID=" + convertedID + "]");
            // Execute the query and get the results
            rs = pstmt.executeQuery();

            // Iterate through the result set
            while (rs.next()) {
                // Extract data from the current row
                int appointmentID = rs.getInt("appointmentID");
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                // Create a new AppointmentModel object with the retrieved data
                AppointmentModel am = new AppointmentModel(appointmentID, name, age, gender, email, phone);
                // Add the object to the appointments list
                appointments.add(am);
            }
        } catch (SQLException | NumberFormatException e) {
            // Handle SQL errors or invalid appointmentID format
            e.printStackTrace();
            System.out.println("GetById Exception: " + e.getMessage());
        } finally {
            // Close database resources to prevent leaks
            closeResources(con, pstmt, rs);
        }
        // Return the list of appointments (may be empty if no records found)
        return appointments;
    }

    // -----Get All Data-----//
    // Method to retrieve all appointment records from the database
    public static List<AppointmentModel> getAllAppointment() {
        Connection con = null; // Database connection object
        PreparedStatement pstmt = null; // Prepared statement for executing SQL
        ResultSet rs = null; // Result set to store query results
        ArrayList<AppointmentModel> appointments = new ArrayList<>(); // List to store retrieved appointments

        try {
            // Get a database connection
            con = DBConnection.getConnection();
            // SQL query to select all records from appointmentdetails table
            String sql = "SELECT * FROM appointmentdetails";
            pstmt = con.prepareStatement(sql); // Prepare the SQL statement

            // Log the SQL query for debugging
            System.out.println("GetAll SQL: " + sql);
            // Execute the query and get the results
            rs = pstmt.executeQuery();

            // Iterate through the result set
            while (rs.next()) {
                // Extract data from the current row
                int appointmentID = rs.getInt("appointmentID");
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                // Create a new AppointmentModel object with the retrieved data
                AppointmentModel am = new AppointmentModel(appointmentID, name, age, gender, email, phone);
                // Add the object to the appointments list
                appointments.add(am);
            }
        } catch (SQLException e) {
            // Handle SQL-related errors
            e.printStackTrace();
            System.out.println("GetAll Exception: " + e.getMessage());
        } finally {
            // Close database resources to prevent leaks
            closeResources(con, pstmt, rs);
        }
        // Return the list of all appointments
        return appointments;
    }

    // -----Update Data----- //
    // Method to update an existing appointment record
    public static boolean updateAppointment(String appointmentID, String name, String age, String gender, String email, String phone) {
        Connection con = null; // Database connection object
        PreparedStatement pstmt = null; // Prepared statement for executing SQL
        boolean isSuccess = false; // Flag to track if update was successful

        try {
        	if (appointmentID == null || appointmentID.trim().isEmpty()) {
                System.out.println("UpdateAppointment - Error: appointmentID is null or empty");
                return false;
            }
            // Convert appointment ID from String to integer
            int convertedID = Integer.parseInt(appointmentID);
            // Get a database connection
            con = DBConnection.getConnection();
            // SQL query to update a record based on appointmentID
            String sql = "UPDATE appointmentdetails SET name = ?, age = ?, gender = ?, email = ?, phone = ? WHERE appointmentID = ?";
            pstmt = con.prepareStatement(sql); // Prepare the SQL statement
            // Set parameter values for the prepared statement
            pstmt.setString(1, name);
            pstmt.setString(2, age);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setInt(6, convertedID);

            // Log the SQL query and parameters for debugging
            System.out.println("Update SQL: " + sql + " [appointmentID=" + convertedID + ", name=" + name +
                    ", age=" + age + ", gender=" + gender + ", email=" + email + ", phone=" + phone + "]");
            // Execute the update query and get the number of affected rows
            int rs = pstmt.executeUpdate();
            // Mark as successful if rows were affected
            isSuccess = rs > 0;
            // Log the result of the update operation
            System.out.println("Update Result: " + (isSuccess ? "Success" : "No rows updated"));
        } catch (SQLException | NumberFormatException e) {
            // Handle SQL errors or invalid appointmentID format
            e.printStackTrace();
            System.out.println("Update Exception: " + e.getMessage());
        } finally {
            // Close database resources to prevent leaks
            closeResources(con, pstmt, null);
        }
        // Return whether the update was successful
        return isSuccess;
    }

    // Utility method to close resources
    // Method to safely close database resources
    private static void closeResources(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            // Close ResultSet if it exists
            if (rs != null) rs.close();
            // Close PreparedStatement if it exists
            if (pstmt != null) pstmt.close();
            // Close Connection if it exists
            if (con != null) con.close();
        } catch (SQLException e) {
            // Handle errors during resource closing
            e.printStackTrace();
        }
    }
}