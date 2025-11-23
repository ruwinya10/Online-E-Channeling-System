package com.echannelling.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.echannelling.model.Availability;
import com.echannelling.util.DBConnection;

public class AvailabilityDAO {
	// Database connection and statement objects
    private static Connection con = null;
    private static PreparedStatement pstmt = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Method to insert availability details into the database
    public static boolean insertdata(int doctor_id, String hospital_name, String location, String day, String time, int max_patients, String fee) {
        boolean isSuccess = false;
        
        try {
        	// Establish database connection
            con = DBConnection.getConnection();
            String sql = "INSERT INTO availability (availability_id, doctor_id, hospital_name, location, day, time, max_patients, fee) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            
            // Set parameters for the insert statement
            pstmt.setInt(1, 0);  // Placeholder value; auto-increment is handled by the DB
            pstmt.setInt(2, doctor_id);
            pstmt.setString(3, hospital_name);
            pstmt.setString(4, location);
            pstmt.setString(5, day);
            pstmt.setString(6, time);
            pstmt.setInt(7, max_patients);
            pstmt.setBigDecimal(8, new BigDecimal(fee));  // Convert fee to BigDecimal
            
            // Execute the update and check if insertion was successful
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
            
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Error during availability insertion: " + e.getMessage());
	        } finally {
	        	// Close resources to avoid memory leaks
	            try {
	                if (pstmt != null) pstmt.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return isSuccess;
    }
    
    // Method to retrieve availability records by doctor ID
    public static List<Availability> getByDoctorId(String doctor_id) {
    	
        int convertedID = Integer.parseInt(doctor_id);
        ArrayList<Availability> avails = new ArrayList<>();
        
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM availability WHERE doctor_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);
            rs = pstmt.executeQuery();
            
            // Process result set and create Availability objects
            while (rs.next()) {
                int availability_id = rs.getInt("availability_id");
                int doc_id = rs.getInt("doctor_id");
                String hospital_name = rs.getString("hospital_name");
                String location = rs.getString("location");
                String day = rs.getString("day");
                LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();
                int max_patients = rs.getInt("max_patients");
                BigDecimal fee = rs.getBigDecimal("fee");

                // Create Availability object and add to list
                Availability a1 = new Availability(availability_id, doc_id, hospital_name, location, day, time, max_patients, fee);
                avails.add(a1);
            }
            
          }catch (Exception e) {
        	  e.printStackTrace();
          }finally {
        	  try {
        		  if (rs != null) rs.close();
	              if (pstmt != null) pstmt.close();
	              if (con != null) con.close();
        	  }catch (Exception e) {
        	  	  e.printStackTrace();
              }
         }
         return avails;
    }

    // Method to update an availability record
    public static boolean updatedata(String availability_id, String hospital_name, String location, String day, String time, String max_patients, String fee) {
        boolean isSuccess = false;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE availability SET hospital_name=?, location=?, day=?, time=?, max_patients=?, fee=? WHERE availability_id=?";
            
            // Set updated values
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, hospital_name);
            pstmt.setString(2, location);
            pstmt.setString(3, day);
            pstmt.setString(4, time);
            pstmt.setInt(5, Integer.parseInt(max_patients));
            pstmt.setBigDecimal(6, new BigDecimal(fee));
            pstmt.setInt(7, Integer.parseInt(availability_id));
            
            // Execute update
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    // Method to delete an availability record by ID
    public static boolean deletedata(String availability_id) {
        boolean isSuccess = false;
        int convID = Integer.parseInt(availability_id);
        
        try {
            con = DBConnection.getConnection();
            String sql = "DELETE FROM availability WHERE availability_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convID);
            
            // Execute deletion
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
}