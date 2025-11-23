function patientValidateForm() {
    let isValid = true;

    // Get form field values
    const name = document.getElementById("name").value.trim();
    const age = document.getElementById("age").value.trim();
    const gender = document.getElementById("gender").value.trim();
    const email = document.getElementById("email").value.trim();
    const phone = document.getElementById("phone").value.trim();

    // Reset error messages
    document.getElementById("nameError").style.display = "none";
    document.getElementById("ageError").style.display = "none";
    document.getElementById("genderError").style.display = "none";
    document.getElementById("emailError").style.display = "none";
    document.getElementById("phoneError").style.display = "none";

    // Name validation: 3-50 characters
    if (name.length < 3 || name.length > 50) {
        document.getElementById("nameError").innerText = "Invalid Name! Must be 3-50 characters.";
        document.getElementById("nameError").style.display = "block";
        isValid = false;
    }

    // Age validation: Must be a number between 1 and 120
    if (!age || isNaN(age) || age < 1 || age > 120) {
        document.getElementById("ageError").innerText = "Invalid Age! Must be between 1 and 120.";
        document.getElementById("ageError").style.display = "block";
        isValid = false;
    }

    // Gender validation: Must be "Male" or "Female"
    if (gender !== "Male" && gender !== "Female") {
        document.getElementById("genderError").innerText = "Invalid Gender! Must be 'Male' or 'Female'.";
        document.getElementById("genderError").style.display = "block";
        isValid = false;
    }

    // Email validation: Must match a valid email pattern
    const emailPattern = /^[A-Za-z0-9+_.-]+@(.+)$/;
    if (!email || !emailPattern.test(email)) {
        document.getElementById("emailError").innerText = "Invalid Email! Must be a valid email address.";
        document.getElementById("emailError").style.display = "block";
        isValid = false;
    }

    // Phone validation: Must be exactly 10 digits
    if (phone.length !== 10 || !/^\d+$/.test(phone)) {
        document.getElementById("phoneError").innerText = "Invalid Phone Number! Must be exactly 10 digits.";
        document.getElementById("phoneError").style.display = "block";
        isValid = false;
    }

    return isValid; // Prevent form submission if invalid
}