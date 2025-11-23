package com.echannelling.servlet;

import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.echannelling.model.User;
import com.echannelling.service.UserDAO;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 1024 * 1024 * 5,     // 5MB
                 maxRequestSize = 1024 * 1024 * 10) // 10MB
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^0\\d{9}$");
    private static final Pattern NIC_PATTERN = Pattern.compile("^(\\d{9}[VvXx]|\\d{12})$");
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif"};
    private static final String UPLOAD_DIR = "Upload";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"patient".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        String title = request.getParameter("title");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");

        // Handle file upload
        Part filePart = request.getPart("profileImage");
        String imagePath = user.getProfileImage() != null && !user.getProfileImage().isEmpty()
                ? user.getProfileImage()
                : "images/profile1.jpg";

        if (filePart != null && filePart.getSize() > 0) {
            String contentDisp = filePart.getHeader("content-disposition");
            String fileName = getFileNameFromPart(contentDisp);
            if (fileName != null) {
                boolean validExtension = false;
                for (String ext : ALLOWED_EXTENSIONS) {
                    if (fileName.toLowerCase().endsWith(ext)) {
                        validExtension = true;
                        break;
                    }
                }

                if (!validExtension) {
                    session.setAttribute("error", "Only JPG, JPEG, PNG, or GIF files are allowed.");
                    response.sendRedirect("profile.jsp");
                    return;
                }

                String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdirs();
                }

                if (!fileSaveDir.canWrite()) {
                    session.setAttribute("error", "Server error: Cannot write to upload directory.");
                    response.sendRedirect("profile.jsp");
                    return;
                }

                String newFileName = "user_" + userId + "_" + System.currentTimeMillis()
                        + fileName.substring(fileName.lastIndexOf("."));
                String fullPath = savePath + File.separator + newFileName;

                try {
                    filePart.write(fullPath);
                    File savedFile = new File(fullPath);
                    if (savedFile.exists()) {
                        imagePath = UPLOAD_DIR + "/" + newFileName;
                    } else {
                        session.setAttribute("error", "Failed to save uploaded image.");
                        response.sendRedirect("profile.jsp");
                        return;
                    }
                } catch (IOException e) {
                    session.setAttribute("error", "Error saving uploaded image.");
                    response.sendRedirect("profile.jsp");
                    return;
                }
            }
        }

        // Input validation
        if (title == null || title.isEmpty() || firstName == null || firstName.isEmpty() ||
            lastName == null || lastName.isEmpty() || phone == null || phone.isEmpty() ||
            email == null || email.isEmpty() || nic == null || nic.isEmpty()) {
            session.setAttribute("error", "All required fields must be filled.");
            response.sendRedirect("profile.jsp");
            return;
        }

        if (!EMAIL_PATTERN.matcher(email).matches()) {
            session.setAttribute("error", "Invalid email format.");
            response.sendRedirect("profile.jsp");
            return;
        }

        if (!PHONE_PATTERN.matcher(phone).matches()) {
            session.setAttribute("error", "Phone number must start with 0 and have exactly 10 digits.");
            response.sendRedirect("profile.jsp");
            return;
        }

        if (!NIC_PATTERN.matcher(nic).matches()) {
            session.setAttribute("error", "NIC must be a valid Sri Lankan NIC.");
            response.sendRedirect("profile.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        if (!email.equals(user.getEmail()) || !nic.equals(user.getNic())) {
            if (dao.isEmailOrNicTaken(email, nic, userId)) {
                session.setAttribute("error", "Email or NIC already taken.");
                response.sendRedirect("profile.jsp");
                return;
            }
        }

        boolean success = dao.updateUser(userId, title, firstName, lastName, email, phone, nic, address, imagePath);
        if (success) {
            User updatedUser = dao.getUserById(userId);
            if (updatedUser != null) {
                session.setAttribute("user", updatedUser);
                session.setAttribute("message", "Profile updated successfully.");
            } else {
                session.setAttribute("error", "Failed to retrieve updated user data.");
            }
        } else {
            session.setAttribute("error", "Failed to update profile.");
        }

        response.sendRedirect("profile.jsp");
    }

    private String getFileNameFromPart(String contentDisposition) {
        for (String part : contentDisposition.split(";")) {
            if (part.trim().startsWith("filename")) {
                return part.substring(part.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
