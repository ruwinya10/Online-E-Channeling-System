<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeloMed | Health Tips</title>
    <link rel="shortcut icon" href="images/halomed2.png">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            flex: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .blog-title {
            text-align: center;
            color: #1976d2;
            font-size: 2.5em;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .tips-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .tip-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .tip-card:hover {
            transform: translateY(-5px);
        }

        .tip-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .tip-content {
            padding: 20px;
        }

        .tip-title {
            font-size: 1.5em;
            color: #43a047;
            margin-bottom: 10px;
        }

        .tip-text {
            font-size: 1em;
            line-height: 1.6;
            color: #555;
            margin-bottom: 15px;
        }

        .read-more {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .read-more:hover {
            background-color: #ff9800;
        }

        .tip-author {
            font-size: 0.9em;
            color: #777;
            margin-top: 10px;
        }

        @media (max-width: 600px) {
            .blog-title {
                font-size: 2em;
            }

            .tips-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <h1 class="blog-title">HeloMed Health Tips</h1>
        <div class="tips-grid">
            <div class="tip-card">
                <img src="images/health_tips1.jpeg" alt="Healthy Eating" class="tip-image">
                <div class="tip-content">
                    <h2 class="tip-title">Eat a Balanced Diet</h2>
                    <p class="tip-text">
                        Incorporate a variety of fruits, vegetables, whole grains, and lean proteins into your meals. A balanced diet supports overall health and boosts immunity.
                    </p>
                    <a href="#" class="read-more">Read More</a>
                    <p class="tip-author">By Dr. Jane Smith | Jan 10, 2025</p>
                </div>
            </div>

            <div class="tip-card">
                <img src="images/health_tips2.jpeg" alt="Stay Hydrated" class="tip-image">
                <div class="tip-content">
                    <h2 class="tip-title">Stay Hydrated</h2>
                    <p class="tip-text">
                        Drink at least 8 glasses of water daily to maintain hydration. Proper hydration improves energy levels and supports bodily functions.
                    </p>
                    <a href="#" class="read-more">Read More</a>
                    <p class="tip-author">By Dr. John Doe | Mar 12, 2025</p>
                </div>
            </div>

            <div class="tip-card">
                <img src="images/health_tips3.jpeg" alt="Exercise Regularly" class="tip-image">
                <div class="tip-content">
                    <h2 class="tip-title">Exercise Regularly</h2>
                    <p class="tip-text">
                        Aim for at least 30 minutes of moderate exercise most days of the week. Regular physical activity enhances heart health and reduces stress.
                    </p>
                    <a href="#" class="read-more">Read More</a>
                    <p class="tip-author">By Dr. Emily Brown | May 15, 2025</p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
