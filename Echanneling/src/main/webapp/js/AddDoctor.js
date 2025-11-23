document.addEventListener("DOMContentLoaded", function () {
document.querySelector("form").addEventListener("submit", function (event) {
const email = document.querySelector('input[name="email"]').value;
const contact = document.querySelector('input[name="contact"]').value;
const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    const phonePattern = /^0\d{9}$/;

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        event.preventDefault();
        return;
    }

    if (!phonePattern.test(contact)) {
        alert("Please enter a valid 10-digit contact number.");
        event.preventDefault();
        return;
    }

    const availabilities = document.querySelectorAll('.availabilityEntry');
    for (let i = 0; i < availabilities.length; i++) {
        const inputs = availabilities[i].querySelectorAll("input");
        let filled = Array.from(inputs).some(input => input.value.trim() !== "");
        let allFilled = Array.from(inputs).every(input => input.value.trim() !== "");
        if (filled && !allFilled) {
            alert("Please complete all fields in each availability entry or leave them all empty.");
            event.preventDefault();
            return;
        }
    }

});
});
