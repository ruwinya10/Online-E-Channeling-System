<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.echannelling.model.AppointmentModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Patient Appointment Management</title>
    <link rel="stylesheet" href="css/AppointmentDetails.css">
	<link rel="shortcut icon" href="images/halomed2.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
    
    <!-- Include external JavaScript file -->
    <script src="js/patientValidation.js"></script>
</head>
<body>
 <%@ include file="header.jsp" %>

<div class="container">
    <!-- Debug: Show query parameters -->
 <!--     <c:if test="${not empty param.appointmentID}">
        <p>Debug: Edit mode - appointmentID=${param.appointmentID}, name=${param.name}, age=${param.age}, gender=${param.gender}, email=${param.email}, phone=${param.phone}</p>
    </c:if>
    <c:if test="${empty param.appointmentID}">
        <p>Debug: Insert mode - no query parameters</p>
    </c:if>-->

    <!-- Single form for insert or update -->
    <form action="${not empty param.appointmentID ? 'UpdateAppointmentServlet' : 'InsertAppointmentServlet'}" method="post" onsubmit="return patientValidateForm()">
        <!-- Hidden appointmentID for update mode -->
        <c:if test="${not empty param.appointmentID}">
            <input type="hidden" name="appointmentID" value="${param.appointmentID}">
        </c:if>
		<!-- Hidden fields for doctor details and methodID -->
        <input type="hidden" name="doctorName" value="${param.doctorName}">
        <input type="hidden" name="specialization" value="${param.specialization}">
        <input type="hidden" name="hospital" value="${param.hospital}">
        <input type="hidden" name="date" value="${param.date}">
        <input type="hidden" name="time" value="${param.time}">
        <input type="hidden" name="methodID" value="${param.methodID}">
        <div class="row">
            <div class="col">
                <h3 class="title">Patient Information</h3>
                <div class="inputBox">
                    <label for="name">Full Name:</label>
                    <input name="name" type="text" id="name" placeholder="Enter the patient's Full Name" 
                           value="${param.name}" required>
                           <div id="nameError" class="error-message"></div><br>
                </div>
                <div class="inputBox">
                    <label for="age">Age:</label>
                    <input name="age" type="text" id="age" placeholder="Enter the patient's age" 
                           value="${param.age}" required>
                           <div id="ageError" class="error-message"></div><br>
                </div>
                <div class="inputBox">
                    <label for="gender">Gender:</label>
                    <select name="gender" id="gender" required>
                        <option value="" ${empty param.gender ? 'selected' : ''}>Select Gender</option>
                        <option value="Male" ${param.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${param.gender == 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                    <div id="genderError" class="error-message"></div><br>
                </div>
                <br>
                <h3 class="title">Contact Information</h3>
                <div class="inputBox">
                    <label for="email">Email Address:</label>
                    <input name="email" type="email" id="email" placeholder="Enter your Email Address" 
                           value="${param.email}" required>
                           <div id="emailError" class="error-message"></div><br>
                </div>
                <div class="inputBox">
                    <label for="phone">Contact Number:</label>
                    <input name="phone" type="tel" id="phone" placeholder="123 456 7890" 
                           value="${param.phone}" required>
                           <div id="phoneError" class="error-message"></div><br>
                </div>
            </div>
        </div>
        <input name="submit" type="submit" 
               value="${not empty param.appointmentID ? 'Update Patient Details' : 'Save Patient Details'}" 
               class="submit_btn">
    </form>
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>