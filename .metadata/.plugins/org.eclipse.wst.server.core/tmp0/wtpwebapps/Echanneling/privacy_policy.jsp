<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeloMed | Privacy Policy</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <style>
        /* Reset default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .policy-section {
            background-color: white;
            padding: 2rem;
            margin-bottom: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .policy-section h2 {
            color: #1976d2;
            margin-bottom: 1rem;
            font-size: 1.8rem;
        }

        .policy-section p, .policy-section ul {
            margin-bottom: 1rem;
            color: #333;
        }

        .policy-section ul {
            list-style-type: disc;
            margin-left: 2rem;
        }

        .contact-link {
            color: #43a047;
            text-decoration: none;
            font-weight: bold;
        }

        .contact-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .policy-section h2 {
                font-size: 1.5rem;
            }

            .container {
                padding: 0 1rem;
            }
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %>
    <div class="container">
        <div class="policy-section">
            <h2>Privacy Policy</h2>
            <p>At HeloMed, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data when you use our e-channeling platform.</p>
        </div>

        <div class="policy-section">
            <h2>Information We Collect</h2>
            <p>We collect information to provide better services to our users. The types of information we may collect include:</p>
            <ul>
                <li><strong>Personal Information:</strong> Name, email address, phone number, and other details provided during registration or appointment booking.</li>
                <li><strong>Health Information:</strong> Medical history, appointment details, and other health-related data shared with healthcare providers through our platform.</li>
                <li><strong>Usage Data:</strong> Information about how you interact with our website, such as IP address, browser type, and pages visited.</li>
                <li><strong>Payment Information:</strong> Billing details for services booked through HeloMed, processed securely via our trusted payment partners.</li>
            </ul>
        </div>

        <div class="policy-section">
            <h2>How We Use Your Information</h2>
            <p>Your information is used to:</p>
            <ul>
                <li>Facilitate appointment bookings and communication with healthcare providers.</li>
                <li>Improve our platform's functionality and user experience.</li>
                <li>Process payments securely.</li>
                <li>Send appointment reminders and important updates.</li>
                <li>Comply with legal obligations and protect against fraudulent activities.</li>
            </ul>
        </div>

        <div class="policy-section">
            <h2>Sharing Your Information</h2>
            <p>We do not sell or rent your personal information. We may share your information with:</p>
            <ul>
                <li><strong>Healthcare Providers:</strong> To facilitate your appointments and consultations.</li>
                <li><strong>Service Providers:</strong> Third-party vendors who assist with payment processing, analytics, or other operational needs, under strict confidentiality agreements.</li>
                <li><strong>Legal Authorities:</strong> When required by law or to protect the safety of our users and platform.</li>
            </ul>
        </div>

        <div class="policy-section">
            <h2>Data Security</h2>
            <p>We implement industry-standard security measures, including encryption and secure servers, to protect your data. However, no system is completely secure, and we encourage you to use strong passwords and avoid sharing sensitive information unnecessarily.</p>
        </div>

        <div class="policy-section">
            <h2>Your Rights</h2>
            <p>You have the right to:</p>
            <ul>
                <li>Access and update your personal information.</li>
                <li>Request deletion of your data, subject to legal obligations.</li>
                <li>Opt out of non-essential communications, such as marketing emails.</li>
            </ul>
            <p>To exercise these rights, please contact us at <a href="mailto:support@helomed.com" class="contact-link">support@helomed.com</a>.</p>
        </div>

        <div class="policy-section">
            <h2>Cookies</h2>
            <p>We use cookies to enhance your experience on our platform. These may include session cookies for navigation and analytics cookies to understand user behavior. You can manage cookie preferences through your browser settings.</p>
        </div>

        <div class="policy-section">
            <h2>Changes to This Policy</h2>
            <p>We may update this Privacy Policy from time to time. Any changes will be posted on this page, and we encourage you to review it periodically.</p>
        </div>

        <div class="policy-section">
            <h2>Contact Us</h2>
            <p>If you have any questions or concerns about this Privacy Policy, please reach out to us at <a href="mailto:support@helomed.com" class="contact-link">support@helomed.com</a> or via our <a href="contactsupport.jsp" class="contact-link">Contact Page</a>.</p>
        </div>
    </div>
     <%@ include file="footer.jsp" %>
</body>
</html>