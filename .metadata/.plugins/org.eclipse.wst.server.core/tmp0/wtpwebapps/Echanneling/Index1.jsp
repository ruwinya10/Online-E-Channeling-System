<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HaloMed | Checkout</title>
<link rel="shortcut icon" href="images/halomed2.png">

<link rel="stylesheet" href="css/Index.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
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

<!-- Debug output to check incoming parameters -->
<!--  <p>Debug: doctorName=<%= request.getParameter("doctorName") != null ? request.getParameter("doctorName") : (request.getAttribute("doctorName") != null ? request.getAttribute("doctorName") : "null") %>, 
    specialization=<%= request.getParameter("specialization") != null ? request.getParameter("specialization") : (request.getAttribute("specialization") != null ? request.getAttribute("specialization") : "null") %>, 
    hospital=<%= request.getParameter("hospital") != null ? request.getParameter("hospital") : (request.getAttribute("hospital") != null ? request.getAttribute("hospital") : "null") %>, 
    date=<%= request.getParameter("date") != null ? request.getParameter("date") : (request.getAttribute("date") != null ? request.getAttribute("date") : "null") %>, 
    time=<%= request.getParameter("time") != null ? request.getParameter("time") : (request.getAttribute("time") != null ? request.getAttribute("time") : "null") %></p>-->

<div class="container">
    <div class="row">

        <!-- Patient Info -->
        <div class="col">
            <div class="container1">
                <% if (request.getAttribute("name") != null) { %>
                    <h3>Patient Information</h3><br>
                    <p>Name: <%= request.getAttribute("name") %></p><br>
                    <p>Age: <%= request.getAttribute("age") %></p><br>
                    <p>Gender: <%= request.getAttribute("gender") %></p><br>
                    <p>Email: <%= request.getAttribute("email") %></p><br>
                    <p>Phone: <%= request.getAttribute("phone") %></p><br>
                    <a href="AppointmentDetails.jsp?appointmentID=<%= request.getAttribute("appointmentID") %>&name=<%= request.getAttribute("name") %>&age=<%= request.getAttribute("age") %>&gender=<%= request.getAttribute("gender") %>&email=<%= request.getAttribute("email") %>&phone=<%= request.getAttribute("phone") %>&doctorName=<%= request.getParameter("doctorName") != null ? java.net.URLEncoder.encode(request.getParameter("doctorName"), "UTF-8") : (request.getAttribute("doctorName") != null ? java.net.URLEncoder.encode((String) request.getAttribute("doctorName"), "UTF-8") : "") %>&specialization=<%= request.getParameter("specialization") != null ? java.net.URLEncoder.encode(request.getParameter("specialization"), "UTF-8") : (request.getAttribute("specialization") != null ? java.net.URLEncoder.encode((String) request.getAttribute("specialization"), "UTF-8") : "") %>&hospital=<%= request.getParameter("hospital") != null ? java.net.URLEncoder.encode(request.getParameter("hospital"), "UTF-8") : (request.getAttribute("hospital") != null ? java.net.URLEncoder.encode((String) request.getAttribute("hospital"), "UTF-8") : "") %>&date=<%= request.getParameter("date") != null ? java.net.URLEncoder.encode(request.getParameter("date"), "UTF-8") : (request.getAttribute("date") != null ? java.net.URLEncoder.encode((String) request.getAttribute("date"), "UTF-8") : "") %>&time=<%= request.getParameter("time") != null ? java.net.URLEncoder.encode(request.getParameter("time"), "UTF-8") : (request.getAttribute("time") != null ? java.net.URLEncoder.encode((String) request.getAttribute("time"), "UTF-8") : "") %>&methodID=<%= request.getAttribute("methodID") != null ? request.getAttribute("methodID") : "" %>"><button class="submit_btn">Edit Patient Details</button></a>
                <% } else { %>
                    <h3>No Patient Details</h3><br>
                    <a href="AppointmentDetails.jsp?doctorName=<%= request.getParameter("doctorName") != null ? java.net.URLEncoder.encode(request.getParameter("doctorName"), "UTF-8") : (request.getAttribute("doctorName") != null ? java.net.URLEncoder.encode((String) request.getAttribute("doctorName"), "UTF-8") : "") %>&specialization=<%= request.getParameter("specialization") != null ? java.net.URLEncoder.encode(request.getParameter("specialization"), "UTF-8") : (request.getAttribute("specialization") != null ? java.net.URLEncoder.encode((String) request.getAttribute("specialization"), "UTF-8") : "") %>&hospital=<%= request.getParameter("hospital") != null ? java.net.URLEncoder.encode(request.getParameter("hospital"), "UTF-8") : (request.getAttribute("hospital") != null ? java.net.URLEncoder.encode((String) request.getAttribute("hospital"), "UTF-8") : "") %>&date=<%= request.getParameter("date") != null ? java.net.URLEncoder.encode(request.getParameter("date"), "UTF-8") : (request.getAttribute("date") != null ? java.net.URLEncoder.encode((String) request.getAttribute("date"), "UTF-8") : "") %>&time=<%= request.getParameter("time") != null ? java.net.URLEncoder.encode(request.getParameter("time"), "UTF-8") : (request.getAttribute("time") != null ? java.net.URLEncoder.encode((String) request.getAttribute("time"), "UTF-8") : "") %>"><button class="submit_btn">Add Patient Details</button></a>
                <% } %>
            </div>
        </div>

        <!-- Payment Info -->
        <div class="col">
            <div class="container1">
                <% if (request.getAttribute("cardHolder") != null) { %>
                    <h3>Payment Information</h3><br>
                    <p>Card Holder: <%= request.getAttribute("cardHolder") %></p><br>
                    <p>Card Number: <%= request.getAttribute("cardNo") %></p><br>
                    <p>Expiry Month: <%= request.getAttribute("expMonth") %></p><br>
                    <p>CVV: <%= request.getAttribute("cvv") %></p><br>
                    <a href="AppointmentPaymentDetails.jsp?methodID=<%= request.getAttribute("methodID") %>&cardHolder=<%= request.getAttribute("cardHolder") %>&cardNo=<%= request.getAttribute("cardNo") %>&expMonth=<%= request.getAttribute("expMonth") %>&cvv=<%= request.getAttribute("cvv") %>&doctorName=<%= request.getParameter("doctorName") != null ? java.net.URLEncoder.encode(request.getParameter("doctorName"), "UTF-8") : (request.getAttribute("doctorName") != null ? java.net.URLEncoder.encode((String) request.getAttribute("doctorName"), "UTF-8") : "") %>&specialization=<%= request.getParameter("specialization") != null ? java.net.URLEncoder.encode(request.getParameter("specialization"), "UTF-8") : (request.getAttribute("specialization") != null ? java.net.URLEncoder.encode((String) request.getAttribute("specialization"), "UTF-8") : "") %>&hospital=<%= request.getParameter("hospital") != null ? java.net.URLEncoder.encode(request.getParameter("hospital"), "UTF-8") : (request.getAttribute("hospital") != null ? java.net.URLEncoder.encode((String) request.getAttribute("hospital"), "UTF-8") : "") %>&date=<%= request.getParameter("date") != null ? java.net.URLEncoder.encode(request.getParameter("date"), "UTF-8") : (request.getAttribute("date") != null ? java.net.URLEncoder.encode((String) request.getAttribute("date"), "UTF-8") : "") %>&time=<%= request.getParameter("time") != null ? java.net.URLEncoder.encode(request.getParameter("time"), "UTF-8") : (request.getAttribute("time") != null ? java.net.URLEncoder.encode((String) request.getAttribute("time"), "UTF-8") : "") %>&appointmentID=<%= request.getAttribute("appointmentID") %>"><button class="submit_btn">Edit Payment Details</button></a>
                <% } else { %>
                    <h3>No Payment Details</h3><br>
                    <a href="AppointmentPaymentDetails.jsp?doctorName=<%= request.getParameter("doctorName") != null ? java.net.URLEncoder.encode(request.getParameter("doctorName"), "UTF-8") : (request.getAttribute("doctorName") != null ? java.net.URLEncoder.encode((String) request.getAttribute("doctorName"), "UTF-8") : "") %>&specialization=<%= request.getParameter("specialization") != null ? java.net.URLEncoder.encode(request.getParameter("specialization"), "UTF-8") : (request.getAttribute("specialization") != null ? java.net.URLEncoder.encode((String) request.getAttribute("specialization"), "UTF-8") : "") %>&hospital=<%= request.getParameter("hospital") != null ? java.net.URLEncoder.encode(request.getParameter("hospital"), "UTF-8") : (request.getAttribute("hospital") != null ? java.net.URLEncoder.encode((String) request.getAttribute("hospital"), "UTF-8") : "") %>&date=<%= request.getParameter("date") != null ? java.net.URLEncoder.encode(request.getParameter("date"), "UTF-8") : (request.getAttribute("date") != null ? java.net.URLEncoder.encode((String) request.getAttribute("date"), "UTF-8") : "") %>&time=<%= request.getParameter("time") != null ? java.net.URLEncoder.encode(request.getParameter("time"), "UTF-8") : (request.getAttribute("time") != null ? java.net.URLEncoder.encode((String) request.getAttribute("time"), "UTF-8") : "") %>&appointmentID=<%= request.getAttribute("appointmentID") %>"><button class="submit_btn">Add Payment Details</button></a>
                <% } %>
            </div>
        </div>
		
        <div class="col">
            <div class="container1">
                <% if (request.getAttribute("name") != null && request.getAttribute("cardHolder") != null) { %>
                    <br>
                    <form action="ConfirmAppointmentServlet" method="post">
                        <input type="hidden" name="appointmentID" value="<%= request.getAttribute("appointmentID") != null ? request.getAttribute("appointmentID") : "" %>">
                        <input type="hidden" name="methodID" value="<%= request.getSession().getAttribute("currentMethodID") != null ? request.getSession().getAttribute("currentMethodID") : (request.getAttribute("methodID") != null ? request.getAttribute("methodID") : "") %>">
                        <input type="hidden" name="doctorName" value="<%= request.getParameter("doctorName") != null ? request.getParameter("doctorName") : (request.getAttribute("doctorName") != null ? request.getAttribute("doctorName") : "") %>">
                        <input type="hidden" name="specialization" value="<%= request.getParameter("specialization") != null ? request.getParameter("specialization") : (request.getAttribute("specialization") != null ? request.getAttribute("specialization") : "") %>">
                        <input type="hidden" name="hospital" value="<%= request.getParameter("hospital") != null ? request.getParameter("hospital") : (request.getAttribute("hospital") != null ? request.getAttribute("hospital") : "") %>">
                        <input type="hidden" name="date" value="<%= request.getParameter("date") != null ? request.getParameter("date") : (request.getAttribute("date") != null ? request.getAttribute("date") : "") %>">
                        <input type="hidden" name="time" value="<%= request.getParameter("time") != null ? request.getParameter("time") : (request.getAttribute("time") != null ? request.getAttribute("time") : "") %>">
                        <input type="hidden" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>">
                        <input type="hidden" name="age" value="<%= request.getAttribute("age") != null ? request.getAttribute("age") : "" %>">
                        <input type="hidden" name="gender" value="<%= request.getAttribute("gender") != null ? request.getAttribute("gender") : "" %>">
                        <input type="hidden" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                        <input type="hidden" name="phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>">
                        <input type="hidden" name="cardHolder" value="<%= request.getAttribute("cardHolder") != null ? request.getAttribute("cardHolder") : "" %>">
                        <input type="hidden" name="cardNo" value="<%= request.getAttribute("cardNo") != null ? request.getAttribute("cardNo") : "" %>">
                        <input type="hidden" name="expMonth" value="<%= request.getAttribute("expMonth") != null ? request.getAttribute("expMonth") : "" %>">
                        <input type="hidden" name="cvv" value="<%= request.getAttribute("cvv") != null ? request.getAttribute("cvv") : "" %>">
                        <button type="submit" class="confirm_btn">Confirm Appointment Booking</button>
                    </form>
                <% } %>
            </div>
        </div>
    </div>
</div>
</div>
<script src="js/checkout.js"></script>
<%@ include file="footer.jsp" %>
</body>
</html>