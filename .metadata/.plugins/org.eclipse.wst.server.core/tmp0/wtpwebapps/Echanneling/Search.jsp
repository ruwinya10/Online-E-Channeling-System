<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Set character encoding to UTF-8 for proper text rendering -->
    <meta charset="UTF-8">
    <title>Halomed | Search Doctors</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <!-- Link to CSS files for styling -->
    <link rel="stylesheet" href="css/Search.css">
    
    <!-- Import Poppins font from Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
    
    <!-- JavaScript function to handle AJAX requests when dropdowns change -->
    <script type="text/javascript">
        function loadDoctors() {
            // Get values from dropdowns and date input
            var doctorname = document.getElementById("doctorname").value;
            var specialization = document.getElementById("specialization").value;
            var hospital = document.getElementById("hospital").value;
            var date = document.getElementById("date").value;
            
            // Only send AJAX request if at least one field is selected
            if (doctorname || specialization || hospital || date) {
                var xhr = new XMLHttpRequest();
                // Send GET request to SearchDoctorsServlet with encoded parameters
                xhr.open("GET", "SearchDoctorsServlet?doctorname=" + encodeURIComponent(doctorname) + 
                        "&specialization=" + encodeURIComponent(specialization) + 
                        "&hospital=" + encodeURIComponent(hospital) + 
                        "&date=" + encodeURIComponent(date), true);
                xhr.onreadystatechange = function() {
                    // Update the doctorList div with the response when ready
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.getElementById("doctorList").innerHTML = xhr.responseText;
                    }
                };
                xhr.send();
            }
        }

        // JavaScript function to handle delete confirmation
        function confirmDelete(form) {
            if (confirm("Are you sure you want to delete the appointment?")) {
                form.submit(); // Submit the form if user clicks "Yes"
            }
            // If user clicks "Cancel", do nothing
        }
    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="relative min-h-screen bg-cover bg-center" style="background-image: url(images/newSearch.jpeg); background-repeat: no-repeat; background-size: cover; min-height: 100vh;">
    <% String status = (String) request.getAttribute("status"); %>
    <% if (status != null) { %>
        <script>
            setTimeout(function () {
                alert("<%= status %>");
            }, 1000);
        </script>
    <% } %>
	
    <div class="search-container">
        <form action="SearchDoctorsServlet" method="post">
            <label for="doctorname">Doctor Name:</label>
            <select id="doctorname" name="doctorname" onchange="loadDoctors()">
                <option value="">Select Doctor</option>
                <option value="M.Charith Wijesinghe">M.Charith Wijesinghe</option>
                <option value="W.Thusil Wanninayaka">W.Thusil Wanninayaka</option>
                <option value="J.Jagath Pathirana">J.Jagath Pathirana</option>
                <option value="N.Ashoka Subasinghe">N.Ashoka Subasinghe</option>
                <option value="R.Vimarsha Hemamali">R.Vimarsha Hemamali</option>
                <option value="P.Thusitha Gunawardena">P.Thusitha Gunawardena</option>
                <option value="K.Jayoda Sadagoda">K.Jayoda Sadagoda</option>
                <option value="C.Hasini Ishuwara">C.Hasini Ishuwara</option>
                <option value="A.Akmal Azam">A.Akmal Azam</option>
                <option value="Y.Yapa Jayasinghe">Y.Yapa Jayasinghe</option>
                <option value="K.Ashok Selvanagavan">K.Ashok Selvanagavan</option>
                <option value="P.Lewis Hamilton">P.Lewis Hamilton</option>
                <option value="L.Charles Leclerc">L.Charles Leclerc</option>
            </select>
            
            <label for="specialization">Specialization:</label>
            <select id="specialization" name="specialization" onchange="loadDoctors()">
                <option value="">Select Specialization</option>
                <option value="General Practitioner">General Practitioner</option>
                <option value="Cardiologist">Cardiologist</option>
                <option value="Dermatologist">Dermatologist</option>
                <option value="Neurologist">Neurologist</option>
                <option value="Psychiatrist">Psychiatrist</option>
                <option value="Dentist">Dentist</option>
                <option value="ENT Specialist">ENT Specialist</option>
            </select>

            <label for="hospital">Hospital:</label>
            <select id="hospital" name="hospital" onchange="loadDoctors()">
                <option value="">Select Hospital</option>
                <option value="City Hospital">City Hospital</option>
                <option value="Town Clinic">Town Clinic</option>
                <option value="Nawinna Hospital">Nawinna Hospital</option>
                <option value="CO-OP Hospital">CO-OP Hospital</option>
                <option value="SethSevana Hospital">SethSevana Hospital</option>
                <option value="Med Clinic">Med Clinic</option>
            </select>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" onchange="loadDoctors()" />
        </form>
    </div>

    <div id="doctorList">
        <% 
        List<Map<String, String>> doctors = (List<Map<String, String>>) request.getAttribute("doctors");
        //  out.println("Debug: Number of doctors = " + (doctors != null ? doctors.size() : "null") + "<br>");
        if (doctors != null && !doctors.isEmpty()) {
            for (Map<String, String> doctor : doctors) { 
        %>
                <div class="doctor-result">
                    <div class="doctor-info">
      
                        <div class="details">
                            <p><%= doctor.get("hospital") != null ? doctor.get("hospital") : "" %></p>
                            <p><%= doctor.get("specialization") != null ? doctor.get("specialization") : "" %></p>
                        </div>
                    </div>
                    <div class="time">
                        <p><%= doctor.get("time") != null ? doctor.get("time") : "" %></p>
                    </div>
                    <div class="patients">
                        <p>0 Patients</p>
                    </div>
                    <div class="fee">
                        <p>Rs 4,500.00 + Channelling Fee</p>
                    </div>
                    <a href="Index1.jsp?doctorName=<%= java.net.URLEncoder.encode(doctor.get("name") != null ? doctor.get("name") : "", "UTF-8") %>&specialization=<%= java.net.URLEncoder.encode(doctor.get("specialization") != null ? doctor.get("specialization") : "", "UTF-8") %>&hospital=<%= java.net.URLEncoder.encode(doctor.get("hospital") != null ? doctor.get("hospital") : "", "UTF-8") %>&date=<%= java.net.URLEncoder.encode(doctor.get("date") != null ? doctor.get("date") : "", "UTF-8") %>&time=<%= java.net.URLEncoder.encode(doctor.get("time") != null ? doctor.get("time") : "", "UTF-8") %>">
                        <button type="button" class="book-btn">Make Appointment</button>
                    </a>
                </div>
                <p style="text-align: center; font-weight: 600; color: #1976d2;"><%= doctor.get("date") != null ? doctor.get("date") : "" %></p>
        <% 
            }
        } else if (request.getAttribute("doctors") != null) {
        %>
        <div class="error-container">
            <p class="error">No doctors available for the selected criteria.</p>
         </div>
        <%
        } 
        %>
    </div>

    <div class="appointment-details">
        <h3>Appointment Summary</h3>
        <% 
        String doctorName = (String) request.getAttribute("doctorName");
        if (doctorName != null) { 
        %>
            <p><strong>Booking ID:</strong> <%= request.getAttribute("bookingID") %></p>
            <p><strong>Doctor Name:</strong> <%= request.getAttribute("doctorName") %></p>
            <p><strong>Specialization:</strong> <%= request.getAttribute("specialization") %></p>
            <p><strong>Hospital:</strong> <%= request.getAttribute("hospital") %></p>
            <p><strong>Date:</strong> <%= request.getAttribute("date") %></p>
            <p><strong>Time:</strong> <%= request.getAttribute("time") %></p>
            <p><strong>Patient Name:</strong> <%= request.getAttribute("name") != null ? request.getAttribute("name") : "N/A" %></p>
            <p><strong>Age:</strong> <%= request.getAttribute("age") != null ? request.getAttribute("age") : "N/A" %></p>
            <p><strong>Gender:</strong> <%= request.getAttribute("gender") != null ? request.getAttribute("gender") : "N/A" %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("email") != null ? request.getAttribute("email") : "N/A" %></p>
            <p><strong>Phone:</strong> <%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "N/A" %></p>
     
            <form id="deleteAppointmentForm" action="DeleteAppointmentServlet" method="post">
                <input type="hidden" name="bookingID" value="<%= request.getAttribute("bookingID") %>">
                <button type="button" class="delete-btn" onclick="confirmDelete(this.form)">Delete Appointment</button>
            </form>
        <% } else { %>
            <p>No appointment selected</p>
        <% } %>
    </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>