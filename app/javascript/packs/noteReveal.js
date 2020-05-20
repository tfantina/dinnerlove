const toggleNote = () => {
  let notes = document.getElementById("show-content");
  let card = document.getElementById("dinner-card");
  let span = document.getElementById("chevron-state");
  if (notes.classList.contains("reveal")) {
    notes.classList.remove("reveal");
    card.classList.remove("reveal");
    span.classList.remove("reveal");
  } else {
    notes.classList.add("reveal");
    card.classList.add("reveal");
    span.classList.add("reveal");
  }
};

window.addEventListener("load", function() {
  let toggle = document.getElementById("note-toggle");
  toggle.addEventListener(
    "click",
    function() {
      toggleNote();
    },
    false
  );
});
