<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Terms and Conditions</title>
<link rel="stylesheet" type="text/css" href="css/tandc.css">
<link rel="shortcut icon" href="images/halomed2.png">
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
        <h1>Terms and Conditions</h1>
        
        <p><em>Last Updated: <%= new java.text.SimpleDateFormat("dd MMMM yyyy").format(new java.util.Date()) %></em></p>
        
        <p>By using <span class="highlight">HaloMed</span> (website, mobile app, or partner services), you agree to these Terms and Conditions (T&C). HaloMed reserves the right to modify these terms without prior notice.</p>
        
        <h2>1. Acceptance of Terms</h2>
        <p>By accessing or using HaloMed's services, you confirm that you have read, understood, and agreed to these Terms.</p>
        
        <h2>2. User Eligibility</h2>
        <ul>
            <li>Users must be <strong>18+ years</strong> or have parental consent.</li>
            <li>Business entities must have authorized representatives to agree on their behalf.</li>
            <li>HaloMed may <strong>restrict or terminate</strong> accounts for policy violations.</li>
        </ul>
        
        <h2>3. Account Registration & Security</h2>
        <ul>
            <li>Users are responsible for keeping login credentials <strong>secure</strong>.</li>
            <li>HaloMed is <strong>not liable</strong> for unauthorized account access.</li>
            <li>Users must <strong>notify HaloMed immediately</strong> of any security breaches.</li>
        </ul>
        
        <h2>4. Booking & Payments</h2>
        <ul>
            <li>Appointments are subject to <strong>doctor/hospital availability</strong>.</li>
            <li>Full payment (including doctor fee, hospital charges, service fee, and taxes) must be made for confirmation.</li>
            <li><strong>Reserved appointments</strong> not paid <strong>30 mins prior</strong> will be <strong>automatically cancelled</strong>.</li>
            <li><strong>Approximate appointment times</strong> may change due to unforeseen circumstances.</li>
        </ul>
        
        <h2>5. Cancellation & Refund Policy</h2>
        <ul>
            <li><strong>Standard cancellations</strong>: Refund eligibility depends on timing (e.g., 24-hour notice).</li>
            <li><strong>No-Show Refund (NSR) Service</strong>:
                <ul>
                    <li>Only applicable if selected at booking.</li>
                    <li>Refunds processed within <strong>3 working days</strong> (excluding service fee).</li>
                    <li>Valid for cancellations by <strong>doctors/hospitals</strong> or patient no-shows.</li>
                </ul>
            </li>
            <li><strong>Service fees are non-refundable</strong>.</li>
        </ul>
        
        <h2>6. Privacy & Data Use</h2>
        <ul>
            <li>Personal/medical data is collected for <strong>booking purposes only</strong>.</li>
            <li>Data may be shared with <strong>healthcare providers</strong> but not sold to third parties.</li>
            <li>Users must provide <strong>accurate information</strong>.</li>
        </ul>
        
        <h2>7. User Responsibilities</h2>
        <ul>
            <li>Must <strong>not misuse</strong> the platform (fraud, spam, harassment).</li>
            <li>Prohibited actions include:
                <ul>
                    <li>Sharing false information.</li>
                    <li>Reverse-engineering HaloMed’s systems.</li>
                    <li>Unauthorized commercial use.</li>
                </ul>
            </li>
        </ul>
        
        <h2>8. Medical Disclaimer</h2>
        <ul>
            <li>HaloMed <strong>does not guarantee</strong> diagnosis/treatment accuracy.</li>
            <li>Online consultations <strong>do not replace</strong> in-person medical advice.</li>
            <li>Users must <strong>seek emergency care</strong> when needed.</li>
        </ul>
        
        <h2>9. Intellectual Property</h2>
        <ul>
            <li>All content (logos, text, software) is owned by <strong>HaloMed</strong> or licensed partners.</li>
            <li>Unauthorized copying/distribution is <strong>prohibited</strong>.</li>
        </ul>
        
        <h2>10. Limitation of Liability</h2>
        <ul>
            <li>HaloMed is <strong>not liable</strong> for:
                <ul>
                    <li>Medical outcomes or doctor-patient disputes.</li>
                    <li>Technical errors affecting bookings.</li>
                    <li>Third-party website links.</li>
                </ul>
            </li>
        </ul>
        
        <h2>11. Termination</h2>
        <p>HaloMed may <strong>suspend/terminate</strong> accounts for violations.</p>
        
        <h2>12. Governing Law</h2>
        <p>These terms are governed by <strong>Sri Lankan law</strong>. Disputes will be resolved through <strong>arbitration or local courts</strong>.</p>
        
        <h2>13. Contact Information</h2>
        <p>For support or disputes, contact:</p>
        <ul>
            <li><strong>Email</strong>: support@halomed.lk</li>
            <li><strong>Hotline</strong>: 011 7 123 123</li>
        </ul>
        
        <div class="footer">
            <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> HaloMed. All Rights Reserved.</p>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>