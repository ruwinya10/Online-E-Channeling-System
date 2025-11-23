<!-- This shows added doctor and availability details as seen in the echannelling website-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Our Doctors</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/DoctorProfiles.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container my-5">
    
    <h1 class="text-center mb-4">Our Doctors</h1>
    
    <!-- Search Form -->
    <form method="get" action="GetDoctorServlet" class="p-4 rounded" style="background-color: #005aa7;">
        <input type="hidden" name="view" value="profiles" />
        
        <div class="row g-3 align-items-end">
            
            <!-- Doctor Name -->
            <div class="col-md-2">
                <label class="form-label text-white">Doctor Name</label>
                <input type="text" name="name" class="form-control rounded" placeholder="Search Doctor Name" value="${param.name}" />
            </div>
    
            <!-- Specialization Filter with Datalist -->
            <div class="col-md-2">
                <label class="form-label text-white">Specialization</label>
                <input list="specializations" name="specialization" class="form-control rounded" placeholder="Choose or type" value="${param.specialization}" />
                <datalist id="specializations">
                    <option value="Physician">
                    <option value="Surgeon">
                    <option value="Psychologist">
                    <option value="Cardiologist">
                    <option value="Dermatologist">
                    <option value="Neurologist">
                    <option value="Pediatrician">
                    <option value="Hematologist">
                    <option value="Gastroenterologist">          
                </datalist>
            </div>
    
            <!-- Hospital Filter with Datalist -->
            <div class="col-md-2">
                <label class="form-label text-white">Hospital</label>
                <input list="hospitals" name="hospital" class="form-control rounded" placeholder="Choose or type" value="${param.hospital}" />
                <datalist id="hospitals">
                    <option value="Asiri">
                    <option value="Nawaloka">
                    <option value="Lanka Hospitals">
                    <option value="Hemas">
                    <option value="Durdans">
                    <option value="Seth Sevana Hospitals">
                    <option value="Cooperative Hospital">
                    <option value="Navinne">
                    <option value="Ninewells">
                    <option value="Kings Hospital">
                </datalist>
            </div>
    
            <!-- Appointment Date Filter -->
            <div class="col-md-3">
                <label class="form-label text-white">Date</label>
                <input type="date" name="date" class="form-control rounded" value="${param.date}" />
            </div>
    
            <!-- Search Button -->
            <div class="col-md-3">
                <label class="form-label text-white d-block invisible">Search</label>
                <button type="submit" class="btn btn-light w-100 rounded">Search</button>
            </div>
        </div>
    </form>

    <br><br>
    
    <!-- Show message if no doctors available -->
    <c:if test="${empty alldctrs}">
        <p class="text-center">No doctors available at this time.</p>
    </c:if>
    <div class="row g-3">
        
        <!-- Loop through all doctors and display each in a card -->
        <c:forEach var="dctr" items="${alldctrs}">
            <div class="col-lg-3 col-md-5 col-sm-12">
                <div class="card doctor-card">
                    <div class="card-body">
                       <!-- Doctor Image and Basic Info -->
						<c:choose>
						    <c:when test="${not empty dctr.profile_photo}">
						        <img src="${dctr.profile_photo}" 
						             alt="${dctr.full_name}" 
						             class="doctor-img"
						             onerror="this.src='images/doctor25.jpg';">
						    </c:when>
						    <c:otherwise>
						        <div class="doctor-img bg-secondary d-flex align-items-center justify-content-center">
						            <img src="images/doctor25.jpg" 
						                 alt="Default Doctor Image" 
						                 class="doctor-img">
						        </div>
						    </c:otherwise>
						</c:choose>
                        <h5 class="card-title">${dctr.title} ${dctr.full_name}</h5>
                        <p class="card-text text-muted">${dctr.specialization}</p>
                        <!-- Availability Button -->
                        <a href="viewAvailability.jsp?doctorId=${dctr.doctor_id}" class="availability-btn text-decoration-none d-inline-block text-center w-100">
                            View Availability
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="footer.jsp" %>
<!-- Bootstrap JS (optional, for any interactive components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>