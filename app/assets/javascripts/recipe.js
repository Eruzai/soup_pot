document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.toggle-recipe').forEach(button => {
    button.addEventListener('click', function() {
      const recipeId = this.getAttribute('data-recipe-id');
      const recipeInfoDiv = document.getElementById(`recipe-info-${recipeId}`);
      recipeInfoDiv.classList.toggle('hidden');
    });
  });
});
