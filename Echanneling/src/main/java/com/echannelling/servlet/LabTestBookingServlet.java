package com.echannelling.servlet;

import com.echannelling.model.LabTestModel;
import com.echannelling.service.LabTestController;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LabTestBookingServlet")
public class LabTestBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the selected test ID
        String testIdStr = request.getParameter("testId");

        if (testIdStr == null || testIdStr.isEmpty()) {
            response.sendRedirect("lab_test.jsp?error=Invalid Test ID");
            return;
        }

        try {
            int testId = Integer.parseInt(testIdStr);
            LabTestModel labTest = LabTestController.getLabTestById(testId);

            if (labTest == null) {
                response.sendRedirect("lab_test.jsp?error=Test Not Found");
                return;
            }

            // Pass the test details to the booking form
            request.setAttribute("labTest", labTest);
            request.getRequestDispatcher("book_lab_appointment.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("lab_test.jsp?error=Invalid Test ID Format");
        }
    }
}
