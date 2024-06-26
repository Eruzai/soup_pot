document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.getElementById('toggle-items');
  const itemsList = document.getElementById('items-list');

  if (toggleButton && itemsList) {
    toggleButton.addEventListener('click', () => {
      itemsList.classList.toggle('hidden');
      toggleButton.textContent = itemsList.classList.contains('hidden') ? 'Open Fridge' : 'Close Fridge';
    });
  }
});