package com.echannelling.servlet;

import com.echannelling.service.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

/**
 * Handles AJAX requests to check if an email or NIC already exists.
 * Uses abstraction (DAO pattern).
 */
@WebServlet("/CheckUserExists")
public class CheckUserExists extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Responds with JSON to indicate if a user with the given email/NIC already exists.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String nic = request.getParameter("nic");

		// DAO used to abstract database logic
		boolean exists = new UserDAO().isEmailOrNicTaken(email, nic);

		// Return JSON response
		response.setContentType("application/json");
		response.getWriter().write("{\"exists\":" + exists + "}");
	}
}
