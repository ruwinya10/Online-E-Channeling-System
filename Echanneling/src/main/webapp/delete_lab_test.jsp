<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HaloMed | Delete Lab Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }

        .container {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            text-align: center;
        }

        .btn {
            margin: 10px 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-confirm {
            background-color: #d9534f;
            color: white;
        }

        .btn-cancel {
            background-color: #5bc0de;
            color: white;
        }

        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

<%
    String testIdParam = request.getParameter("test_id");
    if (testIdParam == null || testIdParam.trim().isEmpty()) {
%>
    <div class="container">
        <h2>Error: Test ID not provided!</h2>
        <a href="admin_dashboard.jsp" class="btn btn-cancel">Go Back</a>
    </div>
<%
    } else {
%>
    <div class="container">
        <h2>Are you sure you want to delete this Lab Test?</h2>
        <form action="DeleteLabTestServlet" method="post">
            <input type="hidden" name="test_id" value="<%= testIdParam %>">
            <button type="submit" class="btn btn-confirm">Yes, Delete</button>
            <a href="admin_dashboard.jsp" class="btn btn-cancel">Cancel</a>
        </form>
    </div>
<%
    }
%>

</body>
</html>
