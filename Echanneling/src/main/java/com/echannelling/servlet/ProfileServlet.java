package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.echannelling.model.User;

/**
 * Servlet to handle patient profile view.
 * Applies encapsulation and session-based authentication.
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles GET request for the profile page.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get current session and user object
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // Only allow patients to view the profile page
        if (user == null || !"patient".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Forward to profile.jsp to display user info
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
