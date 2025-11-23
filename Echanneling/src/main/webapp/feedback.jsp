<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HaloMed | Feedback</title>
    <link rel="stylesheet" type="text/css" href="css/feedback.css">
     <link rel="shortcut icon" href="images/halomed2.png">
    <script>
        function handleSubmit(event) {
            event.preventDefault(); // Stop actual form submission
            alert("Thank you for your feedback!");
            document.getElementById("feedbackForm").reset(); // Optional: reset form
        }
    </script>
    <style>
    
body.feedback-page {
  	background: url('images/feedn4.jpg') no-repeat center center/cover;
    background-size: cover;
}
    
    </style>
</head>
<body class="feedback-page">
    <%@ include file="header.jsp" %>
    <div class="container">
        <h1>Share Your Feedback</h1>
        <p>Your thoughts help us make HaloMed better.</p>
        
        <% String msg = (String) request.getAttribute("message"); %>
        <% if (msg != null) { %>
          <div style="color: green; font-weight: bold; margin-bottom: 10px;"><%= msg %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/FeedbackServlet" method="post">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label>Rating:</label>
            <div class="star-rating">
                <input type="radio" id="star5" name="rating" value="5"><label for="star5">&#9733;</label>
                <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
                <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
                <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
                <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
            </div>

            <label for="comments">Your Feedback:</label>
            <textarea id="comments" name="comments" rows="5" placeholder="Enter your Feedback here" required></textarea>

            <button type="submit">Send Feedback</button>
        </form>
    </div>
    <script>
  document.querySelector("form").addEventListener("submit", function(event) {
    const email = document.getElementById("email").value.trim();
    
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(email)) {
      alert("Please enter a valid email address.");
      event.preventDefault();
      return;
    }
  });
</script>
    <%@ include file="footer.jsp" %>
</body>
</html>
