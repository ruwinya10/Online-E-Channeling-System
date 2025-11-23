package com.echannelling.servlet;

import com.echannelling.model.User;
import com.echannelling.service.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Handles POST requests for login form
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String identifier = request.getParameter("identifier");
        String password = request.getParameter("password");

        // ✅ Validate input
        if (identifier == null || password == null) {
            request.setAttribute("error", "Please enter email/NIC and password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ OOP Concept: Abstraction - using DAO to handle DB logic
        UserDAO dao = new UserDAO();
        @SuppressWarnings("static-access")
        User user = dao.getUserByEmailOrNIC(identifier);

        // ✅ Check if user exists
        if (user == null) {
            request.setAttribute("error", "Email or NIC not found.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ Check password
        if (!user.getPassword().equals(password)) {
            request.setAttribute("error", "Incorrect password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ OOP Concept: Encapsulation – using getters/setters of User model
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("userType", user.getRole());

        // ✅ Redirect based on role
        if ("admin".equalsIgnoreCase(user.getRole())) {
            session.setAttribute("adminFirstName", user.getFirstName());
            session.setAttribute("adminLastName", user.getLastName());
            session.setAttribute("userType", "admin");
            response.sendRedirect("adminDashboard.jsp");
        } else {
            session.setAttribute("userType", "patient");
            response.sendRedirect("index.jsp");
        }
    }
}
