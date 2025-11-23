package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Handles GET request for logout
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ✅ OOP Concept: Encapsulation – session management
        HttpSession session = request.getSession(false); // Avoid creating a new session
        if (session != null) {
            session.invalidate(); // ✅ Logout the user
        }
        response.sendRedirect("index.jsp"); // ✅ Redirect to homepage
    }
}
