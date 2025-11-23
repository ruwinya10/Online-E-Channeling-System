<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//Retrieve admin's first and last name from the session
    String adminFirstName = (String) session.getAttribute("adminFirstName");
    String adminLastName = (String) session.getAttribute("adminLastName");

 // Redirect to login page if admin is not logged in
    if (adminFirstName == null || adminLastName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Admin Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/halomed2.png">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          crossorigin="anonymous" />
    <style>
        body {
            margin: 0;
            display: flex;
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fc;
        }

        .sidebar {
            width: 100px;
            background-color: #2c3e50;
            color: white;
            transition: width 0.3s;
            overflow: hidden;
            position: sticky;
            height: 100vh;
            top: 0;
        }

        .sidebar:hover {
            width: 250px;
        }

        .sidebar img {
            display: block;
            margin: 20px auto;
            border-radius: 10%;
            width: 100px;
        }

        .menu {
            list-style: none;
            padding: 0;
        }

        .menu li {
            padding: 15px;
            transition: 0.3s;
        }

        .menu a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .main {
            flex-grow: 1;
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
        }

        .header .title h2 {
            margin: 0;
            color: #2c3e50;
        }

        .overview {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            position: relative;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-8px);
        }

        .card h3 {
            margin-bottom: 10px;
            font-weight: 500;
        }

        .card p {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .dashboard-section h3 {
            font-size: 1.4rem;
            color: #34495e;
            margin-bottom: 15px;
        }

        .top-products {
            list-style: none;
            padding: 0;
        }

        .top-products li {
            background: white;
            margin-bottom: 10px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            font-size: 1rem;
        }
    </style>
</head>
<body>

<!-- Sidebar navigation -->
<div class="sidebar">
    <img src="images/logo1.png" alt="Admin">
    <ul class="menu">
        <li class="active"><a href="adminDashboard.jsp"><i class="fa fa-tachometer-alt"></i><span>Admin Dashboard</span></a></li>
        <li><a href="patientManagement.jsp"><i class="fa fa-users"></i><span>Patient Management</span></a></li>
        <li><a href="GetDoctorServlet"><i class="fa fa-user-md"></i><span>Doctor Management</span></a></li>
        <li><a href="admin_dashboard.jsp"><i class="fa fa-vial"></i><span>Lab Test Management</span></a></li>
        <li><a href="LogoutServlet" onclick="return confirm('Are you sure you want to Logout?');"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
    </ul>
</div>

<!-- Main dashboard content -->
<div class="main">
    <div class="header">
        <div class="title">
            <span>Welcome</span>
            <!-- Display admin name from session -->
            <h2><%= adminFirstName %> <%= adminLastName %></h2>
        </div>
    </div>

    <div class="dashboard-section overview">
        <div class="card">
            <h3>Total Registered Users</h3>
            <p>15,245</p>
        </div>
        <div class="card">
            <h3>Total Active Doctors</h3>
            <p>234</p>
        </div>
        <div class="card">
            <h3>Hospitals/Clinics</h3>
            <p>55</p>
        </div>
        <div class="card">
            <h3>Appointments</h3>
            <p>20,980</p>
        </div>
        <div class="card">
            <h3>Total Revenue</h3>
            <p>Rs. 1,500,790.00</p>
        </div>
    </div>

    <div class="dashboard-section">
        <h3>Today's Statistics</h3>
        <ul class="top-products">
            <li>🆕 New Users: 120 sign-ups</li>
            <li>✅ Confirmed Appointments: 98</li>
            <li>🏥 Busiest Hospital: Durdans, Colombo</li>
        </ul>
    </div>
</div>

</body>
</html>
