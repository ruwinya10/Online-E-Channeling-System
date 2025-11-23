<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.echannelling.util.DBConnection" %>
<%
    String appointmentId = request.getParameter("appointmentId");
    double paymentAmount = 0.0;

    if (appointmentId != null) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT test_price FROM lab_appointments WHERE appointment_id = ?")) {
            ps.setInt(1, Integer.parseInt(appointmentId));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                paymentAmount = rs.getDouble("test_price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>HaloMed | Secure Lab Payment</title>
  <link rel="shortcut icon" href="images/halomed2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      min-height: 100vh;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #b3e5fc, #e0f7fa);
      overflow-x: hidden;
    }
    .content-wrapper {
      min-height: calc(100vh - 130px);
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 150px 20px 0;
    }
    .container {
      display: flex;
      width: 850px;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0,0,0,0.2);
      overflow: hidden;
    }
    .image-section {
      flex: 1;
      background: url('images/med8.jpg') center/cover no-repeat;
    }
    .form-section {
      flex: 1;
      padding: 30px 40px;
    }
    h2 {
      text-align: center;
      margin-bottom: 10px;
      color: #00796b;
    }
    p {
      text-align: center;
      font-size: 14px;
      color: #333;
      margin-bottom: 20px;
    }
    label, input {
      display: block;
      width: 100%;
      margin-bottom: 10px;
    }
    input {
      padding: 12px;
      border: 2px solid #ddd;
      border-radius: 8px;
    }
    .error-text {
      color: red;
      font-size: 13px;
      margin-bottom: 10px;
      display: none;
    }
    button {
      width: 100%;
      padding: 12px;
      background: #00bcd4;
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s;
    }
    button:hover {
      background: #00796b;
    }
    .success-message {
      text-align: center;
      font-weight: bold;
      margin-top: 15px;
      color: #2e7d32;
      font-size: 16px;
    }
    .view-summary-button {
      display: inline-block;
      margin-top: 15px;
      padding: 10px 20px;
      background: #81d4fa;
      text-decoration: none;
      border-radius: 8px;
      color: #004d40;
      font-weight: 600;
      font-size: 14px;
      transition: background 0.3s;
    }
    .view-summary-button:hover {
      background: #4fc3f7;
    }

    /* Modal styles */
    .modal-overlay {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.4);
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 999;
    }

    .modal-box {
      background: white;
      padding: 30px;
      border-radius: 12px;
      text-align: center;
      max-width: 400px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    }

    .modal-box h3 {
      color: #00796b;
      margin-bottom: 15px;
    }

    .modal-box p {
      color: #333;
      margin-bottom: 25px;
    }

    .modal-buttons {
      display: flex;
      justify-content: space-between;
    }

    .modal-buttons button {
      padding: 10px 20px;
      border-radius: 6px;
      border: none;
      font-weight: 600;
      cursor: pointer;
    }

    .modal-buttons .confirm {
      background-color: #2196f3;
      color: #fff;
    }

    .modal-buttons .cancel {
      background-color: #ccc;
      color: #333;
    }

    .modal-buttons button:hover {
      opacity: 0.9;
    }
  </style>

  <script>
    function validateCardholderName() {
      const name = document.getElementById("cardName").value.trim();
      const regex = /^[A-Za-z\s]{2,}$/;
      const valid = regex.test(name);
      document.getElementById("nameError").style.display = valid ? "none" : "block";
      return valid;
    }

    function validateCardNumber() {
      const number = document.getElementById("cardNumber").value.replace(/\s+/g, "");
      const regex = /^\d{16}$/;
      const valid = regex.test(number);
      document.getElementById("numberError").style.display = valid ? "none" : "block";
      return valid;
    }

    function validateExpiry() {
      const expiry = document.getElementById("expiry").value.trim();
      const regex = /^(0[1-9]|1[0-2])\/\d{2}$/;
      const [month, year] = expiry.split("/").map(Number);
      const now = new Date();
      const currentMonth = now.getMonth() + 1;
      const currentYear = now.getFullYear() % 100;

      const valid = regex.test(expiry) && (year > currentYear || (year === currentYear && month >= currentMonth));
      document.getElementById("expiryError").style.display = valid ? "none" : "block";
      return valid;
    }

    function validateCVV() {
      const cvv = document.getElementById("cvv").value.trim();
      const regex = /^\d{3,4}$/;
      const valid = regex.test(cvv);
      document.getElementById("cvvError").style.display = valid ? "none" : "block";
      return valid;
    }

    function validateFormFields() {
      const nameValid = validateCardholderName();
      const numberValid = validateCardNumber();
      const expiryValid = validateExpiry();
      const cvvValid = validateCVV();
      return nameValid && numberValid && expiryValid && cvvValid;
    }

    function handleSubmit(event) {
      event.preventDefault();
      if (validateFormFields()) {
        document.getElementById("modal").style.display = "flex";
      }
    }

    function closeModal() {
      document.getElementById("modal").style.display = "none";
    }

    function confirmSubmit() {
      document.getElementById("paymentForm").submit();
    }
  </script>
</head>
<body>
  <%@ include file="header.jsp" %>
  <div class="content-wrapper">
    <div class="container">
      <div class="image-section"></div>
      <div class="form-section">
        <h2>Complete Your Payment</h2>
        <p>We accept payments via Visa, MasterCard, American Express, and PayPal.</p>
        <form id="paymentForm" action="LabPaymentServlet" method="post" onsubmit="handleSubmit(event)">
          <input type="hidden" name="appointmentId" value="<%= appointmentId %>" />

          <label for="cardName">Cardholder Name</label>
          <input type="text" id="cardName" name="cardName" placeholder="John Doe" required />
          <div id="nameError" class="error-text"> Invalid name. Only letters and spaces allowed (min 2 characters).</div>

          <label for="cardNumber">Card Number</label>
          <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" required />
          <div id="numberError" class="error-text"> Please enter a valid 16-digit card number.</div>

          <label for="expiry">Expiry (MM/YY)</label>
          <input type="text" id="expiry" name="expiry" placeholder="MM/YY" maxlength="5" required />
          <div id="expiryError" class="error-text"> Enter a valid expiry in MM/YY format (not expired).</div>

          <label for="cvv">CVV</label>
          <input type="password" id="cvv" name="cvv" placeholder="123" maxlength="4" required />
          <div id="cvvError" class="error-text"> CVV must be 3 or 4 digits.</div>

          <label for="paymentAmount">Payment Amount (LKR)</label>
          <input type="text" id="paymentAmount" name="paymentAmount" value="<%= paymentAmount %>" readonly required />

          <button type="submit">Pay & Confirm</button>

          <div class="success-message" style="display:<%= request.getParameter("success") != null ? "block" : "none" %>">
            ✅ Payment successful! Your lab appointment is confirmed.<br />
            <a href="ViewAppointment.jsp?appointmentId=<%= appointmentId %>" class="view-summary-button">View Appointment & Payment Summary</a>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div id="modal" class="modal-overlay">
    <div class="modal-box">
      <h3>Confirm Your Payment</h3>
      <p>Please confirm your payment. Once submitted, changes cannot be made.</p>
      <div class="modal-buttons">
        <button class="confirm" onclick="confirmSubmit()">Confirm</button>
        <button class="cancel" onclick="closeModal()">Cancel</button>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</body>
</html>
