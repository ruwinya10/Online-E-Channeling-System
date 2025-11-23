<!-- Form to add doctor and availability details -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="images/halomed1.png">
	<title>HaloMed | Add Doctor and Availability Details</title>
	<link rel="shortcut icon" href="images/halomed2.png">
	<link rel="stylesheet" href="css/AddDoctor.css">
	<script src="js/AddDoctor.js"></script>
</head>
<body>
	<h1>Enter Doctor and Availability Details</h1>
	
	<div class="form-container">
	
		<!-- This form sends the doctor's details to AddDoctorServlet using POST method -->
		<form action="AddDoctorServlet" method="post" enctype="multipart/form-data">
	    	<table>
	        	<tr>
		            <td>Full Name:</td>
		            <td><input type="text" name="full_name" required></td>
	        	</tr>
	        	
		        <tr>
		            <td>Title:</td>
		            <td>
			            <select name="title" style="width:100%;" required>
			                <option value="Dr">Dr</option>
			                <option value="Prof">Prof</option>
			                <option value="Consult">Consult</option>
			            </select>
		            </td>
		        </tr>
		        
		        <tr>
		        	<td>Specialization:</td>
		            <td>
					    <input list="specializations" name="specialization" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
					    <datalist id="specializations">
					        <option value="Physician">
			            	<option value="Surgeon">
			            	<option value="Psychologist">
			                <option value="Cardiologist">
			                <option value="Dermatologist">
			                <option value="Neurologist">
			                <option value="Pediatrician">
			                <option value="Haematologist">
			                <option value="Gastroenterologist">	 
					    </datalist>
					</td>
		        </tr>
		        
		        <tr>
		            <td>Qualifications:</td>
		            <td><textarea name="qualifications" rows="4" style="width: 97%;"  required></textarea></td>
	        	</tr>
	        	
		        <tr>
		            <td>Experience (years):</td>
		            <td><input type="number" name="experience" required></td>
		        </tr>
		        
		        <tr>
		            <td>Gender:</td>
		            <td>
			            <select name="gender" class="large" style="width: 100%;" required>
			                <option value="Male">Male</option>
			                <option value="Female">Female</option>
			                <option value="Other">Other</option>
			            </select>
		            </td>
	       	   </tr>
	       	   
		        <tr>
		            <td>Contact:</td>
		            <td><input type="text" name="contact" required></td>
		        </tr>
		        
		        <tr>
		            <td>Email:</td>
		            <td><input type="email" name="email" required></td>
		        </tr>
		        
		        <tr>
		            <td>Profile Photo:</td>
		            <td><input type="file" name="profile_photo" accept="image/*" class="custom-file-input" style="width: 97%;"></td>
	        	</tr>
	        	
	    	</table>
	
	    	<div class="availability-section">
	        	<h3>Availability Details</h3>
	        	
	        	<!-- This is the container where multiple availability entries can be added dynamically -->
	        	<div id="availabilityEntries">
	            	<div class="availabilityEntry">
	                	<table>
		                    <tr>
		                        <td>Hospital Name:</td>
		                        <td>
								    <input list="hospitals" name="hospital_name" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
								    <datalist id="hospitals">
								        <option value="Asiri">
						                <option value="Nawaloka">
						                <option value="Lanka Hospitals">
						                <option value="Hemas">
						                <option value="Durdans">
						                <option value="Seth Sevana Hospitals">
						                <option value="Cooperative Hospital">
						                <option value="Navinne">
						                <option value="Ninewells">
						                <option value="Kings Hospital">
								    </datalist>
								</td>
		                    </tr>
		                    <tr>
		                        <td>Location:</td>
		                        <td><input type="text" name="location"></td>
		                    </tr>
	                    	<tr>
		                        <td>Day:</td>
		                        <td>
			                        <select name="day" required style="width: 100%;">
				                        <option value="Mon">Monday</option>
				                        <option value="Tue">Tuesday</option>
				                        <option value="Wed">Wednesday</option>
				                        <option value="Thu">Thursday</option>
				                        <option value="Fri">Friday</option>
				                        <option value="Sat">Saturday</option>
				                        <option value="Sun">Sunday</option>
			                    	</select>
			                    </td>
	                    	</tr>
		                    <tr>
		                        <td>Time:</td>
		                        <td><input type="datetime-local" name="time" step="1"></td>
		                    </tr>
		                    <tr>
		                        <td>Max Patients:</td>
		                        <td><input type="number" name="max_patients"></td>
		                    </tr>
		                    <tr>
		                        <td>Fee (Rs):</td>
		                        <td><input type="number" step="0.01" name="fee"></td>
		                    </tr>
	                	</table>
	            	</div>
	        	</div>
	        	<button type="button" onclick="addAvailability()">Add Another Availability</button>
	    	</div>
	    	<br>
	    	<input type="submit" value="Submit">
		</form>
	</div>
	
	
	<script>
		// This function adds another availability section when called
		function addAvailability() {
		    const container = document.getElementById('availabilityEntries');
		    const newEntry = document.createElement('div');
		    
		    newEntry.className = 'availabilityEntry';
		    newEntry.innerHTML = `
		    
		        <table>
		            <tr>
		                <td>Hospital Name:</td>
		                <td>
		                	<input list="hospitals" name="hospital_name" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
						    <datalist id="hospitals">
						        <option value="Asiri">
				                <option value="Nawaloka">
				                <option value="Lanka Hospitals">
				                <option value="Hemas">
				                <option value="Durdans">
				                <option value="Seth Sevana Hospitals">
				                <option value="Cooperative Hospital">
				                <option value="Navinne">
				                <option value="Ninewells">
				                <option value="Kings Hospital">
				    		</datalist>
				    	</td>
		            </tr>
		            <tr>
		                <td>Location:</td>
		                <td><input type="text" name="location"></td>
		            </tr>
		            <tr>
		                <td>Day:</td>
		                <td>
			                <select name="day" style="width: 100%;" required>
				                <option value="Mon">Monday</option>
				                <option value="Tue">Tuesday</option>
				                <option value="Wed">Wednesday</option>
				                <option value="Thu">Thursday</option>
				                <option value="Fri">Friday</option>
				                <option value="Sat">Saturday</option>
				                <option value="Sun">Sunday</option>
			        		</select>
		                </td>
		            </tr>
		            <tr>
		                <td>Time:</td>
		                <td><input type="datetime-local" name="time" step="1"></td>
		            </tr>
		            <tr>
		                <td>Max Patients:</td>
		                <td><input type="number" name="max_patients"></td>
		            </tr>
		            <tr>
		                <td>Fee (Rs):</td>
		                <td><input type="number" step="0.01" name="fee"></td>
		            </tr>
		        </table>
		    `;
		    container.appendChild(newEntry);
		}
		
	</script>
</body>
</html>