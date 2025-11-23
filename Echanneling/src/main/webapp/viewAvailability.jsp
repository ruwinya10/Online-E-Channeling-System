<!-- This shows doctors' availability details in a separate page when clicking Availability button in DoctorProfiles -->
<%@ page import="java.util.*, com.echannelling.model.Doctor, com.echannelling.model.Availability, 
                com.echannelling.service.DoctorDAO, com.echannelling.service.AvailabilityDAO" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// Get doctorId from request parameters
    String doctorIdParam = request.getParameter("doctorId");
    Doctor doctor = null;
    List<Availability> availabilityList = new ArrayList<>();
    
 	// Check if doctorId is provided and not empty
    if (doctorIdParam != null && !doctorIdParam.trim().isEmpty()) {
        try {
            int doctorId = Integer.parseInt(doctorIdParam);
            
        	 // Fetch doctor details from DAO using the ID
            List<Doctor> doctorList = DoctorDAO.getById(doctorIdParam);
            if (doctorList != null && !doctorList.isEmpty()) {
                doctor = doctorList.get(0);
            }
            
         	// Fetch availability for the doctor
            availabilityList = AvailabilityDAO.getByDoctorId(doctorIdParam);
         			
        } catch (NumberFormatException e) {
            // Handle invalid doctor ID format
            request.setAttribute("error", "Invalid doctor ID format");
        } catch (Exception e) {
            // Handle other exceptions
            request.setAttribute("error", "Error retrieving doctor information: " + e.getMessage());
        }
    } else {
    	// doctorId not provided
        request.setAttribute("error", "No doctor ID provided");
    }
    
 	// Set doctor and availability data as request attributes for use in JSP
    request.setAttribute("doctor", doctor);
    request.setAttribute("availabilityList", availabilityList);
%>
<!DOCTYPE html>
<html>
<head>
    <title>HaloMed | Doctor Availability</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/viewAvailability.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container my-5">
	<!-- Display error message if any -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty doctor}">
        <h2 class="mb-3">${doctor.title} ${doctor.full_name}</h2>
        <p class="text-muted mb-2">${doctor.specialization}</p>
        <p class="mb-2"><strong>Qualifications:</strong> ${doctor.qualifications}</p>
        <p class="mb-4"><strong>Experience:</strong> ${doctor.experience} years</p>
    </c:if>

	<!-- Show availability table if data exists -->
    <c:if test="${not empty availabilityList}">
        <table class="table table-bordered availability-table">
            <thead class="table-dark">
                <tr>
                    <th>Hospital</th>
                    <th>Location</th>
                    <th>Day</th>
                    <th>Time</th>
                    <th>Max Patients</th>
                    <th>Fee</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            	<!-- Loop through availability list -->
                <c:forEach var="avail" items="${availabilityList}">
                    <tr>
                        <td>${avail.hospital_name}</td>
                        <td>${avail.location}</td>
                        <td>${avail.day}</td>
                        <td>${avail.time}</td>
                        <td>${avail.max_patients}</td>
                        <td>LKR ${avail.fee}</td>
                        <td><a href="Search.jsp" class="btn btn-primary btn-sm">Book</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <!-- Show message if no availability and no error -->
    <c:if test="${empty availabilityList and empty error}">
        <p class="alert alert-info">No availability found for this doctor.</p>
    </c:if>

    <a href="GetDoctorServlet?view=profiles" class="btn btn-secondary mt-3">Back to Doctor Profiles</a>
</div>
<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>