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

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String inquiry = request.getParameter("inquiry");
        
     // Server-side validation
        if (!phone.matches("^0\\d{9}$")) {
            request.setAttribute("message", "Invalid phone number. It must start with 0 and be exactly 10 digits.");
            request.getRequestDispatcher("contactSupport.jsp").forward(request, response);
            return;
        }

        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            request.setAttribute("message", "Invalid email format.");
            request.getRequestDispatcher("contactSupport.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO contact (name, phone, email, inquiry) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, email);
            pstmt.setString(4, inquiry);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "Inquiry submitted successfully!");
            } else {
                request.setAttribute("message", "Submission failed. Try again.");
            }

            request.getRequestDispatcher("contactSupport.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("contactSupport.jsp").forward(request, response);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
    }
}
