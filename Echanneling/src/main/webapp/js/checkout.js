
document.addEventListener("DOMContentLoaded", function () {
    // Example: Show a confirmation message when a user clicks any submit_btn
    const buttons = document.querySelectorAll(".submit_btn");
    buttons.forEach(function (btn) {
        btn.addEventListener("click", function (event) {
            const confirmAction = confirm("Are you sure you want to proceed?");
            if (!confirmAction) {
                event.preventDefault(); // Cancel navigation if user clicks 'Cancel'
            }
        });
    });

    // Example: Alert if a status message is in a hidden input or div (optional use)
    const statusDiv = document.getElementById("status-message");
    if (statusDiv && statusDiv.textContent.trim() !== "") {
        setTimeout(function () {
            alert(statusDiv.textContent.trim());
        }, 1000);
    }
});
