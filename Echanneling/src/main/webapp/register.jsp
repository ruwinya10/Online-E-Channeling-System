<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HaloMed | Sign Up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="images/halomed2.png">
<link rel="stylesheet" href="css/register.css">

<style>
html, body {
	height: 100%;
}

body {
	background-size: cover;
	margin: 0;
	padding: 0;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	font-family: "Roboto", sans-serif;
}

.page-wrapper {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.container {
	flex: 1;
}

footer {
	background: #0096c7;
	color: white;
	text-align: center;
	padding: 30px 0;
	margin-top: 20px;
}

.footer-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	text-align: left;
	padding: 20px;
}

.footer-column {
	width: 200px;
}

.footer-column h3 {
	color: white;
	border-bottom: 2px solid #32CD32;
	padding-bottom: 5px;
	position: relative;
	transform: translateY(30px);
	opacity: 0;
	transition: transform 0.6s ease-out, opacity 0.6s ease-out;
}

.footer-column h3.show {
	transform: translateY(0);
	opacity: 1;
}

.footer-column ul {
	list-style: none;
	padding: 0;
}

.footer-column ul li {
	margin: 10px 0;
}

.footer-column ul li a {
	color: white;
	text-decoration: none;
	transition: color 0.3s;
}

.footer-column ul li a:hover {
	color: #32CD32;
}

.social-icons {
	display: flex;
	gap: 10px;
	justify-content: center;
	margin-top: 10px;
}

.social-icons a {
	color: white;
	font-size: 20px;
	transition: color 0.3s;
}

.social-icons a:hover {
	color: #32CD32;
}
</style>
</head>

<body>
	<div class="page-wrapper">
		<!-- ✅ NEW WRAPPER -->

		<%@ include file="header.jsp"%>

		<div class="container">
			<div class="content">

				<!-- Left Column -->
				<div class="info">
					<div class="image_holder">
						<img class="contact_img" src="images/logo.png" alt="HaloMed Logo">
					</div>
					<div class="contact_information">
						<h2>Welcome to HaloMed</h2>
						<p class="quote">Empowering lives through digital healthcare –
							register now for secure and easy access to medical care.</p>
					</div>
				</div>

				<!-- Right Column: Form -->
				<div class="form form-card">
					<h2 class="form-heading">Personal Information</h2>
					<p class="form-subtext">Please fill the below fields</p>

					<% if (request.getAttribute("error") != null) { %>
					<p style="color: red; font-weight: 500;"><%= request.getAttribute("error") %></p>
					<% } %>

					<form id="registerForm" action="RegisterServlet" method="post">
						<div class="form-row title-row">
							<div>
								<label for="title">Title</label> <select id="title" name="title"
									required>
									<option value="">Select</option>
									<% String[] titles = {"Mr.", "Ms.", "Miss.", "Mrs.", "Dr.", "Prof.", "Rev.", "Sis.", "Hons.", "Baby.", "Master."};
                   String selectedTitle = request.getParameter("title");
                   for (String title : titles) { %>
									<option value="<%= title %>"
										<%= title.equals(selectedTitle) ? "selected" : "" %>><%= title %></option>
									<% } %>
								</select>
							</div>

							<div>
								<label for="firstName">First Name</label> <input type="text"
									id="firstName" name="firstName" placeholder="Enter your first name" required
									value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>">
							</div>

							<div>
								<label for="lastName">Last Name</label> <input type="text"
									id="lastName" name="lastName" placeholder="Enter your last name" required
									value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>">
							</div>
						</div>

						<div class="form-row">
							<div>
								<label for="email">Email</label> <input type="email" id="email"
									name="email" placeholder="Enter your email" required
									value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
							</div>
							<div>
								<label for="phone">Phone</label> <input type="tel" id="phone"
									name="phone" placeholder="0712345678"required
									value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>">
							</div>
						</div>

						<div class="form-row single">
							<label for="nic">NIC Number</label> <input type="text" id="nic"
								name="nic" placeholder="Enter your NIC"required
								value="<%= request.getParameter("nic") != null ? request.getParameter("nic") : "" %>">
						</div>

						<div class="form-row">
							<div>
								<label for="password">Password</label> <input type="password"
									id="password" name="password" placeholder="Enter your password"required>
							</div>
							<div>
								<label for="confirmPassword">Confirm Password</label> <input
									type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password"
									required>
							</div>
						</div>

						<div class="checkbox-row">
							<input type="checkbox" id="terms" name="terms" required
								<%= request.getParameter("terms") != null ? "checked" : "" %>>
							<label for="terms">I have read and accept the <a href="TermsandConditions.jsp">Terms and
									Conditions</a></label>
						</div>

						<input type="hidden" name="role" value="patient">

						<button type="submit" class="submit_btn">Register</button>

						<p class="signin-link">
							Already registered? <a href="login.jsp">Sign in</a>
						</p>
					</form>
				</div>
			</div>
		</div>

		<!-- ✅ FOOTER -->
		<footer>
			<div class="footer-container">
				<div class="footer-column">
					<h3>Services</h3>
					<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="GetDoctorServlet?view=profiles">Our Doctors</a></li>
				<li><a href="lab_test.jsp">Lab Tests</a></li>
				<li><a href="Search.jsp">Doctor Appointments</a></li>
			</ul>
		</div>

		<div class="footer-column">
			<h3>Quick Links</h3>
			<ul>
				<li><a href="about_us.jsp">About Us</a></li>
				<li><a href="contactSupport.jsp">Contact Us</a></li>
				<li><a href="feedback.jsp">Feedback</a></li>
				<li><a href="health_tips.jsp">Health Tips</a></li>
			</ul>
		</div>

		<div class="footer-column">
			<h3>Online Information</h3>
			<ul>
				<li><a href="TermsandConditions.jsp">Terms and Conditions</a></li>
				<li><a href="privacy_policy.jsp">Privacy Policy</a></li>
				<li><a href="refunds.jsp">Refunds</a></li>
				<li><a href="faq.jsp">FAQ</a></li>
			</ul>
		</div>

				<div class="footer-column">
					<h3>Find Us On</h3>
					<div class="social-icons">
						<a href="https://www.facebook.com"><img
							src="images/facebook_logo.webp" alt="Facebook" width="47px"></a>
						<a href="https://www.whatsapp.com"><img
							src="images/whatsapp-r.png" alt="WhatsApp" width="52px"></a> <a
							href="https://www.twitter.com"><img
							src="images/twitter_l.webp" alt="Twitter" width="52px"></a>
					</div>
				</div>
			</div>
			<p>&copy; 2025 E-Channeling. All rights reserved.</p>
		</footer>

	</div>
	<!-- ✅ END page-wrapper -->

	<script>
  document.addEventListener("DOMContentLoaded", () => {
    // Email, NIC, phone, password validation
  });

  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.footer-column h3').forEach(h => {
      h.classList.add('show');
    });
  });
</script>

</body>
</html>
