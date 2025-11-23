<%@ page import="java.sql.*" %>
<%@ page import="com.echannelling.util.DBConnection" %>
<%@ page import="java.util.List, com.echannelling.model.User, com.echannelling.service.UserDAO"%>

<%
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    String adminFirstName = (String) session.getAttribute("adminFirstName");
    String adminLastName = (String) session.getAttribute("adminLastName");

    if (adminFirstName == null || adminLastName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> patients = dao.getAllPatients();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HaloMed | Lab Test Management</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/halomed2.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            padding: 20px;
        }

        .main {
            max-width: 1200px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
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

        .dashboard-section-header h2 {
            font-size: 36px;
            color: #333;
            font-weight: 700;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color:#2c3e50;
            color: white;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e2e6ea;
        }

        .btn {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .add-btn {
            background-color: #007bff;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            font-weight: 600;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .add-btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .main {
                padding: 15px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 10px;
            }

            .dashboard-section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .dashboard-section-header h2 {
                font-size: 24px;
            }
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
            transition: margin-left 0.3s;
        }

        .sidebar:hover ~ .main {
            margin-left: 250px;
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
        <li><a href="GetDoctorServlet"><i class="fa fa-user-md"></i><span>Doctor Management</span></a></li>
        <li class="active"><a href="admin_dashboard.jsp"><i class="fa fa-vial"></i><span>Lab Test Management</span></a></li>
        <li><a href="LogoutServlet" onclick="return confirm('Are you sure you want to Logout?');"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
    </ul>
</div>

<div class="main">
    <div class="header">
        <div class="title">
            <span>Welcome</span>
            <h2><%= adminFirstName %> <%= adminLastName %></h2>
        </div>
    </div>

    <div class="dashboard-section">
    <div class="dashboard-section-header">
        <h2>Lab Test Management</h2>
        <a href="add_lab_test.jsp" class="add-btn">+ Add New Lab Test</a>
    </div>

    <div class="content">
        <table>
            <tr>
                <th>Test ID</th>
                <th>Test Name</th>
                <th>Description</th>
                <th>Price (LKR)</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
                Connection con = DBConnection.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM lab_test");
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("test_id") %></td>
                <td><%= rs.getString("test_name") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getString("price") %></td>
                <td><a class="btn" href="edit_lab_test.jsp?test_id=<%= rs.getInt("test_id") %>">Edit</a></td>
                <td>
                    <a class="btn" href="DeleteLabTestServlet?test_id=<%= rs.getInt("test_id") %>" 
                       onclick="return confirm('Are you sure you want to delete this test?')" style="background-color: #dc3545;">Delete</a>
                </td>
            </tr>
            <%
                }
                con.close();
            %>
        </table>
    </div>
</div>
</div>
</body>
</html>
