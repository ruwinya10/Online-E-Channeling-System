package com.echannelling.servlet;
// Servlet package declaration.

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.echannelling.model.User;
// Imports User model (used to check session user role).

import com.echannelling.service.UserDAO;
// Imports DAO for database deletion logic.

@WebServlet("/DeletePatientServlet")
// Maps servlet to /DeletePatientServlet URL.

public class DeletePatientServlet extends HttpServlet {
    // Extends HttpServlet to support HTTP methods.
    // OOP Concept: Inheritance

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handles POST requests (typically triggered by form submissions).

        HttpSession session = request.getSession(false);
        // Retrieves session without creating a new one.

        User admin = (session != null) ? (User) session.getAttribute("user") : null;
        // Retrieves logged-in user (expected to be an admin).

        if (admin == null || !"admin".equals(admin.getRole())) {
            // If no user is logged in or user is not an admin, redirect to login.
            response.sendRedirect("login.jsp");
            return;
        }

        String idParam = request.getParameter("id");
        // Retrieves patient ID from the request.

        try {
            int userId = Integer.parseInt(idParam);
            // Parses the ID string to integer.

            UserDAO dao = new UserDAO();
            // Creates DAO instance to access DB.
            // OOP Concept: Abstraction

            if (dao.deleteUser(userId)) {
                session.setAttribute("message", "Patient deleted successfully.");
            } else {
                session.setAttribute("error", "Failed to delete patient.");
            }
        } catch (NumberFormatException e) {
            // Handles the case where ID is not a valid integer.
            session.setAttribute("error", "Invalid patient ID.");
        }

        response.sendRedirect("patientManagement.jsp");
        // Redirects back to patient management page.
    }
}
