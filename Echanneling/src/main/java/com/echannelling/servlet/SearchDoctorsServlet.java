package com.echannelling.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echannelling.util.DBConnection;

// Maps this servlet to the URL pattern "/SearchDoctorsServlet"
@WebServlet("/SearchDoctorsServlet")
public class SearchDoctorsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests (AJAX calls from dropdown changes)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type to HTML for AJAX response
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Query the database for doctors based on request parameters
            List<Map<String, String>> doctors = queryDoctors(request);
            // Generate HTML to display doctor results in the "doctorList" div
            if (!doctors.isEmpty()) {
                for (Map<String, String> doctor : doctors) {
                    // Create a div for each doctor result
                    out.println("<div class='doctor-result'>");
                    out.println("<div>");
                    // Display doctor details
                    out.println("<p><strong>Name:</strong> " + doctor.get("name") + "</p>");
                    out.println("<p><strong>Specialization:</strong> " + doctor.get("specialization") + "</p>");
                    out.println("<p><strong>Hospital:</strong> " + doctor.get("hospital") + "</p>");
                    out.println("<p><strong>Date:</strong> " + doctor.get("date") + "</p>");
                    out.println("<p><strong>Time:</strong> " + doctor.get("time") + "</p>");
                    out.println("<p><strong>Channelling Fee: </strong>Rs 4500.00</p>");
                    out.println("</div>");
                    // Create a link to book an appointment, encoding parameters to handle special characters
                    out.println("<a href='Index1.jsp?doctorName=" + java.net.URLEncoder.encode(doctor.get("name"), "UTF-8") +
                                "&specialization=" + java.net.URLEncoder.encode(doctor.get("specialization"), "UTF-8") +
                                "&hospital=" + java.net.URLEncoder.encode(doctor.get("hospital"), "UTF-8") +
                                "&date=" + java.net.URLEncoder.encode(doctor.get("date"), "UTF-8") +
                                "&time=" + java.net.URLEncoder.encode(doctor.get("time"), "UTF-8") + "'>");
                    out.println("<button type='button' class='book-btn'>Book Appointment</button>");
                    out.println("</a>");
                    out.println("</div>");
                }
            } else {
                // Display message if no doctors are found
            	out.println("<div class='error-container'>");
            	out.println("    <p class='error'>No doctors available for the selected criteria.</p>");
            	out.println("</div>");
            }
        } catch (Exception e) {
            // Handle other unexpected errors
        	out.println("<div class='error-container'>");
        	out.println("    <p class='error'>Error retrieving doctors: " + e.getMessage() + ". Please try again later.</p>");
        	out.println("</div>");
            e.printStackTrace();
        }
    }

    // Handles POST requests (form submissions from the "Search" button)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Query the database for doctors based on form parameters
            List<Map<String, String>> doctors = queryDoctors(request);
            // Store the doctors list in the request scope for Search.jsp to display
            request.setAttribute("doctors", doctors);
            // Forward the request to Search.jsp to render the results
            request.getRequestDispatcher("/Search.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle database connection or query errors
            request.setAttribute("error", "Database issue: " + e.getMessage() + ". Please check database configuration.");
            request.getRequestDispatcher("/Search.jsp").forward(request, response);
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other unexpected errors
            request.setAttribute("error", "Error retrieving doctors: " + e.getMessage() + ". Please try again later.");
            request.getRequestDispatcher("/Search.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    // Helper method to query the database for doctors based on request parameters
    private List<Map<String, String>> queryDoctors(HttpServletRequest request) throws Exception {
        // Retrieve parameters from the request (from either GET or POST) and trim whitespace
        String doctorname = request.getParameter("doctorname") != null ? request.getParameter("doctorname").trim() : "";
        String specialization = request.getParameter("specialization") != null ? request.getParameter("specialization").trim() : "";
        String hospital = request.getParameter("hospital") != null ? request.getParameter("hospital").trim() : "";
        String date = request.getParameter("date") != null ? request.getParameter("date").trim() : "";

        // Initialize a list to store doctor results
        List<Map<String, String>> doctors = new ArrayList<>();

        // Log the parameters for debugging
        System.out.println("Query parameters: doctorname=[" + doctorname + "], specialization=[" + specialization +
                           "], hospital=[" + hospital + "], date=[" + date + "]");

        // Get database connection from DBConnection class
        Connection conn = DBConnection.getConnection();
        if (conn == null) {
            // Throw an exception if connection is null
            throw new SQLException("Failed to establish database connection. Please check DBConnection settings.");
        }

        try {
            // Build a dynamic SQL query starting with a base condition
            StringBuilder query = new StringBuilder("SELECT doctor_name, doc_specialization, available_hospital, available_date, available_time FROM doctoravailable WHERE 1=1");
            // List to store parameter values for the prepared statement
            List<String> params = new ArrayList<>();
            // Append conditions based on non-empty parameters
            if (!doctorname.isEmpty()) {
                query.append(" AND doctor_name = ?");
                params.add(doctorname);
            }
            if (!specialization.isEmpty()) {
                query.append(" AND doc_specialization = ?");
                params.add(specialization);
            }
            if (!hospital.isEmpty()) {
                query.append(" AND available_hospital = ?");
                params.add(hospital);
            }
            if (!date.isEmpty()) {
                query.append(" AND available_date = ?");
                params.add(date);
            }

            // Log the query and parameters for debugging
            System.out.println("Executing query: " + query.toString());
            System.out.println("Parameters: " + params);

            // Prepare the SQL statement with the dynamic query
            PreparedStatement pst = conn.prepareStatement(query.toString());
            // Set parameter values in the prepared statement
            for (int i = 0; i < params.size(); i++) {
                pst.setString(i + 1, params.get(i));
            }

            // Execute the query and get the result set
            ResultSet rs = pst.executeQuery();

            // Populate the doctors list with query results
            while (rs.next()) {
                Map<String, String> doctor = new HashMap<>();
                doctor.put("name", rs.getString("doctor_name"));
                doctor.put("specialization", rs.getString("doc_specialization"));
                doctor.put("hospital", rs.getString("available_hospital"));
                doctor.put("date", rs.getString("available_date"));
                doctor.put("time", rs.getString("available_time"));
                doctors.add(doctor);
            }

            // Log the number of results and sample data if available
            System.out.println("Found " + doctors.size() + " doctors");
            if (!doctors.isEmpty()) {
                System.out.println("Sample result: " + doctors.get(0));
            }
        } finally {
            // Close the connection to avoid resource leaks
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Database connection closed.");
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e.getMessage());
                }
            }
        }

        // Return the list of doctors
        return doctors;
    }
}