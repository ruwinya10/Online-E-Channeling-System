<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.echannelling.model.User"%>
<%
	//Retrieve the user object from the session
    User user = (User) session.getAttribute("user"); 
    
    // If the user is not logged in or is not a patient, redirect to the login page
    if (user == null || !"patient".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

 	// Extract user details from the session
    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    int userId = user.getId();
    String regDate = user.getRegisteredDate() != null ? user.getRegisteredDate().toString() : "N/A";
    String contextPath = request.getContextPath();  // Get the application context path for resource links
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Change Password</title>
<link rel="shortcut icon" href="<%= contextPath %>/images/halomed2.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="<%= contextPath %>/css/profile.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="profile-header-wrapper">
		<div class="top-banner">
			<img src="<%= contextPath %>/images/profileBanner5.webp"
				alt="Banner Image">
		</div>

		<div class="profile-info-container">
			<div class="profile-img-box">
				<img id="profileImagePreview"
					src="<%= user.getProfileImage() != null && !user.getProfileImage().isEmpty() ? contextPath + "/" + user.getProfileImage() : contextPath + "/images/profile1.jpg" %>?t=<%= System.currentTimeMillis() %>"
					alt="Profile Photo"
					style="cursor: pointer; height: 200px; width: 200px; border-radius: 50%; border: 2px solid #ccc;">
			</div>

			<div class="user-basic-info">
				<h2><%= firstName %>
					<%= lastName %></h2>
				<p>
					<i class="fas fa-id-badge"></i> Member ID: <strong><%= userId %></strong>
				</p>
				<p>
					<i class="fas fa-calendar-alt"></i> Registered on:
					<%= regDate %></p>
			</div>
		</div>
	</div>

	<div class="main-content">
		<div class="sidebar-nav">
			<div class="nav-item" onclick="window.location.href='profile.jsp'">
				<i class="fas fa-user icon"></i> My Profile
			</div>
			<div class="nav-item active">
				<i class="fas fa-lock icon"></i> Change Password
			</div>
			<div class="nav-item" onclick="window.location.href='Search.jsp'">
				<i class="fas fa-calendar-check icon"></i> Appointments
			</div>
			<div class="nav-item" onclick="window.location.href='lab_test.jsp'">
				<i class="fas fa-vial icon"></i> Lab Tests
			</div>
			<div class="nav-item" onclick="confirmLogout()">
				<i class="fas fa-arrow-right-from-bracket icon"></i> Log Out
			</div>
		</div>

		<div class="form-section">
			<h3>Change Password</h3>

			<!-- Display error or success message if passed as request parameters -->
			<% String errorMsg = request.getParameter("error"); %>
			<% String successMsg = request.getParameter("success"); %>

			<% if (errorMsg != null) { %>
			<p style="color: red; font-weight: bold;"><%= errorMsg %></p>
			<% } else if (successMsg != null) { %>
			<p style="color: green; font-weight: bold;"><%= successMsg %></p>
			<% } %>

			<form id="changePasswordForm" action="ChangePasswordServlet"
				method="post">
				<div class="password-row">
					<div class="password-field">
						<label for="currentPassword">Current Password</label> <input
							type="password" id="currentPassword" name="currentPassword"
							required>
					</div>
					<div class="password-field">
						<label for="newPassword">New Password</label> <input
							type="password" id="newPassword" name="newPassword" required>
					</div>
					<div class="password-field">
						<label for="confirmPassword">Confirm Password</label> <input
							type="password" id="confirmPassword" name="confirmPassword"
							required>
					</div>
				</div>

				<div class="form-buttons single-button">
					<button type="submit" class="update-btn fancy-btn">Update</button>
				</div>
			</form>
		</div>
	</div>
	<script>
	// Validate password strength before form submission
   document.getElementById("changePasswordForm").addEventListener("submit", function(event) {
	    const newPassword = document.getElementById("newPassword").value;

	    const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$/;

	    if (!strongPasswordRegex.test(newPassword)) {
	        alert("Password must be at least 8 characters and include uppercase, lowercase, digit, and special character.");
	        event.preventDefault(); // Prevent form submission
	    }
	});
   
   function confirmLogout() {
       if (confirm("Are you sure you want to log out?")) {
           window.location.href = "LogoutServlet";
       }
   }
   </script>
	<%@ include file="footer.jsp"%>
</body>
</html>
