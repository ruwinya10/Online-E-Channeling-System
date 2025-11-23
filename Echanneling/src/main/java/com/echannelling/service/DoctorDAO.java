package com.echannelling.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.echannelling.model.Doctor;
import com.echannelling.util.DBConnection;

public class DoctorDAO {
	// Database helper objects
    private static Connection con = null;
    private static PreparedStatement pstmt = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Method to insert a new doctor record into the database
    public static boolean insertdata(String full_name, String title, String specialization, String qualifications, int experience, String gender, String contact, String email, String profile_photo) {
        boolean isSuccess = false;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO doctor (doctor_id, full_name, title, specialization, qualifications, experience, gender, contact, email, profile_photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, 0); // Auto-increment
            pstmt.setString(2, full_name);
            pstmt.setString(3, title);
            pstmt.setString(4, specialization);
            pstmt.setString(5, qualifications);
            pstmt.setInt(6, experience);
            pstmt.setString(7, gender);
            pstmt.setString(8, contact);
            pstmt.setString(9, email);
            pstmt.setString(10, profile_photo);
            
            int rs = pstmt.executeUpdate();  // Execute insertion
            if (rs > 0) {
                isSuccess = true;  // Insertion was successful
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print stack trace for debugging
            System.out.println("Error during doctor insertion: " + e.getMessage());
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

    // Returns the most recent doctor ID from the table
    public static int getLastDoctorId() {
        int doctor_id = -1;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT MAX(doctor_id) FROM doctor";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                doctor_id = rs.getInt(1);  // Get maximum (last) ID
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error getting last doctor_id: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return doctor_id;
    }

    // Returns doctor(s) by given ID
    public static List<Doctor> getById(String doctor_id) {
        int convertedID = Integer.parseInt(doctor_id);
        ArrayList<Doctor> dctr = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM doctor WHERE doctor_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);
            rs = pstmt.executeQuery();
            
            // Extract doctor details and map to Doctor object
            while (rs.next()) {
                int doc_id = rs.getInt("doctor_id");
                String full_name = rs.getString("full_name");
                String title = rs.getString("title");
                String specialization = rs.getString("specialization");
                String qualifications = rs.getString("qualifications");
                int experience = rs.getInt("experience");
                String gender = rs.getString("gender");
                String contact = rs.getString("contact");
                String email = rs.getString("email");
                String profile_photo = rs.getString("profile_photo");

                Doctor d1 = new Doctor(doc_id, full_name, title, specialization, qualifications, experience, gender, contact, email, profile_photo);
                dctr.add(d1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dctr;
    }

    // Returns all doctors in the database
    public static List<Doctor> getAllBook() {
        ArrayList<Doctor> dctr = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM doctor";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int doc_id = rs.getInt("doctor_id");
                String full_name = rs.getString("full_name");
                String title = rs.getString("title");
                String specialization = rs.getString("specialization");
                String qualifications = rs.getString("qualifications");
                int experience = rs.getInt("experience");
                String gender = rs.getString("gender");
                String contact = rs.getString("contact");
                String email = rs.getString("email");
                String profile_photo = rs.getString("profile_photo");

                Doctor d1 = new Doctor(doc_id, full_name, title, specialization, qualifications, experience, gender, contact, email, profile_photo);
                dctr.add(d1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dctr;
    }

    // Updates doctor details based on doctor_id
    public static boolean updatedata(String doctor_id, String full_name, String title, String specialization, String qualifications, String experience, String gender, String contact, String email, String profile_photo) {
        boolean isSuccess = false;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE doctor SET full_name=?, title=?, specialization=?, qualifications=?, experience=?, gender=?, contact=?, email=?, profile_photo=? WHERE doctor_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, full_name);
            pstmt.setString(2, title);
            pstmt.setString(3, specialization);
            pstmt.setString(4, qualifications);
            pstmt.setInt(5, Integer.parseInt(experience));
            pstmt.setString(6, gender);
            pstmt.setString(7, contact);
            pstmt.setString(8, email);
            pstmt.setString(9, profile_photo);
            pstmt.setInt(10, Integer.parseInt(doctor_id));
            
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;  // Update successful
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

    // Deletes doctor data and related availability by doctor_id
    public static boolean deletedata(String doctor_id) {
        boolean isSuccess = false;
        int convID = Integer.parseInt(doctor_id);
        try {
            con = DBConnection.getConnection();
            
            // Delete availability related to doctor first due to foreign key constraint
            String sql = "DELETE FROM availability WHERE doctor_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convID);
            pstmt.executeUpdate();

            // Now delete doctor record
            sql = "DELETE FROM doctor WHERE doctor_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convID);
            
            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;  // Deletion successful
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