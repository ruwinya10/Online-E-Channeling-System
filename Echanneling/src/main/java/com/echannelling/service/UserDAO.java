package com.echannelling.service;

import com.echannelling.model.User;
import com.echannelling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	// Registers a new user into the database
    public boolean registerUser(User u) {
        String sql = "INSERT INTO user (title, firstName, lastName, email, phone, nic, password, address, role, registered_date, profileImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
        	// Set all user details
        	ps.setString(1, u.getTitle());
            ps.setString(2, u.getFirstName());
            ps.setString(3, u.getLastName());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getNic());
            ps.setString(7, u.getPassword());
            ps.setString(8, u.getAddress());
            ps.setString(9, u.getRole());
            ps.setDate(10, u.getRegisteredDate());
            
            // Use default profile image if none provided
            String profileImage = u.getProfileImage() != null && !u.getProfileImage().isEmpty() ? u.getProfileImage() : "images/profile1.jpg";
            ps.setString(11, profileImage);
            System.out.println("Registering user with profileImage: " + profileImage); // Debugging
            
            // Execute and get generated user ID
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        u.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Checks if an email or NIC already exists in the database
    public boolean isEmailOrNicTaken(String email, String nic) {
        String sql = "SELECT COUNT(*) FROM user WHERE email = ? OR nic = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email != null ? email : "");
            ps.setString(2, nic != null ? nic : "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Return true if any record found
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Checks if email or NIC is taken by another user (excluding the given user ID)
    public boolean isEmailOrNicTaken(String email, String nic, int excludeUserId) {
        String sql = "SELECT COUNT(*) FROM user WHERE (email = ? OR nic = ?) AND id != ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, nic);
            ps.setInt(3, excludeUserId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieves a user by email or NIC
    public static User getUserByEmailOrNIC(String identifier) {
        User user = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=? OR nic=?")) {
            ps.setString(1, identifier);
            ps.setString(2, identifier);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	// Populate user object from result set
                user = new User();
                user.setId(rs.getInt("id"));
                user.setTitle(rs.getString("title"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setNic(rs.getString("nic"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setRegisteredDate(rs.getDate("registered_date"));
                user.setProfileImage(rs.getString("profileImage"));
                System.out.println("Retrieved user by email/nic, profileImage: " + user.getProfileImage()); // Debugging
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Updates specific user fields (excluding password and role)
    public boolean updateUser(int userId, String title, String firstName, String lastName, String email,
            String phone, String nic, String address, String profileImage) {
    	String sql = "UPDATE user SET title=?, firstName=?, lastName=?, email=?, phone=?, nic=?, address=?, profileImage=? WHERE id=?";
    	try (Connection conn = DBConnection.getConnection();
    			PreparedStatement stmt = conn.prepareStatement(sql)) {
    			stmt.setString(1, title);
    			stmt.setString(2, firstName);
    			stmt.setString(3, lastName);
    			stmt.setString(4, email);
    			stmt.setString(5, phone);
    			stmt.setString(6, nic);
    			stmt.setString(7, address);
    			String finalProfileImage = profileImage != null && !profileImage.isEmpty() ? profileImage : "images/profile1.jpg";
    			stmt.setString(8, finalProfileImage);
    			stmt.setInt(9, userId);
    			System.out.println("Updating user ID " + userId + " with profileImage: " + finalProfileImage);
    			int rowsAffected = stmt.executeUpdate();
    			System.out.println("Update rows affected: " + rowsAffected);
    			return rowsAffected > 0;
    	} catch (SQLException e) {
    		System.out.println("SQL Error in updateUser: " + e.getMessage());
    		e.printStackTrace();
    		return false;
    	}
    }

    // Updates the entire user including password and role
    public boolean updateUser(User user) {
        String sql = "UPDATE user SET title=?, firstName=?, lastName=?, email=?, phone=?, nic=?, address=?, password=?, role=?, profileImage=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getTitle());
            stmt.setString(2, user.getFirstName());
            stmt.setString(3, user.getLastName());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhone());
            stmt.setString(6, user.getNic());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getPassword());
            stmt.setString(9, user.getRole());
            String profileImage = user.getProfileImage() != null && !user.getProfileImage().isEmpty() ? user.getProfileImage() : "images/profile1.jpg";
            stmt.setString(10, profileImage);
            stmt.setInt(11, user.getId());
            System.out.println("Updating user ID " + user.getId() + " with profileImage: " + profileImage);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Deletes a user by ID
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM user WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Updates user's password
    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE user SET password = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieves user by ID
    public User getUserById(int userId) {
        String sql = "SELECT * FROM user WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setTitle(rs.getString("title"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setNic(rs.getString("nic"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setRegisteredDate(rs.getDate("registered_date"));
                user.setProfileImage(rs.getString("profileImage"));
                System.out.println("Retrieved user ID " + userId + ", profileImage: " + user.getProfileImage()); // Debugging
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieves all users with role 'patient'
    public List<User> getAllPatients() {
        List<User> patients = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM user WHERE role = 'patient'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setTitle(rs.getString("title"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setNic(rs.getString("nic"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setRegisteredDate(rs.getDate("registered_date"));
                user.setProfileImage(rs.getString("profileImage"));
                patients.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patients;
    }
    
    // Inserts a new user (alternative method)
    public void insertUser(User user) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO user (title, firstName, lastName, email, phone, nic, address, password, role, registered_date, profileImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getTitle());
            stmt.setString(2, user.getFirstName());
            stmt.setString(3, user.getLastName());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhone());
            stmt.setString(6, user.getNic());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getPassword());
            stmt.setString(9, user.getRole());
            stmt.setDate(10, user.getRegisteredDate());
            String profileImage = user.getProfileImage() != null && !user.getProfileImage().isEmpty() ? user.getProfileImage() : "images/profile1.jpg";
            stmt.setString(11, profileImage);
            System.out.println("Inserting user with profileImage: " + profileImage); // Debugging
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}