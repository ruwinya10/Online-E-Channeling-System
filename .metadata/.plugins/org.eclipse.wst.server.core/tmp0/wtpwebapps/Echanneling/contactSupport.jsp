<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HaloMed | Contact Support</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="images/halomed2.png">
<link rel="stylesheet" href="css/contact.css">
<style>
html, body {
  height: 100%;
  margin: 0;
  display: flex;
  flex-direction: column;
  background: url('images/feedn6.jpg') no-repeat center center/cover;
  background-size: cover;
  font-family: "Roboto", sans-serif;
}

.main-container::before {
  content: "";
  position: fixed;
  top: 0; left: 0;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.7);
  z-index: -1;
}
</style>
</head>

<body>
<%@ include file="header.jsp"%>
<div class="main-container">
  <div class="container">
    <div class="content">

      <!-- Left Side -->
      <div class="info">
        <div class="title_div left_aligned">
          <h1>Contact Us</h1>
          <hr>
          <p>We're here to assist you! Whether you have questions about scheduling lab tests or appointments, or any other inquiries, please feel free to reach out to us through the contact methods below.</p>
        </div>

        <div class="image_holder">
          <img class="contact_img" src="images/contact.png" alt="Contact Us">
        </div>

        <div class="contact_information vertical">
          <div class="contact-item">
            <img src="images/phone.png" alt="Phone Icon" class="icon-img">
            <span>0112220772</span>
          </div>
          <div class="contact-item">
            <img src="images/email.png" alt="Email Icon" class="icon-img">
            <span>Support@halomed.lk</span>
          </div>
        </div>
      </div>

      <!-- Right Side: Contact Form -->
      <div class="form">
        <% String msg = (String) request.getAttribute("message"); %>
        <% if (msg != null) { %>
          <div style="color: green; font-weight: bold; margin-bottom: 10px;"><%= msg %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/ContactServlet" method="post">
          <label for="name">Name</label>
          <input type="text" id="name" name="name" placeholder="Enter your name" required>

          <label for="phone">Phone Number</label>
          <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="Enter your email" required>

          <label for="inquiry">Inquiry</label>
          <textarea id="inquiry" name="inquiry" rows="5" placeholder="Type your inquiry here" required></textarea>

          <button type="submit" class="submit_btn">Submit</button>
        </form>
      </div>

    </div>
  </div>
</div>
<script>
  document.querySelector("form").addEventListener("submit", function(event) {
    const phone = document.getElementById("phone").value.trim();
    const email = document.getElementById("email").value.trim();
    
    const phoneRegex = /^0\d{9}$/; // starts with 0, 10 digits total
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!phoneRegex.test(phone)) {
      alert("Please enter a valid 10-digit phone number that starts with 0.");
      event.preventDefault();
      return;
    }

    if (!emailRegex.test(email)) {
      alert("Please enter a valid email address.");
      event.preventDefault();
      return;
    }
  });
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
