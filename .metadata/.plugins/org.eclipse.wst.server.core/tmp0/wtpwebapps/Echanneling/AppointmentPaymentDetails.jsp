<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.echannelling.model.AppointmentPaymentModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Payment Details</title>
    <link rel="stylesheet" href="css/PaymentDetails.css">
 	<link rel="shortcut icon" href="images/halomed2.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
    
    <!-- Include external JavaScript file -->
    <script src="js/paymentValidation.js"></script>
</head>
<body>
 <%@ include file="header.jsp" %>
<div class="container">
    <!-- Debug: Show query parameters -->
 <!--     <c:if test="${not empty param.methodID}">
        <p>Debug: Edit mode - methodID=${param.methodID}, cardHolder=${param.cardHolder}, cardNo=${param.cardNo}, expMonth=${param.expMonth}, cvv=${param.cvv}</p>
    </c:if>
    <c:if test="${empty param.methodID}">
        <p>Debug: Insert mode - no query parameters</p>
    </c:if> -->

    <!-- Display status message if present -->
    <c:if test="${not empty param.status}">
        <script>
            setTimeout(function () {
                alert("${param.status}");
            }, 1000);
        </script>
    </c:if>

    <!-- Single form for insert or update -->
    <form action="${not empty param.methodID ? 'UpdateAppointmentPaymentServlet' : 'InsertAppointmentPaymentServlet'}" method="post" onsubmit="return validateForm()">
        <!-- Hidden fields -->
        <c:if test="${not empty param.methodID}">
            <input type="hidden" name="methodID" value="${param.methodID}">
        </c:if>
        <input type="hidden" name="doctorName" value="${param.doctorName}">
        <input type="hidden" name="specialization" value="${param.specialization}">
        <input type="hidden" name="hospital" value="${param.hospital}">
        <input type="hidden" name="date" value="${param.date}">
        <input type="hidden" name="time" value="${param.time}">
        <input type="hidden" name="appointmentID" value="${param.appointmentID}">

        <h1 class="title">Payment Information</h1>
        
        <div class="row">
            <div class="col">
                <div class="inputBox">
                    <label for="city">Card Accepted:</label>
                    <img src="images/images.png" alt="images" width="250px" height="75px">
                </div>
                
                <div class="inputBox">
                    <label for="cardHolder">Name On Card :</label>
                    <input name="cardHolder" type="text" id="cardHolder" placeholder="Enter the card holder's name" 
                           value="${param.cardHolder}" required>
                    <div id="cardHolderError" class="error"></div>
                </div>
                
                <div class="inputBox">
                    <label for="cardNo">Credit Card Number :</label>
                    <input name="cardNo" type="text" id="cardNo" placeholder="1111-2222-3333-4444" maxlength="12"
                           value="${param.cardNo}" required>
                    <div id="cardNoError" class="error"></div>      
                </div>
                
                <div class="inputBox">
                    <label for="expMonth">Exp Month :</label>
                    <input name="expMonth" type="month" id="expMonth"
                           value="${param.expMonth}" required>
                    <div id="expMonthError" class="error"></div>
                </div>
                
                <div class="inputBox">
                    <label for="cvv">CVV :</label>
                    <input name="cvv" type="number" id="cvv" placeholder="123" maxlength="3"
                           value="${param.cvv}" required>
                    <div id="cvvError" class="error"></div>
                </div>
            </div>
        </div>
        <input name="submit" type="submit" 
               value="${not empty param.methodID ? 'Update Payment Details' : 'Save Payment Details'}" 
               class="submit_btn">
    </form>
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>