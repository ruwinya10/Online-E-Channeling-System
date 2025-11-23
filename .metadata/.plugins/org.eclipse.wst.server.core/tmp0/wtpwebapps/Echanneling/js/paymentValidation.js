function validateForm() {
    let isValid = true;
    const cardHolder = document.getElementById("cardHolder").value.trim();
    const cardNo = document.getElementById("cardNo").value.trim();
    const expMonth = document.getElementById("expMonth").value;
    const cvv = document.getElementById("cvv").value.trim();

    // Reset error messages
    document.getElementById("cardHolderError").style.display = "none";
    document.getElementById("cardNoError").style.display = "none";
    document.getElementById("expMonthError").style.display = "none";
    document.getElementById("cvvError").style.display = "none";

    // Cardholder validation
    if (cardHolder.length < 3 || cardHolder.length > 50) {
        document.getElementById("cardHolderError").innerText = "Invalid Card Holder's Name! Must be 3-50 characters.";
        document.getElementById("cardHolderError").style.display = "block";
        isValid = false;
    }

    // Card number validation
    if (cardNo.length !== 12 || !/^\d+$/.test(cardNo)) {
        document.getElementById("cardNoError").innerText = "Invalid Card Number! Must be exactly 12 digits.";
        document.getElementById("cardNoError").style.display = "block";
        isValid = false;
    }

    // CVV validation
    if (cvv.length !== 3 || !/^\d+$/.test(cvv)) {
        document.getElementById("cvvError").innerText = "Invalid CVV! Must be exactly 3 digits.";
        document.getElementById("cvvError").style.display = "block";
        isValid = false;
    }

    // Expiration date validation
    if (expMonth) {
        const today = new Date();
        const selectedDate = new Date(expMonth + "-01");
        if (selectedDate < today) {
            document.getElementById("expMonthError").innerText = "Invalid Expiry Date! Cannot be in the past.";
            document.getElementById("expMonthError").style.display = "block";
            isValid = false;
        }
    } else {
        document.getElementById("expMonthError").innerText = "Expiration Date is required!";
        document.getElementById("expMonthError").style.display = "block";
        isValid = false;
    }

    return isValid; // Prevent form submission if invalid
}