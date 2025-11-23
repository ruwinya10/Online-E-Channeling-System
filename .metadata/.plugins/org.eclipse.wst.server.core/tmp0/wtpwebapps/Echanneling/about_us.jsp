<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HaloMed | About Us</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f9; 
            color: #333; 
            text-align: left; /* Align text to the left */
        }
        .header-section { 
            text-align: center; 
            padding: 20px 20px; 
            background: #b5e2ff; 
            color: #fff; 
        }
        .header-section h1 { 
            font-size: 40px; 
            margin-bottom: 10px; 
            color: black;
        }
        .header-section p { 
            font-size: 18px; 
            max-width: 700px; 
            margin: 0 auto; 
            color: black;
        }

        .main-content { 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            padding: 40px 20px; 
        }
        .main-content img { 
            width: 100%; 
            max-width: 1000px; 
            border-radius: 10px; 
            margin-bottom: 30px; 
        }

        .content-text { 
            max-width: 900px; 
            text-align: left;
            font-size: 16px; 
            
             
        }
        .content-text h2 { 
            font-size: 28px; 
            margin-bottom: 15px; 
            color: #0066cc; 
        }
        .content-text ul { 
            list-style-type: disc; 
            margin-left: 20px; 
        }

        .vision-mission { 
            display: flex; 
            flex-wrap: wrap; 
            gap: 40px; 
            margin-top: 40px; 
            justify-content: center; 
        }
        .vision-mission .card { 
            flex: 1; 
            background: #95b9c7; 
            padding: 30px; 
            border-radius: 10px; 
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); 
            max-width: 400px; 
        }
        .card h2 { 
            font-size: 28px; 
            margin-bottom: 15px; 
            color: #0066cc; 
        }
        .card p { 
            font-size: 16px; 
            color: #555; 
        }

    </style>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="header-section">
        <h1>About Us</h1>
        <p>Welcome to HaloMed, your trusted online healthcare and e-channeling platform.</p>
    </div>

    <div class="main-content">
        <img src="images/slide111.jpg" alt="HaloMed Banner">

        <!-- Added Paragraph Above Our Story -->
        <div class="content-text">
            <p>HaloMed is a leading e-channeling platform designed to make healthcare accessible and convenient for everyone. Established to bridge the gap between patients and healthcare providers, we ensure that quality medical services are just a click away. Our mission is to empower patients with easy access to a wide network of healthcare professionals, enabling them to book appointments, access lab tests, and make secure payments seamlessly. We are committed to delivering a user-friendly, secure, and efficient healthcare experience.</p>
        </div>

        <div class="content-text">
            <h2>Our Story</h2>
            <ul>
                <li>Founded to bridge the gap between patients and healthcare providers.</li>
                <li>Dedicated to making healthcare accessible and convenient for everyone.</li>
                <li>Ensures quality medical services are just a click away.</li>
            </ul>

            <h2>Core Values</h2>
            <ul>
                <li>Accessibility: Making healthcare services available to all.</li>
                <li>Security: Ensuring safe and secure transactions and data privacy.</li>
                <li>Quality: Partnering with trusted healthcare professionals and facilities.</li>
            </ul>

            <h2>Why Choose Us</h2>
            <ul>
                <li>Wide Network: Access to numerous healthcare professionals.</li>
                <li>Easy Booking: Simple, user-friendly appointment booking system.</li>
                <li>Secure Payments: Safe and reliable payment methods.</li>
                <li>Comprehensive Services: Includes doctor appointments, lab tests, and more.</li>
            </ul>
        </div>

        <div class="vision-mission">
            <div class="card">
                <h2>Our Vision</h2>
                <p>To revolutionize healthcare accessibility, providing a seamless e-channeling experience for all.</p>
            </div>
            <div class="card">
                <h2>Our Mission</h2>
                <p>To connect patients with quality healthcare professionals through an easy-to-use, secure, and efficient platform.</p>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>

</body>
</html>
