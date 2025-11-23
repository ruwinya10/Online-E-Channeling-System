<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeloMed - Refund Policy</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5; /* Light gray background */
            color: #757575; /* Soft gray for text */
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-title {
            background-color: #1976d2; /* Primary blue */
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }

        .page-title h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .content {
            background-color: white; /* White content background */
            padding: 30px;
            border-radius: 0 0 8px 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #43a047; /* Green for headings */
            margin-bottom: 15px;
            font-size: 22px;
        }

        p {
            margin-bottom: 15px;
        }

        ul, ol {
            margin-bottom: 15px;
            padding-left: 20px;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            color: #1976d2; /* Blue for links */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .contact-info {
            background-color: #f5f5f5; /* Light gray for contact section */
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .contact-info p {
            margin: 5px 0;
        }

        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }

            .content {
                padding: 20px;
            }

            .page-title h1 {
                font-size: 24px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
        <div class="page-title">
            <h1>HeloMed Refund Policy</h1>
            <p>Your trusted e-channeling service</p>
        </div>
        <div class="content">
            <h2>Our Commitment</h2>
            <p>At HeloMed, we strive to provide exceptional medical consultation services through our e-channeling platform. We understand that circumstances may arise where you need to request a refund. This policy outlines the conditions under which refunds may be processed.</p>

            <h2>Refund Eligibility</h2>
            <p>Refunds may be considered under the following circumstances:</p>
            <ul>
                <li><strong>Cancellation by HeloMed:</strong> If we cancel an appointment due to unforeseen circumstances, you are eligible for a full refund.</li>
                <li><strong>Technical Issues:</strong> If you experience technical difficulties caused by our platform that prevent you from attending a scheduled consultation, you may request a refund.</li>
                <li><strong>Doctor No-Show:</strong> If a doctor fails to attend a scheduled consultation, you are eligible for a full refund.</li>
            </ul>

            <h2>Non-Refundable Cases</h2>
            <p>Refunds will not be provided in the following cases:</p>
            <ul>
                <li><strong>Patient Cancellation:</strong> Cancellations made less than 24 hours before the appointment are not eligible for a refund.</li>
                <li><strong>No-Show:</strong> If you fail to attend a scheduled consultation without prior notice, no refund will be issued.</li>
                <li><strong>Service Satisfaction:</strong> Refunds are not provided based on dissatisfaction with the consultation content, as this is subjective.</li>
            </ul>

            <h2>Refund Process</h2>
            <p>To request a refund, please follow these steps:</p>
            <ol>
                <li>Contact our support team within 7 days of the appointment via email or our support portal.</li>
                <li>Provide your appointment details, including the appointment ID and reason for the refund request.</li>
                <li>Our team will review your request and respond within 3-5 business days.</li>
            </ol>
            <p>Approved refunds will be processed to the original payment method within 7-10 business days.</p>

            <div class="contact-info">
                <h2>Contact Us</h2>
                <p>Email: support@helomed.com</p>
                <p>Phone: +94 11 472 1678</p>
                <p>Support Portal: <a href="https://www.helomed.com/support">www.helomed.com/support</a></p>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>