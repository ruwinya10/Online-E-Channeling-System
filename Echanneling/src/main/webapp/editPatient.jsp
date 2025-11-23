<%@ page import="com.echannelling.model.User, com.echannelling.service.UserDAO" %>

<%
	//Retrieve patient ID from request parameter
    int id = Integer.parseInt(request.getParameter("id"));

	//Instantiate UserDAO to access patient data
    UserDAO dao = new UserDAO();
    User patient = dao.getUserById(id);  // Fetch patient details using ID

 	// Retrieve and clear any error message stored in the session
    String error = (String) session.getAttribute("error");
    session.removeAttribute("error"); // Clear it after retrieving
    String contextPath = request.getContextPath();  // Get context path for dynamic resource linking
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HaloMed | Edit Patient</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="shortcut icon" href="<%= contextPath %>/images/halomed2.png">

    <style>
        body {
            margin: 0;
            padding: 60px 0;
            font-family: 'Poppins', sans-serif;
            background: #d1eafd;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            background: #b5ddfc;
            backdrop-filter: blur(15px);
            padding: 50px;
            border-radius: 20px;
            max-width: 600px;
            width: 90%;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            text-align: center;
            margin-top: 18px;
        }

        .back-link a {
            color: #004c99;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .message-error {
            background-color: #ffcccc;
            color: #a70000;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
        }

        #imagePreview {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            display: <%= patient.getProfileImage() != null && !patient.getProfileImage().isEmpty() ? "block" : "none" %>;
        }
    </style>

    <script>
 		// Function to validate form inputs before submission
        function validateForm() {
            const email = document.forms["editForm"]["email"].value;
            const phone = document.forms["editForm"]["phone"].value;
            const nic = document.forms["editForm"]["nic"].value;
            const password = document.forms["editForm"]["password"].value;
            const fileInput = document.forms["editForm"]["profileImage"].files[0];

            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const phonePattern = /^0\d{9}$/;
            const nicPattern = /^\d{9}[vV]$|^\d{12}$/;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}$/;
            const allowedImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

            if (!emailPattern.test(email)) {
                alert("Invalid email format.");
                return false;
            }

            if (!phonePattern.test(phone)) {
                alert("Phone must start with 0 and have 10 digits.");
                return false;
            }

            if (!nicPattern.test(nic)) {
                alert("Invalid NIC format.");
                return false;
            }

            if (!passwordPattern.test(password)) {
                alert("Password must be at least 8 characters long and contain uppercase, lowercase, digit, and special character.");
                return false;
            }

            if (fileInput && !allowedImageTypes.includes(fileInput.type)) {
                alert("Only JPG, PNG, or GIF images are allowed.");
                return false;
            }

            return true;
        }

        // Image preview
        document.getElementById('profileImage').addEventListener('change', function(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('imagePreview');
            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

            if (file && allowedTypes.includes(file.type)) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
                alert('Please select a valid image file (JPG, PNG, GIF).');
                event.target.value = ''; // Clear invalid file
            }
        });
    </script>
</head>
<body>
    <div class="container">
        <% if (error != null) { %>
            <div class="message-error"><%= error %></div>
        <% } %>

        <h2><i class="fa-solid fa-user-plus"></i> Edit Patient</h2>

        <form name="editForm" action="UpdatePatientServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="<%= patient.getId() %>">

            <label>Title</label>
            <select name="title" required>
                <%
                    String[] titles = {"Mr.", "Ms.", "Miss.", "Mrs.", "Dr.", "Prof.", "Rev.", "Sis.", "Hons.", "Baby.", "Master."};
                    for (String title : titles) {
                %>
                    <option value="<%= title %>" <%= title.equals(patient.getTitle()) ? "selected" : "" %>><%= title %></option>
                <% } %>
            </select>

            <label>First Name</label>
            <input type="text" name="firstName" value="<%= patient.getFirstName() %>" required>

            <label>Last Name</label>
            <input type="text" name="lastName" value="<%= patient.getLastName() %>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%= patient.getEmail() %>" required>

            <label>Phone</label>
            <input type="text" name="phone" value="<%= patient.getPhone() %>" required>

            <label>NIC</label>
            <input type="text" name="nic" value="<%= patient.getNic() %>" required>

            <label>Address</label>
            <input type="text" name="address" value="<%= patient.getAddress() %>" required>

            <label>Password</label>
            <input type="password" name="password" value="<%= patient.getPassword() %>" required>

            <label for="profileImage">Profile Image</label>
            <img id="imagePreview" src="<%= patient.getProfileImage() != null && !patient.getProfileImage().isEmpty() ? contextPath + "/" + patient.getProfileImage() : contextPath + "/images/profile1.jpg" %>" alt="Image Preview">
            <input type="file" name="profileImage" id="profileImage" accept="image/*">

            <input type="submit" value="Update Patient">
        </form>

        <div class="back-link">
            <a href="patientManagement.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>