document.addEventListener("DOMContentLoaded", function() {
  const form = document.querySelector('form'); // Sélectionner le formulaire
  const input = document.querySelector('input[type="text"]'); // Sélectionner le champ de recherche

  if (form && input) {
    // Écouter l'événement de soumission du formulaire
    form.addEventListener('submit', function() {
      // Vide le champ après la soumission
      input.value = '';
    });

    // Écouter l'événement de la touche Entrée
    input.addEventListener('keypress', function(e) {
      if (e.key === 'Enter') {
        // Ici tu peux manipuler l'input avant ou après la soumission si nécessaire
        form.submit(); // S'assurer que le formulaire est bien soumis
      }
    });
  }
});
