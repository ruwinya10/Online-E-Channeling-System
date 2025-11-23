package com.echannelling.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.echannelling.model.Doctor;
import com.echannelling.service.DoctorDAO;

@WebServlet("/UpdateDoctorServlet")
@MultipartConfig
public class UpdateDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Utility method to extract the filename from the uploaded part
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    // Handles the POST request to update a doctor's information
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctor_id = request.getParameter("doctor_id");
        String full_name = request.getParameter("full_name");
        String title = request.getParameter("title");
        String specialization = request.getParameter("specialization");
        String qualifications = request.getParameter("qualifications");
        String experience = request.getParameter("experience");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");

        // Handle file upload for profile photo
        Part filePart = request.getPart("profile_photo");
        String profile_photo = "";
          
        if (filePart != null && filePart.getSize() > 0) {
        	// File was uploaded
            String fileName = extractFileName(filePart); 
            String uploadPath = getServletContext().getRealPath("") + "uploads";  // Path to save the file
            
            java.io.File uploadDir = new java.io.File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();  // Create upload directory if it doesn't exist
            
            String filePath = uploadPath + java.io.File.separator + fileName;
            filePart.write(filePath);  // Write file to disk
            profile_photo = "uploads/" + fileName;  // Save path to store in DB
        } else {
        	// No new file uploaded; retain the old photo from DB
            List<Doctor> doctors = DoctorDAO.getById(doctor_id);
            if (!doctors.isEmpty()) {
                profile_photo = doctors.get(0).getProfile_photo();
            }
        }
        
        // Update the doctor data in the database
        boolean isTrue = DoctorDAO.updatedata(doctor_id, full_name, title, specialization, qualifications, experience, gender, contact, email, profile_photo);
        if (isTrue) {
        	// If update successful, reload doctor details and alert the user
            List<Doctor> dctrdetails = DoctorDAO.getById(doctor_id);
            request.setAttribute("dctrdetails", dctrdetails);
            String alertMessage = "Data Update Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='GetDoctorServlet'</script>");
        } else {
        	// If update failed, forward to error page
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}