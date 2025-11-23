<!-- Form to update doctor details -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Update Doctor</title>
<link rel="shortcut icon" href="images/halomed2.png">
<link rel="stylesheet" type="text/css" href="css/update.css">
</head>
<body>
	<h1>Update Doctor Details</h1>
	
    <%
 		// Retrieve form data from the request parameters
        String doctor_id = request.getParameter("doctor_id");
        String full_name = request.getParameter("full_name");
        String title = request.getParameter("title");
        String specialization = request.getParameter("specialization");
        String qualifications = request.getParameter("qualifications");
        String experience = request.getParameter("experience");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
    %>

	<!-- Form to submit updated doctor details -->
    <form action="UpdateDoctorServlet" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" id="doctor_id" name="doctor_id" value="<%=doctor_id%>" readonly></td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><input type="text" id="full_name" name="full_name" value="<%=full_name%>" required></td>
            </tr>
            <tr>
                <td>Title:</td>
                <td>
                	<select id="title" name="title" required>
                        <option value="Dr" <%= "Dr".equals(title) ? "selected" : "" %>>Dr</option>
                        <option value="Prof" <%= "Prof".equals(title) ? "selected" : "" %>>Prof</option>
                        <option value="Consult" <%= "Consult".equals(title) ? "selected" : "" %>>Consult</option>
                    </select>
                </td>
            </tr>
            <tr>
			    <td>Specialization:</td>
			    <td>
			        <input list="specializations" id="specialization" name="specialization" value="<%=specialization%>" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
			        <datalist id="specializations">
			            <option value="Physician">
			            <option value="Surgeon">
			            <option value="Psychologist">
			            <option value="Cardiologist">
			            <option value="Dermatologist">
			            <option value="Neurologist">
			            <option value="Pediatrician">
			            <option value="Haematologist">
			            <option value="Gastroenterologist">
			        </datalist>
			    </td>
			</tr>
            <tr>
                <td>Qualifications:</td>
                <td><textarea id="qualifications" name="qualifications" rows="4" required><%=qualifications%></textarea> </td>
            </tr>
            <tr>
                <td>Experience (years):</td>
                <td><input type="number" id="experience" name="experience" value="<%=experience%>" required></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                	<select id="gender" name="gender" required>
                        <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                    </select>
				</td>
            </tr>
            <tr>
                <td>Contact:</td>
                <td><input type="text" id="contact" name="contact" value="<%=contact%>" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" id="email" name="email" value="<%=email%>" required></td>
            </tr>
            <tr>
                <td>Profile Photo:</td>
                <td><input type="file" name="profile_photo" accept="image/*"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
</body>
	<!-- JavaScript for form validation -->
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    document.querySelector("form").addEventListener("submit", function (event) {
	        const email = document.querySelector('input[name="email"]').value;
	        const contact = document.querySelector('input[name="contact"]').value;
	        
	     	// Regex patterns for email and contact validation
	        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
	        const phonePattern = /^0\d{9}$/;
	
	     	// Validate email format
	        if (!emailPattern.test(email)) {
	            alert("Please enter a valid email address.");
	            event.preventDefault();
	            return;
	        }
			
	     	// Validate contact number format
	        if (!phonePattern.test(contact)) {
	            alert("Please enter a valid 10-digit contact number.");
	            event.preventDefault();  // Stop form submission
	            return;
	        }
	
	        // Check that availability entries are filled correctly
	        const availabilities = document.querySelectorAll('.availabilityEntry');
	        for (let i = 0; i < availabilities.length; i++) {
	            const inputs = availabilities[i].querySelectorAll("input");
	            let filled = Array.from(inputs).some(input => input.value.trim() !== "");
	            let allFilled = Array.from(inputs).every(input => input.value.trim() !== "");
	            if (filled && !allFilled) {
	                alert("Please complete all fields in each availability entry or leave them all empty.");
	                event.preventDefault();
	                return;
	            }
	        }
	    });
	});
	</script>
</html>