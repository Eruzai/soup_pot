document.addEventListener("turbolinks:load", function() {
  window.showNextField = function(nextFieldId) {
    const nextField = document.getElementById(nextFieldId);
    if (nextField) {
      nextField.classList.remove('hidden');
    }
  }
});