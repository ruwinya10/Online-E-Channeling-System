<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userType = (String) session.getAttribute("userType");
    Object sessionUser = session.getAttribute("user");
    String profileLink = "login.jsp";

    if (sessionUser != null && userType != null) {
        if ("patient".equals(userType)) {
            profileLink = "profile.jsp";
        } else if ("admin".equals(userType)) {
            profileLink = "adminDashboard.jsp";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Header</title>
<style>
/* Header Container */
.header {
    width: 100%;
    height: 90px;
    background: linear-gradient(90deg, #FFDEE9, #B5FFFC);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 40px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    position: relative;
    box-sizing: border-box;
    transition: all 0.4s ease-in-out;
}

.header:hover {
    background: linear-gradient(90deg, #B5FFFC, #FFDEE9);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
}

/* Logo Section */
.logo_box img {
    height: 200px;
    max-width: 200px;
    transition: transform 0.3s ease;
}

.logo_box img:hover {
    transform: scale(1.1);
}

/* Navigation Section */
.nav_bar {
    flex-grow: 1;
    text-align: center;
}

.nav_links {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px;
}

.nav_links a {
    color: #333;
    text-decoration: none;
    font-size: 17px;
    font-weight: 500;
    padding: 10px 18px;
    transition: background-color 0.3s, transform 0.3s;
    border-radius: 25px;
}

.nav_links a:hover {
    background-color: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

/* Profile Icon */
.user-cart {
    display: flex;
    align-items: center;
}

.icons a img {
    width: 55px;
    height: 55px;
    border-radius: 50%;
    transition: box-shadow 0.3s ease, transform 0.3s;
}

.icons a:hover img {
    transform: scale(1.1);
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
}

/* Animated Underline Effect */
.nav_links a::after {
    content: "";
    display: block;
    width: 0;
    height: 2px;
    background: #333;
    transition: width 0.3s;
}

.nav_links a:hover::after {
    width: 100%;
}
</style>
</head>
<body>
<div class="header">
    <div class="logo_box">
        <img src="images/logo3.png" alt="Logo">
    </div>

    <div class="nav_bar">
        <div class="nav_links">
            <a href="index.jsp">Home</a>
            <a href="GetDoctorServlet?view=profiles">Doctors</a>
            <a href="Search.jsp">Appointment</a>
            <a href="lab_test.jsp">Lab Test</a>
            <a href="contactSupport.jsp">Contact Us</a>
        </div>
    </div>

    <div class="user-cart">
        <div class="icons">
            <a href="<%= profileLink %>">
                <img src="images/user-r.png" alt="Profile">
            </a>
        </div>
    </div>
</div>
</body>
</html>