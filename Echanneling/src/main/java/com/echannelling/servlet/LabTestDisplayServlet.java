// LabTestDisplayServlet.java
package com.echannelling.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.echannelling.model.LabTestModel;
import com.echannelling.service.LabTestController;

@WebServlet("/LabTestDisplayServlet")
public class LabTestDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LabTestModel> labTests = LabTestController.getAllLabTests();
        request.setAttribute("labTests", labTests);
        RequestDispatcher dispatcher = request.getRequestDispatcher("lab_test.jsp");
        dispatcher.forward(request, response);
    }
}
