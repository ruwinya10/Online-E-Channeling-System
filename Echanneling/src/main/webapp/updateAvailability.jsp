<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Update Availability</title>
<link rel="shortcut icon" href="images/halomed2.png">
<link rel="stylesheet" type="text/css" href="css/updateAvailability.css">
</head>
<body>
    <h1>Update Availability</h1>
    <%
 		// Get values from request parameters
        String availability_id = request.getParameter("availability_id");
        String hospital_name = request.getParameter("hospital_name");
        String location = request.getParameter("location");
        String day = request.getParameter("day"); // Comes as "Mon", "Tue", etc.
        String time = request.getParameter("time");
        String max_patients = request.getParameter("max_patients");
        String fee = request.getParameter("fee");
        
        //formatted date
        String formattedTime = time != null ? time : "";
    %>
    
	<!-- Form to submit updated availability details -->
    <form action="UpdateAvailabilityServlet" method="post">
        <table>
            <tr>
                <td>Availability ID:</td>
                <td><input type="text" name="availability_id" value="<%=availability_id%>" readonly></td>
            </tr>
            <tr>
			    <td>Hospital Name:</td>
			    <td>
			        <input list="hospitalList" name="hospital_name" value="<%=hospital_name%>" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
			        <datalist id="hospitalList">
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
			    </td>
			</tr>

            <tr>
                <td>Location:</td>
                <td><input type="text" name="location" value="<%=location%>" required></td>
            </tr>
            <tr>
                <td>Day:</td>
                <td>
                    <select name="day" required>
                        <option value="Mon" <%= "Mon".equals(day) ? "selected" : "" %>>Monday</option>
                        <option value="Tue" <%= "Tue".equals(day) ? "selected" : "" %>>Tuesday</option>
                        <option value="Wed" <%= "Wed".equals(day) ? "selected" : "" %>>Wednesday</option>
                        <option value="Thu" <%= "Thu".equals(day) ? "selected" : "" %>>Thursday</option>
                        <option value="Fri" <%= "Fri".equals(day) ? "selected" : "" %>>Friday</option>
                        <option value="Sat" <%= "Sat".equals(day) ? "selected" : "" %>>Saturday</option>
                        <option value="Sun" <%= "Sun".equals(day) ? "selected" : "" %>>Sunday</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Time:</td>
                <td><input type="datetime-local" name="time" value="<%=formattedTime%>" step="1" required></td>
            </tr>
            <tr>
                <td>Max Patients:</td>
                <td><input type="number" name="max_patients" value="<%=max_patients%>" required></td>
            </tr>
            <tr>
                <td>Fee (Rs):</td>
                <td><input type="number" step="0.01" name="fee" value="<%=fee%>" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>