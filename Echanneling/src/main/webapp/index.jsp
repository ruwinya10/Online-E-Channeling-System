<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HaloMed | Home</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="images/halomed2.png">
	<Style>
		/* General Styles */
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: white;
	}

	/* Slideshow Section */
	.slideshow-container {
		position: relative;
		width: 100%;
		height: 600px; /* Adjust height as needed */
		overflow: hidden;
	}

	.slides {
		display: none;
		width: 100%;
		height: 100%;
		object-fit: cover; /* Ensures image covers container */
	}

	/* Book Appointment Section */
	.hero {
		text-align: center;
		padding: 60px 20px;
		/*background: linear-gradient(to right, #0096c7, #00cec8); */
		color: white;
		background: #1e3a5f;
	}
	.hero p{
	     color: white;
	
	}

	.hero button {
		background: #0096c7;
		border: none;
		padding: 15px 25px;
		font-size: 18px;
		color: white;
		cursor: pointer;
		border-radius: 5px;
		transition: background 0.3s;
	}

	.hero button:hover {
		background: #0077b6;
	}

	/* Quick Access Section */
	.quick-access {
		display: flex;
		justify-content: center;
		margin: 30px 0;
	}

	.card {
		background: white;
		padding: 20px;
		margin: 10px;
		width: 200px;
		text-align: center;
		border-radius: 10px;
		box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
		cursor: pointer;
	}

	.card img {
		width: 100%;
		border-radius: 10px;
	}

	.card:hover {
		background: #caf0f8;
	}

	.quality-data {
		text-align: left;
		padding: 60px;
	}

	h2 {
		color: #333;
		margin-bottom: 40px;
	}

	.data-grid {
		display: grid;
		grid-template-columns: repeat(3, 1fr); /* Three items per row */
		gap: 15px;
	}


	.data-card {
		background-color: #1e3a5f;
		color: white;
		padding: 30px;
		border-radius: 10px;
		min-width: 200px;
		flex: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}

	.percentage {
		font-size: 1.8em;
		font-weight: bold;
	}

	.description {
		font-size: 0.9em;
		margin-top: 5px;
	}

	/* ================== SECTION BREAK ================== */

	/* Grid Section Background */
	.grid-section {
		background: url('images/back1.jpg') no-repeat center center/cover;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 50px 0;
		width: 100%;
	}

	/* Header Section */
	.grid-header {
		text-align: center;
		margin-bottom: 30px;
	}

	.grid-header h2 {
		font-size: 32px;
		color:#0096c7; 
		margin-bottom: 10px;
	}

	.grid-header p {
		font-size: 18px;
		color: gray;
	}

	/* Grid Cards Header Default Style */
	.card h3 {
		position: relative;
		transform: translateY(30px); /* Start slightly below */
		opacity: 0;
		transition: transform 0.6s ease-out, opacity 0.6s ease-out;
	}

	/* When header is in view, move it up */
	.card h3.show {
		transform: translateY(0);
		opacity: 1;
	}

	/* Grid Layout */
	.container {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 30px;
		width: 80%;
		max-width: 1200px;
    	margin: 0 auto;
    	box-sizing: border-box;
	}

	/* Clickable Cards */
	.container .card {
		background: rgba(255, 255, 255, 0.9);
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		text-align: center;
		cursor: pointer;
		transition: transform 0.3s, background 0.3s;
		width: 100%;
    	box-sizing: border-box;
	}

	/* Card Hover Effect */
	.container .card:hover {
		transform: scale(1.05);
		background: #caf0f8;
	}

	/* Responsive Design */
	@media (max-width: 1024px) {
		.container {
			grid-template-columns: repeat(2, 1fr);
			width: 90%;
		}
	}

	@media (max-width: 600px) {
		.container {
			grid-template-columns: repeat(1, 1fr);
			width: 90%;
		}
	}


	.additional-section {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 40px;
		background-color: white; /* Adjust as needed */
		margin-top: 40px;
		
	}

	.left-side {
		flex: 1;
		padding-right: 20px;
	}

	.right-side {
		flex: 1;
		padding-left: 20px;
	}

	/*.right-side img {
		width: 100%; /* Ensure it fits within its container 
		border-radius: 10px;
		box-shadow: white;
	} */

	.right-side img {
		width: 100%;
		border-radius: 10px;
		box-shadow: white;
		transform: translateY(100px); /* Start below */
		opacity: 0; /* Initially invisible */
		transition: transform 1s ease-out, opacity 1s ease-out;
	}

	/* When scrolled into view, apply animation */
	.right-side img.show {
		transform: translateY(0);
		opacity: 1;
	}

	h2 {
		color: #0077b6; /* Adjust the color */
		font-size: 24px;
		font-weight: bold;
		margin-bottom: 20px;
	}

	p {
		color: #333;
		font-size: 15px;
		line-height: 1.6;
	}

    </style>
</head>
<body>	
    <%@ include file="header.jsp" %>
   <!-- Slideshow -->
<div class="slideshow-container">
    <img class="slides" src="images/slide311.JPG" alt="Slide 1">
    <img class="slides" src="images/slide2.JPG" alt="Slide 2">
    <img class="slides" src="images/slide5.jpg" alt="Slide 3">
</div>

<!-- Book Now Section -->
<section id="home" class="hero">
    <h1>Book Your Doctor's Appointment Online</h1>
    <p>Find experienced doctors and schedule your visit easily.</p>
    <button onclick="location.href='Search.jsp'">Book Now</button>

</section>  

<div class="quality-data">
    <h2>Quality Data</h2>
    <div class="data-grid">
        <div class="data-card">
            <span class="percentage">94.82%</span>
            <span class="description">Patient Satisfaction Rate on Services</span>
        </div>
        <div class="data-card">
            <span class="percentage">97.30%</span>
            <span class="description">Compliance to Correct Patient Identification</span>
        </div>
        <div class="data-card">
            <span class="percentage">89.8%</span>
            <span class="description">Quick Booking Process</span>
        </div>
        <div class="data-card">
            <span class="percentage">85.8%</span>
            <span class="description">Efficient Appointment Management</span>
        </div>
        <div class="data-card">
            <span class="percentage">10.2%</span>
            <span class="description">Late Booking Process</span>
        </div>
        <div class="data-card">
            <span class="percentage">0.00%</span>
            <span class="description">Incorrect Appointments</span>
        </div>
        
    </div>
</div>

<!-- ==================== Quick Access Grid Section ==================== -->
<section class="grid-section">
    <!-- Header for the Grid Section -->
    <div class="grid-header">
        <h2>Use the convenience of our online services here</h2>
        <p>Caring for the health of you and your family</p>
    </div>

    <!-- Grid Container -->
    <div class="container">
	
	    
        <div class="card" onclick="location.href='Search.jsp'">
            <h3>CONSULTATION BOOKINGS</h3>
            <p>Make your consultant channeling appointment here.</p>
        </div>
		
        <div class="card" onclick="location.href='lab_test.jsp'">
            <h3>BOOKING LAB TESTS</h3>
            <p>Make your lab test appointment here.</p>
        </div>
        
        <div class="card" onclick="location.href='GetDoctorServlet?view=profiles'">
            <h3>AVAILABILITY OF DOCTORS</h3>
            <p>Monitor the available doctors.</p>
        </div>
		
        <div class="card" onclick="location.href='register.jsp'">
            <h3>PRE-REGISTRATION</h3>
            <p>Complete your registration before your visit.</p>
        </div>
        <div class="card" onclick="location.href='online_pharmacy.jsp'">
            <h3>ONLINE PHARMACY</h3>
            <p>Order prescriptions online for home delivery.</p>
        </div>
        <div class="card" onclick="location.href='about_us.jsp'">
            <h3>ABOUT US</h3>
            <p>Know about us here and make sure.</p>
        </div>
        <div class="card" onclick="location.href='contactSupport.jsp'">
            <h3>CONTACT US</h3>
            <p>Quickly contact us here.</p>
        </div>
        <div class="card" onclick="location.href='feedback.jsp'">
            <h3>PATIENT FEEDBACK</h3>
            <p>Share your experience with us.</p>
        </div>
    </div>
</section>

<section class="additional-section">
    <div class="left-side">
        <h2>WHY PATIENTS CHOOSE US</h2>
        <p>At HaloMed, we prioritize convenience, reliability, and accessibility to provide you with a seamless e-channeling experience. Our platform connects you with top healthcare professionals across various specialties, allowing you to book appointments from the comfort of your home. With user-friendly navigation, real-time availability updates, and secure payment options, we ensure that your healthcare needs are met with the utmost care and efficiency. Choose us for a hassle-free, efficient, and reliable way to manage your health appointments anytime, anywhere.</p>
    </div>
    <div class="right-side">
        <img src="images/back2.jpg" alt="Description of image">
    </div>
</section>
     
    <script>
		// Function to handle booking button click
		function bookNow() {
			alert("Redirecting to booking page...");
		}

		// Wait for the DOM to fully load before running the script
		document.addEventListener("DOMContentLoaded", function () {
			// Animating the hero section
			const heroSection = document.querySelector(".hero");
			heroSection.style.opacity = 0;
			heroSection.style.transform = "translateY(-20px)";
			
			setTimeout(() => {
				heroSection.style.transition = "all 1s ease-out";
				heroSection.style.opacity = 1;
				heroSection.style.transform = "translateY(0)";
			}, 300);

			// Hover effects for navigation links
			const navLinks = document.querySelectorAll("nav ul li a");
			navLinks.forEach(link => {
				link.addEventListener("mouseover", function () {
					this.style.transform = "scale(1.1)";
				});
				link.addEventListener("mouseleave", function () {
					this.style.transform = "scale(1)";
				});
			});
			
			//slide bar
		   let slideIndex = 0;
		function showSlides() {
			let slides = document.getElementsByClassName("slides");
			for (let i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) { slideIndex = 1; }
			slides[slideIndex - 1].style.display = "block";
			setTimeout(showSlides, 3000); // Change image every 3 seconds
		}
		showSlides();
		});

		document.addEventListener("DOMContentLoaded", function () {
			const gridCardHeaders = document.querySelectorAll(".card h3");

			const observer = new IntersectionObserver((entries) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						entry.target.classList.add("show");
					} else {
						entry.target.classList.remove("show");
					}
				});
			}, { threshold: 0.5 }); // Trigger when 50% of the element is in view

			gridCardHeaders.forEach(header => {
				observer.observe(header);
			});
		});


		//footer header animation
		document.addEventListener("DOMContentLoaded", function () {
			const footerHeaders = document.querySelectorAll(".footer-column h3");

			const observer = new IntersectionObserver((entries) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						entry.target.classList.add("show");
					} else {
						entry.target.classList.remove("show");
					}
				});
			}, { threshold: 0.5 }); // Trigger when 50% of the element is in view

			footerHeaders.forEach(header => {
				observer.observe(header);
			});
		});

		//image animation
		document.addEventListener("DOMContentLoaded", function () {
			const rightImage = document.querySelector(".right-side img");

			function checkScroll() {
				if (!rightImage) return; // Ensure element exists
				
				const sectionPosition = rightImage.getBoundingClientRect().top;
				const screenHeight = window.innerHeight;

				if (sectionPosition < screenHeight - 100) { 
					rightImage.classList.add("show"); // Add class when in view
					window.removeEventListener("scroll", checkScroll); // Run only once
				}
			}

			window.addEventListener("scroll", checkScroll);
			checkScroll(); // Run once to check if it's already visible on load
		});

		function toggleMenu() {
			document.querySelector('.nav-links').classList.toggle('active');
		} 
	</script>
	<%@ include file="footer.jsp" %>
</body>
</html>
