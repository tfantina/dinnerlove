const navbarDrop = e => {
  e.preventDefault();
  console.log("wow");
  let navbar = document.getElementById("header-nav");
  navbar.className === "header-links"
    ? (navbar.className += "responsive")
    : (navbar.className = "header-links");
};

window.addEventListener("load", function() {
  let clicker = document.getElementById("menubox");
  clicker.addEventListener(
    "click",
    function() {
      navbarDrop(event);
    },
    false
  );
});
