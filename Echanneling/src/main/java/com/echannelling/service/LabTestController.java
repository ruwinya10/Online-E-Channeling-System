package com.echannelling.service;

import com.echannelling.model.LabTestModel;
import com.echannelling.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LabTestController {

    // Insert Lab Test
    public static boolean insertdata(String testName, String description, String price) {
        String sql = "INSERT INTO lab_test (test_name, description, price) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, testName);
            ps.setString(2, description);
            ps.setDouble(3, Double.parseDouble(price));
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get All Lab Tests
    public static List<LabTestModel> getAllLabTests() {
        List<LabTestModel> labTests = new ArrayList<>();
        String sql = "SELECT * FROM lab_test";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                LabTestModel test = new LabTestModel();
                test.setTestId(rs.getInt("test_id"));
                test.setTestName(rs.getString("test_name"));
                test.setDescription(rs.getString("description"));
                test.setPrice(rs.getDouble("price"));
                labTests.add(test);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return labTests;
    }

    // Update Lab Test
    public static boolean updateLabTest(int testId, String testName, String description, String price) {
        String sql = "UPDATE lab_test SET test_name = ?, description = ?, price = ? WHERE test_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, testName);
            ps.setString(2, description);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setInt(4, testId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Lab Test
    public static boolean deleteLabTest(int testId) {
        String sql = "DELETE FROM lab_test WHERE test_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, testId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Lab Test by ID
    public static LabTestModel getLabTestById(int testId) {
        String sql = "SELECT * FROM lab_test WHERE test_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, testId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                LabTestModel test = new LabTestModel();
                test.setTestId(rs.getInt("test_id"));
                test.setTestName(rs.getString("test_name"));
                test.setDescription(rs.getString("description"));
                test.setPrice(rs.getDouble("price"));
                return test;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
