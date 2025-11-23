package com.echannelling.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.echannelling.service.LabTestController;

@WebServlet("/LabTestUpdateServlet")
public class LabTestUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int testId = Integer.parseInt(request.getParameter("test_id"));
        String testName = request.getParameter("test_name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");

        boolean isTrue = LabTestController.updateLabTest(testId, testName, description, price);

        if (isTrue) {
            request.setAttribute("message", "Lab Test updated successfully.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to update Lab Test.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("edit_lab_test.jsp?id=" + testId);
            dispatcher.forward(request, response);
        }
    }
}

