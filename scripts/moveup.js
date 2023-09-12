document.addEventListener("DOMContentLoaded", function () {
    // Get the button element
    var moveUpButton = document.querySelector(".move-up");

    // Initially hide the button
    moveUpButton.style.display = "none";

    // Add a click event listener to scroll to the top when the button is clicked
    moveUpButton.addEventListener("click", function () {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });

    // Check the scroll position and toggle the visibility of the button
    window.addEventListener("scroll", function () {
        // Adjust these values based on your design
        var scrollThreshold = window.innerHeight / 2; // Show button when scrolled within half of the viewport's height
        var scrollPosition = window.scrollY;

        if (scrollPosition >= scrollThreshold) {
            moveUpButton.style.display = "block";
        } else {
            moveUpButton.style.display = "none";
        }
    });
});