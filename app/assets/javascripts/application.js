// Add this script to your page or application.js
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".toggle-button").forEach(function(button) {
      button.addEventListener("click", function() {
        const hiddenField = button.nextElementSibling;
        const currentStatus = hiddenField.value;
        hiddenField.value = currentStatus === "1" ? "0" : "1"; // Toggle the value
        button.classList.toggle("public");
        button.classList.toggle("private");
        statusText.innerText = currentStatus === "1" ? "Private" : "Public"; // Toggle the text
      });
    });
  });
