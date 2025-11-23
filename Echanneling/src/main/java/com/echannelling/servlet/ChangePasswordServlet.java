package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.echannelling.model.User;
import com.echannelling.service.UserDAO;

/**
 * Servlet implementation for changing user passwords.
 * Applies encapsulation (via getters/setters in User model) and abstraction (via UserDAO).
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests to update user passwords.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the current session and user object
		HttpSession session = request.getSession(false);
		User user = (session != null) ? (User) session.getAttribute("user") : null;

		// If user is not logged in, redirect to login
		if (user == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		// Extract form parameters
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		// Check if current password matches
		if (!user.getPassword().equals(currentPassword)) {
			response.sendRedirect("changePassword.jsp?error=Incorrect current password.");
			return;
		}

		// Check if new and confirm passwords match
		if (!newPassword.equals(confirmPassword)) {
			response.sendRedirect("changePassword.jsp?error=New passwords do not match.");
			return;
		}
		
		// Check if the new password is strong
		if (!isStrongPassword(newPassword)) {
		    response.sendRedirect("changePassword.jsp?error=Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character.");
		    return;
		}

		// Use DAO (Data Access Object) to update password in database
		UserDAO dao = new UserDAO();
		boolean success = dao.updatePassword(user.getId(), newPassword);

		if (success) {
			// Update session with new password
			user.setPassword(newPassword); // OOP: encapsulation
			session.setAttribute("user", user);
			response.sendRedirect("changePassword.jsp?success=Password updated successfully.");
		} else {
			response.sendRedirect("changePassword.jsp?error=Password update failed.");
		}
	}
	private boolean isStrongPassword(String password) {
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
        return password != null && password.matches(passwordRegex);
    }
}
