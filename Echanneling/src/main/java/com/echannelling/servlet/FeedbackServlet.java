package com.echannelling.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.util.DBConnection;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rating = request.getParameter("rating");
        String comments = request.getParameter("comments");
        
     // Server-side validation
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            request.setAttribute("message", "Invalid email format.");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
            return;
        }
        
        if (rating == null || rating.isEmpty()) {
            request.setAttribute("message", "Please select a rating.");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO feedback (name, email, rating, comments) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, rating);
            pstmt.setString(4, comments);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "feedback submitted successfully!");
            } else {
                request.setAttribute("message", "Submission failed. Try again.");
            }

            request.getRequestDispatcher("feedback.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
    }
}
		