<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.echannelling.model.User" %>

<%@ page session="true" %>
<%
    // ✅ Get user from session
    User user = (User) session.getAttribute("user");

    // ✅ Redirect if already logged in
    if (user != null) {
        if ("admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("profile.jsp");
        }
        return;
    }
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>HaloMed | Sign In</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="images/halomed2.png">
  <link rel="stylesheet" href="css/login.css">
  <style>
  body {
  background-size: cover;
  margin: 0;
  padding: 0;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  font-family: "Roboto", sans-serif;
}
  
  </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
  <div class="content">
  
    <!-- Left Column: Info & Image -->
    <div class="info">
      <div class="image_holder">
        <img class="contact_img" src="images/logo.png" alt="HaloMed Logo">
      </div>
      <div class="contact_information">
        <h2>Welcome Back to HaloMed</h2>
        <p class="quote">Empowering lives through digital healthcare. Secure login to continue your journey.</p>
      </div>
    </div>

    <!-- Right Column: Login Form -->
    <div class="form form-card">
      <h2 class="form-heading">Sign in</h2>
      <p class="form-subtext">Please enter your email or NIC and the password to login.</p>

      <!-- Display login error if any -->
      <% 
      String error = (String) request.getAttribute("error");
      if (error != null) { 
      %>
        <p style="color:red; font-weight:500;"> <%= error %> </p>
      <% } %>

      <!-- ✅ OOP Concept: Abstraction via servlet interaction -->
      <form id="loginForm" action="LoginServlet" method="post">
        <div class="form-row single">
          <label for="identifier">Email / NIC</label>
          <input type="text" id="identifier" name="identifier" placeholder="Enter your Email / NIC" required>
        </div>

        <div class="form-row single">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <div class="checkbox-row">
          <div class="checkbox-container">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Keep me signed in</label>
          </div>
          <div class="forgot-link">
            <a href="contactSupport.jsp">Forgot password?</a>
          </div>
        </div>

        <button type="submit" class="submit_btn">Sign in</button>
        <p class="signin-link">Don’t have an account? <a href="register.jsp">Sign up</a></p>
      </form>
    </div>
  </div>
</div>

<!-- Client-side validation -->
<script>
document.querySelector("#loginForm")?.addEventListener("submit", function (e) {
    const identifier = document.getElementById("identifier").value.trim();
    const password = document.getElementById("password").value.trim();
    if (!identifier || !password) {
        e.preventDefault();
        alert("Please fill in both the email/NIC and password.");
    }
});
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
