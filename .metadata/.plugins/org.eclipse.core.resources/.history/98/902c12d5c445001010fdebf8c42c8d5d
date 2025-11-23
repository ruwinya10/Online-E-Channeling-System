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

@WebServlet("/CreatePatientServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 1024 * 1024 * 5,     // 5MB
                 maxRequestSize = 1024 * 1024 * 10) // 10MB
public class CreatePatientServlet extends HttpServlet {
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
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate inputs
        if (!isValidEmail(email)) {
            request.setAttribute("errorMessage", "Invalid email format.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
            return;
        }

        if (!isValidPhone(phone)) {
            request.setAttribute("errorMessage", "Phone must start with 0 and have 10 digits.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
            return;
        }

        if (!isValidNIC(nic)) {
            request.setAttribute("errorMessage", "Invalid NIC format.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters long and contain uppercase, lowercase, digit, and special character.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        if (dao.isEmailOrNicTaken(email, nic)) {
            request.setAttribute("errorMessage", "Email or NIC already exists.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
            return;
        }

        // Handle file upload
        String imagePath = "images/profile1.jpg"; // Default image
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
                request.setAttribute("errorMessage", "Only JPG, JPEG, PNG, or GIF files are allowed.");
                request.getRequestDispatcher("createPatient.jsp").forward(request, response);
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
                request.setAttribute("errorMessage", "Server error: Cannot write to upload directory.");
                request.getRequestDispatcher("createPatient.jsp").forward(request, response);
                return;
            }
            // Use timestamp for temporary filename; ID will be set after insertion
            String tempFileName = "temp_" + System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
            String fullPath = savePath + File.separator + tempFileName;
            try {
                filePart.write(fullPath);
                File savedFile = new File(fullPath);
                if (!savedFile.exists()) {
                    System.out.println("Failed to save file to: " + fullPath);
                    request.setAttribute("errorMessage", "Failed to save uploaded image.");
                    request.getRequestDispatcher("createPatient.jsp").forward(request, response);
                    return;
                }
                imagePath = UPLOAD_DIR + "/" + tempFileName; // Temporary path
                System.out.println("Saved file to: " + fullPath);
            } catch (IOException e) {
                System.out.println("Error saving file: " + e.getMessage());
                request.setAttribute("errorMessage", "Error saving uploaded image.");
                request.getRequestDispatcher("createPatient.jsp").forward(request, response);
                return;
            }
        }

        // Create User object
        User user = new User();
        user.setTitle(title);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setNic(nic);
        user.setAddress(address);
        user.setPassword(password);
        user.setRole(role);
        user.setRegisteredDate(Date.valueOf(LocalDate.now()));
        user.setProfileImage(imagePath);

        // Insert user into database
        boolean success = dao.registerUser(user);
        if (success && filePart != null && filePart.getSize() > 0) {
            // Rename file with user ID
            int userId = user.getId(); // Set by registerUser via generated keys
            String oldFilePath = getServletContext().getRealPath("") + File.separator + imagePath;
            String finalFileName = "user_" + userId + imagePath.substring(imagePath.lastIndexOf("_"));
            String newFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + finalFileName;
            File oldFile = new File(oldFilePath);
            File newFile = new File(newFilePath);
            if (oldFile.exists()) {
                if (oldFile.renameTo(newFile)) {
                    imagePath = UPLOAD_DIR + "/" + finalFileName;
                    // Update database with final image path
                    dao.updateUser(userId, title, firstName, lastName, email, phone, nic, address, imagePath);
                    System.out.println("Renamed file to: " + newFilePath);
                } else {
                    System.out.println("Failed to rename file from: " + oldFilePath + " to: " + newFilePath);
                }
            }
        }

        if (success) {
            session.setAttribute("message", "Patient created successfully!");
            response.sendRedirect("patientManagement.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to create patient. Please try again.");
            request.getRequestDispatcher("createPatient.jsp").forward(request, response);
        }
    }
}