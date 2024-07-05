document.addEventListener('turbolinks:load', () => {
  const toggleButton = document.getElementById('toggle-items');
  const itemsList = document.getElementById('items-list');
  const fridgeMessage = document.getElementById('fridge-message');

  if (toggleButton && itemsList) {
    toggleButton.addEventListener('click', () => {
      itemsList.classList.toggle('hidden');
      fridgeMessage.classList.toggle('hidden');
      toggleButton.textContent = itemsList.classList.contains('hidden') ? 'Open Fridge' : 'Close Fridge';
    });
  }
});