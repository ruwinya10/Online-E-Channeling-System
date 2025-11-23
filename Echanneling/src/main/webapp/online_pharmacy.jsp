<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeloMed - Online Pharmacy</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #757575;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header-div {
            background-color: #1976d2;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .header-div h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .header-div p {
            font-size: 1.2em;
        }

        .hero {
            background-color: white;
            padding: 40px 20px;
            text-align: center;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .hero h2 {
            color: #1976d2;
            font-size: 2em;
            margin-bottom: 15px;
        }

        .hero p {
            font-size: 1.1em;
            max-width: 600px;
            margin: 0 auto;
        }

        .cta-button {
            display: inline-block;
            background-color: #43a047;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 1.1em;
            transition: background-color 0.3s;
        }

        .cta-button:hover {
            background-color: #388e3c;
        }

        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin: 40px 0;
        }

        .feature-card {
            background-color: white;
            width: 300px;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .feature-card h3 {
            color: #1976d2;
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .feature-card p {
            font-size: 1em;
        }

        @media (max-width: 768px) {
            .header-div h1 {
                font-size: 2em;
            }

            .hero h2 {
                font-size: 1.5em;
            }

            .feature-card {
                width: 100%;
                max-width: 400px;
            }
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
        <div class="header-div">
            <h1>HeloMed Online Pharmacy</h1>
            <p>Order your prescriptions online and get them delivered to your doorstep</p>
        </div>

        <div class="hero">
            <h2>Convenient Healthcare at Your Fingertips</h2>
            <p>With HeloMed's Online Pharmacy, you can easily order your medications from the comfort of your home. Fast, reliable, and secure delivery ensures you never miss a dose.</p>
            <a href="#" class="cta-button">Order Now</a>
        </div>

        <div class="features">
            <div class="feature-card">
                <h3>Easy Ordering</h3>
                <p>Upload your prescription or select from our wide range of medications with just a few clicks.</p>
            </div>
            <div class="feature-card">
                <h3>Fast Delivery</h3>
                <p>Get your medications delivered to your doorstep quickly and safely, wherever you are.</p>
            </div>
            <div class="feature-card">
                <h3>Secure & Trusted</h3>
                <p>Our platform ensures your personal information and prescriptions are handled with utmost care.</p>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>