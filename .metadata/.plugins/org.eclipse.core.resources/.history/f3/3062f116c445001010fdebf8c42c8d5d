package com.echannelling.servlet;

import com.echannelling.model.User;
import com.echannelling.service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/UpdatePatientServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 1024 * 1024 * 5,     // 5MB
                 maxRequestSize = 1024 * 1024 * 10) // 10MB
public class UpdatePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "Upload";
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif"};

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
    }

    private boolean isValidPhone(String phone) {
        return phone != null && phone.matches("^0\\d{9}$");
    }

    private boolean isValidNIC(String nic) {
        return nic != null && nic.matches("^\\d{9}[vV]$|^\\d{12}$");
    }

    private boolean isValidPassword(String password) {
        return password != null && 
               password.length() >= 8 &&
               password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*#?&]).{8,}$");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Read parameters from the submitted form
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String nic = request.getParameter("nic");
            String address = request.getParameter("address");
            String password = request.getParameter("password");

            HttpSession session = request.getSession();

            // Server-side validations
            if (!isValidEmail(email)) {
                session.setAttribute("error", "Invalid email format.");
                response.sendRedirect("editPatient.jsp?id=" + id);
                return;
            }

            if (!isValidPhone(phone)) {
                session.setAttribute("error", "Phone must be 10 digits.");
                response.sendRedirect("editPatient.jsp?id=" + id);
                return;
            }

            if (!isValidNIC(nic)) {
                session.setAttribute("error", "Invalid NIC format.");
                response.sendRedirect("editPatient.jsp?id=" + id);
                return;
            }

            if (!isValidPassword(password)) {
                session.setAttribute("error", "Password must be at least 8 characters long and contain uppercase, lowercase, digit, and special character.");
                response.sendRedirect("editPatient.jsp?id=" + id);
                return;
            }

            UserDAO dao = new UserDAO();

            // Duplicate email/NIC check excluding current user
            if (dao.isEmailOrNicTaken(email, nic, id)) {
                session.setAttribute("error", "Email or NIC already exists.");
                response.sendRedirect("editPatient.jsp?id=" + id);
                return;
            }

            // Retrieve existing user to preserve profileImage
            User existingUser = dao.getUserById(id);
            if (existingUser == null) {
                session.setAttribute("error", "User not found.");
                response.sendRedirect("patientManagement.jsp");
                return;
            }

            // Handle file upload
            String imagePath = existingUser.getProfileImage() != null ? existingUser.getProfileImage() : "images/profile1.jpg";
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                // Validate file extension
                boolean validExtension = false;
                for (String ext : ALLOWED_EXTENSIONS) {
                    if (fileName.toLowerCase().endsWith(ext)) {
                        validExtension = true;
                        break;
                    }
                }
                if (!validExtension) {
                    session.setAttribute("error", "Only JPG, JPEG, PNG, or GIF files are allowed.");
                    response.sendRedirect("editPatient.jsp?id=" + id);
                    return;
                }

                // Save file
                String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                System.out.println("Save path: " + savePath);
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    System.out.println("Creating Upload directory: " + savePath);
                    fileSaveDir.mkdirs();
                }
                if (!fileSaveDir.canWrite()) {
                    System.out.println("Upload directory is not writable: " + savePath);
                    session.setAttribute("error", "Server error: Cannot write to upload directory.");
                    response.sendRedirect("editPatient.jsp?id=" + id);
                    return;
                }
                String newFileName = "user_" + id + "_" + System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
                String fullPath = savePath + File.separator + newFileName;
                try {
                    filePart.write(fullPath);
                    File savedFile = new File(fullPath);
                    if (savedFile.exists()) {
                        imagePath = UPLOAD_DIR + "/" + newFileName;
                        System.out.println("Saved file to: " + fullPath);
                        System.out.println("New profileImage path: " + imagePath);
                        String imageUrl = request.getContextPath() + "/" + imagePath;
                        System.out.println("Image URL: " + imageUrl);
                    } else {
                        System.out.println("Failed to save file to: " + fullPath);
                        session.setAttribute("error", "Failed to save uploaded image.");
                        response.sendRedirect("editPatient.jsp?id=" + id);
                        return;
                    }
                } catch (IOException e) {
                    System.out.println("Error saving file: " + e.getMessage());
                    session.setAttribute("error", "Error saving uploaded image.");
                    response.sendRedirect("editPatient.jsp?id=" + id);
                    return;
                }
            }

            // Create and populate the User object with updated data
            User updatedUser = new User();
            updatedUser.setId(id);
            updatedUser.setTitle(title);
            updatedUser.setFirstName(firstName);
            updatedUser.setLastName(lastName);
            updatedUser.setEmail(email);
            updatedUser.setPhone(phone);
            updatedUser.setNic(nic);
            updatedUser.setAddress(address);
            updatedUser.setPassword(password);
            updatedUser.setRole("patient");
            updatedUser.setRegisteredDate(Date.valueOf(LocalDate.now()));
            updatedUser.setProfileImage(imagePath);

            boolean success = dao.updateUser(updatedUser);

            if (success) {
                session.setAttribute("message", "Patient updated successfully!");
            } else {
                session.setAttribute("error", "Failed to update patient. Please try again.");
            }

            response.sendRedirect("patientManagement.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("error", "An error occurred while updating the patient.");
            response.sendRedirect("patientManagement.jsp");
        }
    }
}