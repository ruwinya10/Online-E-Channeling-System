package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.echannelling.model.User;          // Encapsulation of user data
import com.echannelling.service.UserDAO;     // Responsibility separation for DB operations

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet { // Inheritance from HttpServlet
	private static final long serialVersionUID = 1L;

	// Polymorphism: overrides doPost() method
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		// Encapsulation: get user from session
	    HttpSession session = request.getSession(false);
	    User user = (session != null) ? (User) session.getAttribute("user") : null;

	    // Abstraction: JSON response setup
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // Authorization check (Encapsulation + Responsibility check)
	    if (user == null) {
	        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	        response.getWriter().write("{\"success\": false, \"message\": \"Not logged in\"}");
	        return;
	    }

	    // Use DAO to delete user (encapsulation of persistence logic)
	    int userId = user.getId();
	    UserDAO dao = new UserDAO();

	    if (dao.deleteUser(userId)) {
	        session.invalidate(); // Clear session (Encapsulation)
	        response.getWriter().write("{\"success\": true}");
	    } else {
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("{\"success\": false, \"message\": \"Delete failed\"}");
	    }
	}
}
