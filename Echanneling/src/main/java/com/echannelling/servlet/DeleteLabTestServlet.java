package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.echannelling.service.LabTestController;

@WebServlet("/DeleteLabTestServlet")
public class DeleteLabTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String testIdStr = request.getParameter("test_id");

        if (testIdStr == null || testIdStr.isEmpty()) {
            response.getWriter().println("Test ID is not provided.");
            return;
        }

        try {
            int testId = Integer.parseInt(testIdStr);
            LabTestController.deleteLabTest(testId);
            response.sendRedirect("admin_dashboard.jsp");
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Test ID format.");
        }
    }
}
