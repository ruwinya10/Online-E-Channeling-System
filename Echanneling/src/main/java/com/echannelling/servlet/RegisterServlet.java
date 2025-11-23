package com.echannelling.servlet;

import com.echannelling.model.User;
import com.echannelling.service.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

/**
 * Handles user registration logic.
 * Demonstrates OOP principles like encapsulation (User), abstraction (UserDAO).
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
	 * Processes registration form input and creates a new user if validation passes.
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		// Extract form input
        String title = request.getParameter("title");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Validate required fields
        if (title == null || title.isEmpty() || firstName == null || firstName.isEmpty() ||
            lastName == null || lastName.isEmpty() || email == null || email.isEmpty() ||
            phone == null || phone.isEmpty() || nic == null || nic.isEmpty() ||
            password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty() ||
            role == null || role.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Email validation
        if (!isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Phone number validation (starts with 0 and has 10 digits)
        if (!isValidPhone(phone)) {
            request.setAttribute("error", "Phone number must start with 0 and be 10 digits.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // NIC validation
        if (!isValidNic(nic)) {
            request.setAttribute("error", "Enter a valid NIC Format (e.g., 123456789V or 200012345678).");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Password strength
        if (!isValidPassword(password)) {
            request.setAttribute("error", "Password must be at least 8 characters long and contain uppercase, lowercase, digit, and special character.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Confirm password match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Email or NIC already registered, DAO check for duplicate email or NIC
        UserDAO dao = new UserDAO();
        if (dao.isEmailOrNicTaken(email, nic)) {
            request.setAttribute("error", "Email or NIC already registered.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

		// Create and populate User object (Encapsulation)
        User u = new User();
        u.setTitle(title);
        u.setFirstName(firstName);
        u.setLastName(lastName);
        u.setEmail(email);
        u.setPhone(phone);
        u.setNic(nic);
        u.setPassword(password);
        u.setAddress(""); // Optional
        u.setRole(role);
        u.setRegisteredDate(new Date(System.currentTimeMillis()));

		// Save user using DAO abstraction
        boolean success = dao.registerUser(u);
        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("user", u); // OOP: polymorphism if different roles use subclassing
            session.setAttribute("userType", u.getRole());
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Registration failed.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // Helper validation methods
    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }

    private boolean isValidPhone(String phone) {
        return phone != null && phone.matches("^0\\d{9}$");
    }

    private boolean isValidNic(String nic) {
        return nic != null && nic.matches("^[0-9]{9}[vV]$|^[0-9]{12}$");
    }

    private boolean isValidPassword(String password) {
        return password != null && password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%!^&*]).{8,}$");
    }
}
