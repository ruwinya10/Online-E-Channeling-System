<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HaloMed | Create New Patient</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="shortcut icon" href="images/halomed2.png">

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
	padding: 50px;
	border-radius: 20px;
	max-width: 600px;
	width: 90%;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
	animation: fadeIn 1s ease-in-out;
}

@
keyframes fadeIn {
	from {opacity: 0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	text-align: center;
	color: #004c99;
	margin-bottom: 30px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: 500;
	color: #333;
}

select, input[type="text"], input[type="email"], input[type="password"]
	{
	width: 100%;
	padding: 12px 15px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 15px;
	background: rgba(255, 255, 255, 0.9);
}

input[type="submit"] {
	width: 100%;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	padding: 14px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
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

#errorBox {
	color: red;
	text-align: center;
	margin-bottom: 20px;
	font-weight: bold;
}

input[type="file"] {
	width: 100%;
	padding: 12px 15px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 15px;
	background: rgba(255, 255, 255, 0.9);
}

#imagePreview {
	display: none;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>
			<i class="fa-solid fa-user-plus"></i> Create New Patient
		</h2>

		<!-- Display error message here if any -->
		<div id="errorBox">
			<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
		</div>

		<form id="createPatientForm" method="POST"
			action="CreatePatientServlet" enctype="multipart/form-data">

			<label for="title">Title</label> 
			<select name="title" id="title"
				required>
				<option value="">Select</option>
				<option value="Mr."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Mr.") ? "selected" : "" %>>Mr.</option>
				<option value="Ms."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Ms.") ? "selected" : "" %>>Ms.</option>
				<option value="Miss."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Miss.") ? "selected" : "" %>>Miss.</option>
				<option value="Mrs."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Mrs.") ? "selected" : "" %>>Mrs.</option>
				<option value="Dr."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Dr.") ? "selected" : "" %>>Dr.</option>
				<option value="Prof."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Prof.") ? "selected" : "" %>>Prof.</option>
				<option value="Rev."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Rev.") ? "selected" : "" %>>Rev.</option>
				<option value="Sis."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Sis.") ? "selected" : "" %>>Sis.</option>
				<option value="Hons."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Hons.") ? "selected" : "" %>>Hons.</option>
				<option value="Baby."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Baby.") ? "selected" : "" %>>Baby.</option>
				<option value="Master."
					<%= request.getParameter("title") != null && request.getParameter("title").equals("Master.") ? "selected" : "" %>>Master.</option>
			</select> 
			<label for="firstName">First Name</label>
			<input type="text" name="firstName" id="firstName" value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>" required>
			  
			<label for="lastName">Last Name</label> 
			<input type="text" name="lastName" id="lastName" value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>" required> 
				
			<label for="email">Email</label>
			<input type="email" name="email" id="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
				
			<label for="phone">Phone</label> 
			<input type="text" name="phone" id="phone" value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" required> 
				
			<label for="nic">NIC</label>
			<input type="text" name="nic" id="nic" value="<%= request.getParameter("nic") != null ? request.getParameter("nic") : "" %>" required>
				
			<label for="address">Address</label>
		    <input type="text" name="address" id="address" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" required>
				
			<label for="password">Password</label>
			<input type="password" name="password" id="password" value="<%= request.getParameter("password") != null ? request.getParameter("password") : "" %>" required>
				
			<label for="profileImage">Profile Image</label>
			<img id="imagePreview" src="" alt="Image Preview"> 
			<input type="file" name="profileImage" id="profileImage" accept="image/*">

			<input type="hidden" name="role" value="patient">
			<input type="submit" value="Create Patient">
		</form>

		<div class="back-link">
			<a href="patientManagement.jsp">← Back to Dashboard</a>
		</div>
	</div>

	<script>
//Client-side validation and image preview
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

document.getElementById('email').addEventListener('blur', checkUserExists);
document.getElementById('nic').addEventListener('blur', checkUserExists);

function checkUserExists() {
    const email = document.getElementById('email').value;
    const nic = document.getElementById('nic').value;

    if (!email && !nic) return;

    var url = "CheckUserExists?email=" + encodeURIComponent(email) + "&nic=" + encodeURIComponent(nic);
    fetch(url)
        .then(res => res.json())
        .then(data => {
            if (data.exists) {
                alert("This email or NIC is already in use.");
            }
        });
}
</script>

</body>
</html>
