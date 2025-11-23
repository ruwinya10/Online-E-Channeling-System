<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.echannelling.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"patient".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    int userId = user.getId();
    String phone = user.getPhone();
    String email = user.getEmail();
    String address = user.getAddress() != null ? user.getAddress() : "";
    String nic = user.getNic();
    String title = user.getTitle();
    String regDate = user.getRegisteredDate() != null ? user.getRegisteredDate().toString() : "N/A";
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HaloMed | My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="shortcut icon" href="<%= contextPath %>/images/halomed2.png">
    <link rel="stylesheet" href="<%= contextPath %>/css/profile.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="profile-header-wrapper">
    <div class="top-banner">
        <img src="<%= contextPath %>/images/profileBanner5.webp" alt="Banner Image">
    </div>

    <div class="profile-info-container">
        <div class="profile-img-box">
            <img id="profileImagePreview"
                 src="<%= user.getProfileImage() != null && !user.getProfileImage().isEmpty() ? contextPath + "/" + user.getProfileImage() : contextPath + "/images/profile1.jpg" %>?t=<%= System.currentTimeMillis() %>"
                 alt="Profile Photo"
                 style="cursor: pointer; height: 200px; width: 200px; border-radius: 50%; border: 2px solid #ccc;">
        </div>

        <div class="user-basic-info">
            <h2><%= firstName %> <%= lastName %></h2>
            <p><i class="fas fa-id-badge"></i> Member ID: <strong><%= userId %></strong></p>
            <p><i class="fas fa-calendar-alt"></i> Registered on: <%= regDate %></p>
        </div>
    </div>
</div>

<div class="main-content">
    <div class="sidebar-nav">
        <div class="nav-item active"><i class="fas fa-user icon"></i> My Profile</div>
        <div class="nav-item" onclick="window.location.href='<%= contextPath %>/changePassword.jsp'"><i class="fas fa-lock icon"></i> Change Password</div>
        <div class="nav-item" onclick="window.location.href='<%= contextPath %>/Search.jsp'"><i class="fas fa-calendar-check icon"></i> Appointments</div>
        <div class="nav-item" onclick="window.location.href='<%= contextPath %>/lab_test.jsp'"><i class="fas fa-vial icon"></i> Lab Tests</div>
        <div class="nav-item" onclick="confirmLogout()"><i class="fas fa-arrow-right-from-bracket icon"></i> Log Out</div>
    </div>

    <div class="form-section">
        <h3>Personal Information</h3>
        <%
            String successMessage = (String) session.getAttribute("message");
            String errorMessage = (String) session.getAttribute("error");
            if (successMessage != null) {
        %>
        <p style="color:green;"><%= successMessage %></p>
        <%
                session.removeAttribute("message");
            }
            if (errorMessage != null) {
        %>
        <p style="color:red;"><%= errorMessage %></p>
        <%
                session.removeAttribute("error");
            }
        %>

        <form id="profileForm" action="<%= contextPath %>/UpdateProfileServlet" method="post" enctype="multipart/form-data">
            <!-- Hidden file input for profile image -->
            <input type="file" id="profileImageInput" name="profileImage" accept="image/*" style="display: none;" />

            <div class="row">
                <div class="field">
                    <label>Title</label>
                    <select id="title" name="title" required>
                        <option value="">Select</option>
                        <option <%= "Mr.".equals(title) ? "selected" : "" %>>Mr.</option>
                        <option <%= "Ms.".equals(title) ? "selected" : "" %>>Ms.</option>
                        <option <%= "Miss.".equals(title) ? "selected" : "" %>>Miss.</option>
                        <option <%= "Mrs.".equals(title) ? "selected" : "" %>>Mrs.</option>
                        <option <%= "Dr.".equals(title) ? "selected" : "" %>>Dr.</option>
                        <option <%= "Prof.".equals(title) ? "selected" : "" %>>Prof.</option>
                        <option <%= "Rev.".equals(title) ? "selected" : "" %>>Rev.</option>
                        <option <%= "Sis.".equals(title) ? "selected" : "" %>>Sis.</option>
                        <option <%= "Hons.".equals(title) ? "selected" : "" %>>Hons.</option>
                        <option <%= "Baby.".equals(title) ? "selected" : "" %>>Baby.</option>
                        <option <%= "Master.".equals(title) ? "selected" : "" %>>Master.</option>
                    </select>
                </div>
                <div class="field">
                    <label>First Name</label>
                    <input type="text" name="firstName" value="<%= firstName %>" required>
                </div>
                <div class="field">
                    <label>Last Name</label>
                    <input type="text" name="lastName" value="<%= lastName %>" required>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="<%= phone %>" required>
                </div>
                <div class="field">
                    <label>Email</label>
                    <input type="email" name="email" value="<%= email %>" required>
                </div>
            </div>

            <div class="field full-width">
                <label>Address</label>
                <input type="text" name="address" value="<%= address %>">
            </div>

            <div class="field full-width">
                <label>NIC</label>
                <input type="text" name="nic" value="<%= nic %>" required>
            </div>

            <div class="form-buttons">
                <div class="left">
                    <button type="button" class="delete-btn">Delete</button>
                </div>
                <div class="right">
                    <button type="button" class="cancel-btn">Cancel</button>
                    <button type="submit" class="update-btn">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    // Profile form actions
    document.querySelector(".cancel-btn")?.addEventListener("click", function () {
        document.getElementById("profileForm").reset();
        document.getElementById("profileImageInput").value = "";
        // Reset profile image preview to original
        document.getElementById("profileImagePreview").src = 
            "<%= user.getProfileImage() != null && !user.getProfileImage().isEmpty() ? contextPath + "/" + user.getProfileImage() : contextPath + "/images/profile1.jpg" %>?t=<%= System.currentTimeMillis() %>";
    });

    document.querySelector(".delete-btn")?.addEventListener("click", function () {
        if (confirm("Are you sure you want to delete your profile? This cannot be undone.")) {
            fetch('<%= contextPath %>/DeleteProfileServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(res => res.json())
              .then(data => {
                  if (data.success) {
                      alert("Profile deleted successfully.");
                      window.location.href = "<%= contextPath %>/login.jsp";
                  } else {
                      alert("Failed to delete profile: " + data.message);
                  }
              })
              .catch(error => {
                  console.error('Error:', error);
                  alert("An error occurred.");
              });
        }
    });

    function confirmLogout() {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = "<%= contextPath %>/LogoutServlet";
        }
    }

    // Click profile image to open file picker
    document.getElementById("profileImagePreview").addEventListener("click", function () {
        document.getElementById("profileImageInput").click();
    });

    // Preview the uploaded image
    document.getElementById("profileImageInput").addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("profileImagePreview").src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            alert("Please select a valid image file (JPG, JPEG, PNG, GIF).");
            document.getElementById("profileImageInput").value = ""; // Clear invalid input
        }
    });
</script>
<%@ include file="footer.jsp" %>
</body>
</html>