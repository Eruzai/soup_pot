document.addEventListener('DOMContentLoaded', function() {
  const dropdown = document.getElementById('ingredient-dropdown');
  const textField = document.getElementById('ingredient-text-field');

    dropdown.addEventListener('change', function() {
      textField.value = dropdown.value;
    });

});
