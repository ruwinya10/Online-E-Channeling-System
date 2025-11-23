<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    com.echannelling.model.LabTestModel labTest = (com.echannelling.model.LabTestModel) request.getAttribute("labTest");
    if (labTest == null) {
        response.sendRedirect("lab_test.jsp?error=No Test Selected");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>HaloMed | Book Lab Appointment</title>
  <link rel="shortcut icon" href="images/halomed2.png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #e0f7fa;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      margin: 0;
    }

    header, footer {
      width: 100%;
      position: relative;
    }

    .main_content {
      flex-grow: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .booking_container {
      display: flex;
      width: 60%;
      height: 80%;
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 25px;
      box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .booking_image {
      width: 40%;
    }

    .booking_image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .booking_form {
      width: 60%;
      padding: 20px;
      background-color: #b3e5fc;
      transition: background-color 0.3s ease;
      overflow-y: auto;
      max-height: 100%;
    }

    .booking_form:hover {
      background-color: #a1d4f4;
    }

    .booking_form h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .booking_form label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }

    .booking_form input,
    .booking_form select,
    .booking_form button {
      width: 90%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 14px;
    }

    .booking_form button {
      background-color: #039be5;
      color: #fff;
      border: none;
      cursor: pointer;
      transition: background 0.3s;
      width: 50%;
      max-width: 300px;
    }

    .booking_form button:hover {
      background-color: #0277bd;
    }

    /* Confirmation Modal Styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
      background-color: #fff;
      margin: 15% auto;
      padding: 30px;
      border-radius: 10px;
      width: 400px;
      text-align: center;
      box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .modal-content h3 {
      margin-bottom: 20px;
    }

    .modal-buttons {
      display: flex;
      justify-content: space-around;
    }

    .modal-buttons button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }

    .confirm-btn {
      background-color: #039be5;
      color: white;
    }

    .cancel-btn {
      background-color: #dc3545;
      color: white;
    }

    .confirm-btn:hover {
      background-color: #0277bd;
    }

    .cancel-btn:hover {
      background-color: #c82333;
    }
  </style>

  <script>
    function showConfirmation(event) {
      event.preventDefault(); // stop form from submitting immediately
      document.getElementById('confirmationModal').style.display = 'block';
    }

    function confirmSubmission() {
      document.getElementById("bookingForm").submit();
    }

    function cancelModal() {
      document.getElementById('confirmationModal').style.display = 'none';
    }
  </script>
</head>
<body>
  <header>
    <%@ include file="header.jsp" %>
  </header>

  <div class="main_content">
    <div class="booking_container">
      <div class="booking_image">
        <img src="images/med4.jpg" alt="Lab Booking Image">
      </div>
      <div class="booking_form">
        <h2>Book Your Test</h2>
        <form id="bookingForm" action="LabAppointmentBookingServlet" method="post" onsubmit="showConfirmation(event)">
          <input type="hidden" name="testId" value="<%= labTest.getTestId() %>" />

          <label>Lab Test</label>
          <input type="text" name="testName" value="<%= labTest.getTestName() %>" readonly />

          <label>Price (LKR)</label>
          <input type="text" name="testPrice" value="<%= labTest.getPrice() %>" readonly />

          <label>Full Name</label>
          <input type="text" name="name" required />

          <label>Email</label>
          <input type="email" name="email" required />

          <label>Preferred Date</label>
          <input type="date" name="date" required />

          <label>Choose a Hospital</label>
          <select name="hospital" required>
              <option value="Asiri Hospital">Asiri Hospitals</option>
              <option value="Nawaloka Hospital">Nawaloka Hospitals</option>
              <option value="Lanka Hospital">Lanka Hospitals</option>
              <option value="Durdans Hospital">Durdans Hospitals</option>
          </select>

          <button type="submit">Pay & Book Now</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Confirmation Modal -->
  <div id="confirmationModal" class="modal">
    <div class="modal-content">
      <h3>Please confirm those details are correct.<br>You cannot change this later.</h3>
      <div class="modal-buttons">
        <button class="confirm-btn" onclick="confirmSubmission()">Confirm</button>
        <button class="cancel-btn" onclick="cancelModal()">Go Back</button>
      </div>
    </div>
  </div>

  <footer>
    <%@ include file="footer.jsp" %>
  </footer>
</body>
</html>
