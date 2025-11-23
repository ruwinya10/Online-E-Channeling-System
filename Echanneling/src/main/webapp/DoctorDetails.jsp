<!-- This displays added doctor and availability details for admins to view and perform update/delete -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Doctor & Availability Details</title>
    <!-- Bootstrap CSS -->
    <link rel="shortcut icon" href="images/halomed2.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/DoctorDetails.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="src/images/logo7.png">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" 
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" 
          crossorigin="anonymous" 
          referrerpolicy="no-referrer" />    
          
     <style type="text/css">
     	.sidebar {
            width: 100px;
            background-color: #2c3e50;
            color: white;
            transition: width 0.3s;
            overflow: hidden;
            position: fixed;
            height: 100vh;
            top: 0;
        }

        .sidebar:hover {
            width: 250px;
        }

        .sidebar img {
            display: block;
            margin: 20px auto;
            width: 100px;
            height: auto;
        }

        .menu {
            list-style: none;
            padding: 0;
        }

        .menu li {
            padding: 10px;
        }

        .menu li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .menu i {
            margin-right: 10px;
            width: 20px;
        }

        .menu span {
            display: none;
            transition: opacity 0.3s ease;
        }

        .sidebar:hover .menu span {
            display: inline;
            opacity: 1;
        }

        .main {
            margin-left: 100px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .sidebar:hover ~ .main {
            margin-left: 250px;
        }

        .header {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
             width: 101%;
        }

        .dashboard-section {
            background-color: #fff;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            width: 101%;
        }

        .dashboard-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
     	
     </style>
</head>
<body>

	<!-- Admin's Sidebar Navigation -->
<div class="sidebar">
    <img src="images/logo1.png" alt="Admin">
    <ul class="menu">
        <li><a href="adminDashboard.jsp"><i class="fa fa-tachometer-alt"></i><span>Admin Dashboard</span></a></li>
        <li><a href="patientManagement.jsp"><i class="fa fa-users"></i><span>Patient Management</span></a></li>
        <li class="active"><a href="GetDoctorServlet"><i class="fa fa-user-md"></i><span>Doctor Management</span></a></li>
        <li><a href="admin_dashboard.jsp"><i class="fa fa-vial"></i><span>Lab Test Management</span></a></li>
        <li><a href="LogoutServlet" onclick="return confirm('Are you sure you want to Logout?');"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
    </ul>
</div>

<div class="main">
    <div class="header">
        <div class="title">
            <span>Welcome</span>
         	<h4><strong>System Admin</strong></h4>
        </div>
    </div>

    
   <!-- End of Admin's Sidebar Navigation --> 
     
    <div class="container my-5">
    
        <h1 class="text-center mb-4"><b>Doctor and Availability Details</b></h1>
        
        <!-- Navigation Links -->
	        <div class="mb-3">
	            <a href="GetDoctorServlet?view=profiles" class="btn btn-primary" style="background-color: #2c3e50; border-color: #2c3e50;">View Doctors Page on Website</a>
	            <a href="AddDoctor.jsp" class="btn btn-secondary" style="background-color: #2c3e50; border-color: #2c3e50;">Add New Doctor</a>
	        </div>
	        
			<table class="table table-bordered">
    			<tbody>
    				<!-- Looping through all doctors -->
  					<c:forEach var="dctr" items="${alldctrs}">
    					<table class="table table-bordered mb-5 doctor-table">
        					<thead class="table-light">
            					<tr>
					                <th>Doctor ID</th>
					                <th>Full Name</th>
					                <th>Title</th>
					                <th>Specialization</th>
					                <th>Qualifications</th>
					                <th>Experience</th>
					                <th>Gender</th>
					                <th>Contact</th>
					                <th>Email</th>
					                <th>Profile Photo</th>
					                <th>Action</th>
					            </tr>
        					</thead>
        					
        		<!-- Doctor Info Row -->			
        		<tbody>
            		<tr>
		                <td>${dctr.doctor_id}</td>
		                <td>${dctr.full_name}</td>
		                <td>${dctr.title}</td>
		                <td>${dctr.specialization}</td>
		                <td>${dctr.qualifications}</td>
		                <td>${dctr.experience}</td>
		                <td>${dctr.gender}</td>
		                <td>${dctr.contact}</td>
		                <td>${dctr.email}</td>
		                
		                <!-- Doctor Photo (if exists) -->
						<td>
						    <c:choose>
						        <c:when test="${not empty dctr.profile_photo}">
						            <img src="${dctr.profile_photo}" 
						                 alt="${dctr.full_name}" 
						                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%; border: 2px solid #dee2e6;"
						                 onerror="this.src='images/doctor25.jpg';">
						        </c:when>
						        <c:otherwise>
						            <img src="images/doctor25.jpg" 
						                 alt="Default Doctor Image" 
						                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%; border: 2px solid #dee2e6;">
						        </c:otherwise>
						    </c:choose>
						</td>
						
						<!-- Update/Delete Doctor -->
                		<td>
                   			<div class="d-flex gap-1">
	                        	<a href="update.jsp?doctor_id=${dctr.doctor_id}&full_name=${dctr.full_name}&title=${dctr.title}&specialization=${dctr.specialization}&qualifications=${dctr.qualifications}&experience=${dctr.experience}&gender=${dctr.gender}&contact=${dctr.contact}&email=${dctr.email}&profile_photo=${dctr.profile_photo}" class="btn btn-sm btn-warning" style="background-color: #2c3e50; border-color: #2c3e50; color:white;">Update</a>
	                        	
	                        	<!-- Delete Doctor -->
	                        	<form action="DeleteDoctorServlet" method="post">
	                            	<input type="hidden" name="doctor_id" value="${dctr.doctor_id}">
	                            	<button type="submit" class="btn btn-sm btn-danger" style="background-color: #2c3e50; border-color: #2c3e50;">Delete</button>
	                        	</form>
                    		</div>
                		</td>
           		 </tr>
           		 
           		 
           		 <!-- Doctor's Availabilities -->
            	<tr>
                	<td colspan="11">
                    	<strong>Availabilities for Doctor ID: ${dctr.doctor_id}</strong>
                    		<c:choose>
                    		
								<%-- If availabilities exist --%>
                        		<c:when test="${not empty doctorAvailabilities[dctr.doctor_id]}">
                            		<table class="table table-bordered availability-table mt-3">
                                		<thead class="table-secondary">
                                    		<tr>
		                                        <th>Availability ID</th>
		                                        <th>Hospital Name</th>
		                                        <th>Location</th>
		                                        <th>Day</th>
		                                        <th>Time</th>
		                                        <th>Max Patients</th>
		                                        <th>Fee</th>
		                                        <th>Action</th>
		                                    </tr>
                                		</thead>
                                	<tbody>
                                	
                                	<!-- Loop through all availabilities for this doctor -->
                                    <c:forEach var="avail" items="${doctorAvailabilities[dctr.doctor_id]}">
                                        <tr>
                                            <td>${avail.availability_id}</td>
                                            <td>${avail.hospital_name}</td>
                                            <td>${avail.location}</td>
                                            <td>${avail.day}</td>
                                            <td>${avail.time}</td>
                                            <td>${avail.max_patients}</td>
                                            <td>${avail.fee}</td>
                                            <td>
	                                            <div class="d-flex gap-1">
	                                            
	                                            	 <!-- Update Availability -->
	                                                 <a href="updateAvailability.jsp?availability_id=${avail.availability_id}&hospital_name=${avail.hospital_name}&location=${avail.location}&day=${avail.day}&time=${avail.time}&max_patients=${avail.max_patients}&fee=${avail.fee}" class="btn btn-sm btn-warning" style="background-color: #2c3e50; border-color: #2c3e50; color:white;">Update</a>
	                                                 
	                                                 <!-- Delete Availability -->
	                                                 <form action="DeleteAvailabilityServlet" method="post">
	                                                    <input type="hidden" name="availability_id" value="${avail.availability_id}">
	                                                    <button type="submit" class="btn btn-sm btn-danger" style="background-color: #2c3e50; border-color: #2c3e50;">Delete</button>
	                                                 </form>
	                                            </div>
                                            </td>
                                        </tr>
                                   </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        
                        <%-- If no availability exists --%>
                        <c:otherwise>
                            <p class="mt-2 text-muted">No availabilities available for this doctor.</p>
                        </c:otherwise>
                    	</c:choose>
                		</td>
            		</tr>
        		</tbody>
    		</table>
		</c:forEach>

    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>