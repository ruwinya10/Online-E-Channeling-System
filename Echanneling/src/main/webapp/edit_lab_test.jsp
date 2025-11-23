<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.echannelling.model.LabTestModel"%>
<%@ page import="com.echannelling.service.LabTestController"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>HaloMed | Edit Lab Test</title>
  <link rel="shortcut icon" href="images/halomed2.png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    /* General Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Body Styling */
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #e3f2fd, #bbdefb);
      min-height: 100vh; /* Ensure body takes at least full viewport height */
      display: flex;
      flex-direction: column; /* Stack children vertically */
    }

    /* Header Styling (Assuming header.jsp has a <header> tag) */
    header {
      width: 100%;
      background: #34495e; /* Example background color */
      color: white;
      padding: 15px 20px;
      text-align: center;
    }

    /* Footer Styling (Assuming footer.jsp has a <footer> tag) */
    footer {
      width: 100%;
      background: #34495e; /* Example background color */
      color: white;
      padding: 15px 20px;
      text-align: center;
      margin-top: auto; /* Pushes footer to the bottom */
    }

    /* Form Container */
    .form-container {
      background: #ffffff;
      padding: 35px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.15);
      max-width: 450px;
      width: 100%;
      margin: 20px auto; /* Center horizontally with vertical spacing */
      transition: box-shadow 0.3s ease, transform 0.3s ease;
    }

    .form-container:hover {
      box-shadow: 0 6px 45px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
    }

    .form-container h1 {
      text-align: center;
      font-size: 28px;
      color: #34495e;
      margin-bottom: 25px;
      font-weight: 600;
    }

    /* Form Group Styling */
    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: 600;
      margin-bottom: 8px;
      color: #2c3e50;
    }

    .form-group input, .form-group textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 10px;
      outline: none;
      transition: border-color 0.3s ease;
      font-size: 16px;
    }

    .form-group input:focus, .form-group textarea:focus {
      border-color: #4CAF50;
    }

    .form-group textarea {
      resize: vertical;
      height: 120px;
    }

    /* Submit Button */
    .submit-btn {
      background: #3498db;
      border: none;
      padding: 14px;
      width: 100%;
      color: white;
      font-weight: 600;
      cursor: pointer;
      border-radius: 8px;
      font-size: 16px;
      transition: background 0.3s ease, transform 0.2s ease;
    }

    .submit-btn:hover {
      background: #2980b9;
      transform: scale(1.05);
    }

    /* Error Styling */
    .error {
      color: #e74c3c;
      text-align: center;
      margin-top: 15px;
      font-size: 16px;
      font-weight: bold;
    }

    /* Link Styling */
    a {
      text-decoration: none;
      color: #4CAF50;
      font-weight: 600;
    }

    a:hover {
      text-decoration: underline;
    }

    /* Responsive Design */
    @media screen and (max-width: 600px) {
      .form-container {
        padding: 20px 25px;
        margin: 15px; /* Reduce margin on smaller screens */
      }

      .form-container h1 {
        font-size: 24px;
      }

      .submit-btn {
        font-size: 14px;
      }

      header, footer {
        padding: 10px 15px;
      }
    }
  </style>
</head>
<body>
  <%
    String testIdParam = request.getParameter("test_id");
    LabTestModel labTest = null;

    if (testIdParam == null || testIdParam.trim().isEmpty()) {
  %>
    <div class="form-container">
      <h1 class="error">Error: Test ID not provided!</h1>
      <p><a href="admin_dashboard.jsp">Go back to Dashboard</a></p>
    </div>
  <%
    } else {
        try {
            int testId = Integer.parseInt(testIdParam);
            labTest = LabTestController.getLabTestById(testId);

            if (labTest == null) {
  %>
                <div class="form-container">
                  <h1 class="error">Error: Lab Test not found!</h1>
                  <p><a href="admin_dashboard.jsp">Go back to Dashboard</a></p>
                </div>
  <%
            } else {
  %>
                <div class="form-container">
                  <h1>Edit Lab Test</h1>
                  <form action="LabTestUpdateServlet" method="post">
                    <input type="hidden" name="test_id" value="<%= labTest.getTestId() %>" />

                    <div class="form-group">
                      <label for="testName">Test Name</label>
                      <input type="text" name="test_name" value="<%= labTest.getTestName() %>" required />
                    </div>

                    <div class="form-group">
                      <label for="description">Description</label>
                      <textarea name="description" rows="4" required><%= labTest.getDescription() %></textarea>
                    </div>

                    <div class="form-group">
                      <label for="price">Price (LKR)</label>
                      <input type="number" name="price" step="0.01" value="<%= labTest.getPrice() %>" required />
                    </div>

                    <button type="submit" class="submit-btn">Update Test</button>
                  </form>
                </div>
  <%
            }
        } catch (NumberFormatException e) {
  %>
        <div class="form-container">
          <h1 class="error">Error: Invalid Test ID format.</h1>
          <p><a href="admin_dashboard.jsp">Go back to Dashboard</a></p>
        </div>
  <%
        }
    }
  %>

</body>
</html>