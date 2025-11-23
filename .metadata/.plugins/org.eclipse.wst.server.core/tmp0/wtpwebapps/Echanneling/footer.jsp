<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
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
				<a href="https://www.facebook.com"><img src="images/facebook_logo.webp" alt="Facebook" width="47px"></a>
				<a href="https://www.whatsapp.com"><img src="images/whatsapp-r.png" alt="WhatsApp" width="52px"></a>
				<a href="https://www.twitter.com"><img src="images/twitter_l.webp" alt="Twitter" width="52px"></a>
			</div>
		</div>
	</div>
	<p>&copy; 2025 E-Channeling. All rights reserved.</p>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.footer-column h3').forEach(h => {
      h.classList.add('show');
    });
  });
</script>
