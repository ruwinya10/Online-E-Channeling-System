<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Conditional Redirect - If labTests are not loaded, redirect to the servlet
    if (request.getAttribute("labTests") == null) {
        response.sendRedirect("LabTestDisplayServlet");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>HaloMed | Book Lab Appointment</title>
  <link rel="shortcut icon" href="images/halomed2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f4f4f9;
      color: #333;
      margin: 0;
      padding: 0;
    }

    .header-container {
      position: relative;
      width: 100%;
      max-height: 400px;
      overflow: hidden;
    }

    .header-container img {
      width: 100%;
      height: 400px;
      object-fit: cover;
      filter: brightness(0.7);
    }

    .header-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #fff;
      text-align: center;
    }

    .header-text h1 {
      font-size: 42px;
      margin: 0;
    }

    .header-text p {
      font-size: 18px;
      margin-top: 10px;
    }

    .services-container {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
      justify-content: center;
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 15px;
    }
    
   /* .services-container:hover {
     background-color: #e0f7fa;
     transition: background-color 0.3s ease;
    } */
    

    .service-card {
      background: #ffffff;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
      width: 280px;
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
      border: 3px solid #8dd9cc;
    }

   
    
	    .service-card:hover {
	  background-color: #f0f9ff; 
	  transform: translateY(-10px);
	  box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
	  transition: background-color 0.3s, transform 0.3s;
    }

     .service-card {
        transition: transform 0.3s;
     }

     .service-card:hover {
       transform: translateY(-10px) rotate(0.5deg);
     }
     
    

    .service-card img.icon-image {
      width: 80px;
      height: 80px;
      margin-bottom: 15px;
    }

    .service-card h3 {
      font-size: 22px;
      font-weight: bold;
      color: #2b547e;
    }

    .service-card p {
      font-size: 14px;
      color: #666;
      margin-bottom: 10px;
      margin-top: 5px;
    }

    .service-card .price {
      font-weight: bold;
      font-size: 18px;
      color: #2b547e;
      margin-bottom: 15px;
    }

   /* .service-card button {
      padding: 12px 20px;
      background: #2b547e;
      color: #fff;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .service-card button:hover {
      background: #1e88e5;
    } */
    .service-card button {
	  padding: 12px 20px;
	  background: #2b547e;
	  color: #fff;
	  border: none;
	  border-radius: 8px;
	  cursor: pointer;
	  transition: background 0.3s, transform 0.3s;
	}
	
	.service-card button:hover {
	  background: #1e88e5;
	  transform: scale(1.05);
	}
	
	
	.why-choose-section {
  position: relative;
  width: 100%;
  height: 300px;
  margin-top: 40px;
  overflow: hidden;
}

.why-choose-section img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  filter: brightness(0.6); 
}

.why-choose-section .overlay {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: #fff;
  padding: 20px;
  background: rgba(0, 0, 0, 0.5); 
  border-radius: 10px;
  max-width: 80%;
}

.why-choose-section h2 {
  font-size: 32px;
  margin-bottom: 15px;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.why-choose-section p {
  font-size: 18px;
  margin: 5px 0;
  font-weight: 500;
  line-height: 1.5;
}
	
	
/* Initial Hidden State */
.why-choose-section {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 1s ease, transform 1s ease;
}

/* Visible State - Triggered by JavaScript */
.why-choose-section.visible {
  opacity: 1;
  transform: translateY(0);
}

    
    
  </style>
</head>
<body>
<%@ include file="header.jsp" %>

<!-- Header Section with Image -->
<div class="header-container">
  <img src="images/Lab2.jpeg" alt="Laboratory Services">
  <div class="header-text">
    <h1>Laboratory Services</h1>
    <p>Explore our wide range of lab tests and book your appointment easily.</p>
  </div>
</div>

<!-- Lab Tests Section -->
<div class="services-container">
  <c:forEach var="labTest" items="${labTests}">
    <div class="service-card">
      <img src="images/icon-removebg-preview.png" alt="Lab Test Icon" class="icon-image">
      <h3>${labTest.testName}</h3>
      <p>${labTest.description}</p>
      <div class="price">LKR ${labTest.price}</div>
      <form action="LabTestBookingServlet" method="post">
        <input type="hidden" name="testId" value="${labTest.testId}">
        <button type="submit">Book Now</button>
      </form>
    </div>
  </c:forEach>
</div>

<!-- Why Choose Our Laboratory Services Section -->
<div class="why-choose-section">
  <img src="images/Lab4.jpg" alt="Laboratory Services Background">
  <div class="overlay">
    <h2>Why Choose Our Laboratory Services?</h2>
    <p>✔ Accurate and Reliable Test Results</p>
    <p>✔ Fast and Efficient Services</p>
    <p>✔ Certified and Experienced Professionals</p>
    <p>✔ Advanced Testing Technology</p>
  </div>
</div>


<script>
  document.addEventListener("DOMContentLoaded", function() {
    const whyChooseSection = document.querySelector('.why-choose-section');

    window.addEventListener('scroll', function() {
      const sectionTop = whyChooseSection.getBoundingClientRect().top;
      const windowHeight = window.innerHeight;
      
      if (sectionTop < windowHeight - 100) {
        whyChooseSection.classList.add('visible');
      }
    });
  });
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
