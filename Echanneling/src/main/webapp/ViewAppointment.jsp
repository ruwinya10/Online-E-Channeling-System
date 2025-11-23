<%@ page import="java.sql.*, com.echannelling.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Lab Appointment & Payment Summary</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(135deg, #e0f7fa, #b3e5fc); 
            min-height: 100vh; /* Ensure body takes at least full viewport height */
            display: flex; 
            flex-direction: column; /* Stack children vertically */
        }

        /* Header Styling (Assuming header.jsp has a <header> tag) */
        header {
            width: 100%;
            background: #151b54; /* Dark blue to match theme */
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        /* Footer Styling (Assuming footer.jsp has a <footer> tag) */
        footer {
            width: 100%;
            background: #151b54; /* Dark blue to match theme */
            color: white;
            padding: 15px 20px;
            text-align: center;
            margin-top: auto; /* Pushes footer to the bottom */
        }

        /* Container Styling */
        .container {
            max-width: 800px;
            width: 100%;
            background: #ffffff;
            border-radius: 15px; 
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            margin: 20px auto; /* Center horizontally with vertical spacing */
            overflow: hidden;
        }

        /* Slider Styling */
        .slider {
            width: 100%;
            height: 250px;
            background: url('images/med3.jpg') center/cover no-repeat;
            animation: slide 15s infinite;
        }

        @keyframes slide {
            0%, 100% { background-image: url('images/med3.jpg'); }
            33% { background-image: url('images/med4.jpg'); }
            66% { background-image: url('images/med6.jpg'); }
        }

        /* Details Section Styling */
        .details-section {
            padding: 20px 30px;
        }

        h2 { 
            text-align: center; 
            margin-bottom: 20px; 
            color: #151b54; 
        }

        /* Table Styling */
        table { 
            width: 100%; 
            border-collapse: collapse; 
        }
        th, td { 
            padding: 12px; 
            text-align: left; 
            border-bottom: 1px solid #ddd; 
        }
        th { 
            background-color: #b5e2ff; 
            color: #151b54; /* Fixed typo 'balck' to black */
            width: 35%; 
        }

        /* No Details Styling */
        .no-details { 
            text-align: center; 
            font-size: 16px; 
            color: #d32f2f; 
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .container {
                margin: 15px; /* Reduce margin on smaller screens */
            }
            .details-section {
                padding: 15px 20px;
            }
            .slider {
                height: 200px; /* Adjust slider height for smaller screens */
            }
            header, footer {
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %>
<div class="container">
    <div class="slider"></div>

    <div class="details-section">
        <h2>Your Lab Appointment & Payment Summary</h2>
        <table>
            <tbody>
                <% String appointmentId = request.getParameter("appointmentId"); %>
                <% Connection conn = DBConnection.getConnection(); %>
                <% String query = "SELECT * FROM lab_appointments WHERE appointment_id = ?"; %>
                <% PreparedStatement ps = conn.prepareStatement(query); %>
                <% ps.setInt(1, Integer.parseInt(appointmentId)); %>
                <% ResultSet rs = ps.executeQuery(); %>
                <% if (rs.next()) { %>
                    <tr><th>Test Name</th><td><%= rs.getString("test_name") %></td></tr>
                    <tr><th>Patient Name</th><td><%= rs.getString("patient_name") %></td></tr>
                    <tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
                    <tr><th>Appointment Date</th><td><%= rs.getString("appointment_date") %></td></tr>
                    <tr><th>Appointment Time</th><td><%= rs.getString("appointment_time") %></td></tr>
                    <tr><th>Hospital</th><td><%= rs.getString("hospital") %></td></tr>
                    <tr><th>Payment Status</th><td><%= rs.getString("payment_status") %></td></tr>
                    <tr><th>Payment Date</th><td><%= rs.getString("payment_date") %></td></tr>
                    <tr><th>Payment Amount</th><td>LKR <%= rs.getDouble("payment_amount") %></td></tr>
                <% } else { %>
                    <tr><td colspan="2" class="no-details">❌ No details found for this appointment.</td></tr>
                <% } conn.close(); %>
            </tbody>
        </table>
    </div>
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>
