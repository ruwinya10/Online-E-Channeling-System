/**
 * Note this servlet is responsible for handling the addition of doctor details along with their availability information.
 */

package com.echannelling.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.echannelling.service.DoctorDAO;
import com.echannelling.service.AvailabilityDAO;

@WebServlet("/AddDoctorServlet")
@MultipartConfig
public class AddDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Extracts the filename from the 'content-disposition' header of the uploaded file
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// === 1. Retrieve Doctor details from the form submission ===
        String full_name = request.getParameter("full_name");
        String title = request.getParameter("title");
        String specialization = request.getParameter("specialization");
        String qualifications = request.getParameter("qualifications");
        int experience = Integer.parseInt(request.getParameter("experience"));
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");

        // Log incoming data
        System.out.println("Doctor Data: " + full_name + ", " + title + ", " + specialization + ", " + qualifications + ", " + experience + ", " + gender + ", " + contact + ", " + email);

        // Handle file upload for profile photo
        Part filePart = request.getPart("profile_photo");
        String profile_photo = "";
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            java.io.File uploadDir = new java.io.File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + java.io.File.separator + fileName;
            filePart.write(filePath);
            profile_photo = "uploads/" + fileName;
        }

        // === 3. Retrieve multiple availability entries from the form ===
        String[] hospital_names = request.getParameterValues("hospital_name");
        String[] locations = request.getParameterValues("location");
        String[] days = request.getParameterValues("day");
        String[] times = request.getParameterValues("time");
        String[] max_patients = request.getParameterValues("max_patients");
        String[] fees = request.getParameterValues("fee");

        // Convert time format from datetime-local (YYYY-MM-DDTHH:MM) to MySQL datetime (YYYY-MM-DD HH:MM:SS)
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (times != null) {
            for (int i = 0; i < times.length; i++) {
                if (times[i] != null && !times[i].isEmpty()) {
                    try {
                        Date date = inputFormat.parse(times[i]);
                        times[i] = outputFormat.format(date);
                    } catch (Exception e) {
                        System.err.println("Error parsing time: " + times[i]);
                        e.printStackTrace();
                    }
                }
            }
        }

        // Log all availability entries for debugging
        System.out.println("Availability Data: ");
        if (hospital_names != null) {
            for (int i = 0; i < hospital_names.length; i++) {
                System.out.println("Entry " + i + ": " + hospital_names[i] + ", " + locations[i] + ", " + days[i] + ", " + times[i] + ", " + max_patients[i] + ", " + fees[i]);
            }
        }

        // === 5. Insert Doctor data into database using DoctorDAO ===
        boolean isTrue = DoctorDAO.insertdata(full_name, title, specialization, qualifications, experience, gender, contact, email, profile_photo);
        if (isTrue) {
            int doctor_id = DoctorDAO.getLastDoctorId();  // Get inserted doctor ID
            if (doctor_id != -1) {
            	
            	// === 6. Insert availability entries using AvailabilityDAO ===
                if (hospital_names != null && hospital_names.length > 0) {
                    for (int i = 0; i < hospital_names.length; i++) {
                        if (hospital_names[i] != null && !hospital_names[i].isEmpty() &&
                            locations[i] != null && !locations[i].isEmpty() &&
                            days[i] != null && !days[i].isEmpty() &&
                            times[i] != null && !times[i].isEmpty() &&
                            max_patients[i] != null && !max_patients[i].isEmpty() &&
                            fees[i] != null && !fees[i].isEmpty()) {
                            try {
                                AvailabilityDAO.insertdata(doctor_id, hospital_names[i], locations[i], days[i], times[i], Integer.parseInt(max_patients[i]), fees[i]);
                            } catch (Exception e) {
                                System.err.println("Error during availability insertion: " + e.getMessage());
                                e.printStackTrace();
                            }
                        }
                    }
                }
                // Success alert and redirect
                String alertMessage = "Data Insert Successful";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetDoctorServlet';</script>");
            } else {
            	// Error if doctor ID couldn't be retrieved
                request.setAttribute("errorMessage", "Failed to retrieve doctor_id after insertion.");
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }
        } else {
        	// Error if doctor insertion failed
            request.setAttribute("errorMessage", "Failed to insert doctor data. Check server logs for details.");
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}