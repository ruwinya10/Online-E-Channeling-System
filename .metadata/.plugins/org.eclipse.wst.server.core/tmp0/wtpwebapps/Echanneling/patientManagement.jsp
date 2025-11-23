<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.echannelling.model.User, com.echannelling.service.UserDAO"%>

<%
// Get the logged-in user object from the session
    User admin = (User) session.getAttribute("user");

//Redirect to login if no user is logged in or if the logged-in user is not an admin
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

 // Get admin's first and last name from session attributes
    String adminFirstName = (String) session.getAttribute("adminFirstName");
    String adminLastName = (String) session.getAttribute("adminLastName");

 // Redirect to login if name details are missing
    if (adminFirstName == null || adminLastName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();  // Create a DAO object to fetch patients from the database
    List<User> patients = dao.getAllPatients();  // Retrieve all patient users from the database
    String contextPath = request.getContextPath();   // Store the context path to use in relative URLs
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Patient Management</title>
<link rel="stylesheet" href="<%= contextPath %>/css/dashboard.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="<%= contextPath %>/images/halomed2.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	crossorigin="anonymous" />
<style>
body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background-color: #f4f6f9;
}

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
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
	width: 101%;
}

.dashboard-section {
	background-color: #fff;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
	width: 101%;
}

.dashboard-section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
}

th, td {
	padding: 12px 15px;
	text-align: left;
}

th {
	background-color: #2c3e50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e2e6ea;
}

button {
	background-color: #28a745;
	border: none;
	color: white;
	padding: 8px 12px;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #218838;
}

.actions a {
	display: inline-block;
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
	font-weight: 600;
}

.actions a:hover {
	background-color: #0056b3;
}

.title span {
	font-size: 16px;
	color: #666;
}

.title h2 {
	margin: 0;
	color: #333;
}

/* Style for profile images in table */
.profile-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<div class="sidebar">
		<img src="<%= contextPath %>/images/logo1.png" alt="Admin">
		<ul class="menu">
			<li><a href="adminDashboard.jsp"><i
					class="fa fa-tachometer-alt"></i><span>Admin Dashboard</span></a></li>
			<li class="active"><a href="patientManagement.jsp"><i
					class="fa fa-users"></i><span>Patient Management</span></a></li>
			<li><a href="GetDoctorServlet"><i class="fa fa-user-md"></i><span>Doctor
						Management</span></a></li>
			<li><a href="admin_dashboard.jsp"><i class="fa fa-vial"></i><span>Lab
						Test Management</span></a></li>
			<li><a href="LogoutServlet"
				onclick="return confirm('Are you sure you want to Logout?');"><i
					class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
		</ul>
	</div>

	<div class="main">
		<div class="header">
			<div class="title">
				<span>Welcome</span>
				<h2><%= adminFirstName %>
					<%= adminLastName %></h2>
			</div>
		</div>

		<div class="dashboard-section">
			<div class="dashboard-section-header">
				<h2>Patient Management</h2>
				<div class="actions">
					<a href="createPatient.jsp">+ Add New Patient</a>
				</div>
			</div>

			<table>
				<tr>
					<th>ID</th>
					<th>Profile Image</th>
					<th>Title</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>NIC</th>
					<th>Address</th>
					<th>Registered Date</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<%
            for (User patient : patients) {
            %>
				<tr>
					<td><%= patient.getId() %></td>
					<td><img class="profile-image"
						src="<%= patient.getProfileImage() != null && !patient.getProfileImage().isEmpty() ? contextPath + "/" + patient.getProfileImage() : contextPath + "/images/profile1.jpg" %>"
						alt="Profile Image"
						onerror="this.src='<%= contextPath %>/images/profile1.jpg';">
					</td>
					<td><%= patient.getTitle() %></td>
					<td><%= patient.getFirstName() %> <%= patient.getLastName() %></td>
					<td><%= patient.getEmail() %></td>
					<td><%= patient.getPhone() %></td>
					<td><%= patient.getNic() %></td>
					<td><%= patient.getAddress() != null ? patient.getAddress() : "" %></td>
					<td><%= patient.getRegisteredDate() != null ? patient.getRegisteredDate() : "N/A" %></td>
					<td>
						<form action="editPatient.jsp" method="get">
							<input type="hidden" name="id" value="<%= patient.getId() %>">
							<button type="submit">Update</button>
						</form>
					</td>
					<td>
						<form action="DeletePatientServlet" method="post">
							<input type="hidden" name="id" value="<%= patient.getId() %>">
							<button type="submit"
								onclick="return confirm('Are you sure you want to delete this patient?')"
								style="background-color: #dc3545;">Delete</button>
						</form>
					</td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>

</body>
</html>