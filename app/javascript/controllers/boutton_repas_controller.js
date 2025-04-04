import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="boutton-repas"
export default class extends Controller {

  static targets = ["petit", "dej", "diner", "dessert"]

  initialize() {
    this.REPAS = {
      "petitdej": "Petit-déjeuner",
      "dej": "Déjeuner",
      "diner": "Dîner",
      "dessert": "Dessert"
    }
  }

  filterMeal(event) {
    const recettes = document.querySelectorAll(".recettes-card");
    const filtres = document.querySelectorAll(".repas");

    if (event.currentTarget.classList.contains("active")) {
      recettes.forEach(recette => {
        recette.style.display = "block";
      })
      event.currentTarget.classList.remove("active");
    } else {
      // si y a un autre bouton activé
      filtres.forEach(filtre => {
        filtre.classList.remove("active");
      })
      // si il n'y a aucun bouton activé
      recettes.forEach(recette => {
        if (recette.dataset.repas !== this.REPAS[event.currentTarget.dataset.boutoninfo]) {
          recette.style.display = "none";
        } else {
          recette.style.display = "block";
        }
      });
      event.currentTarget.classList.add("active");
    }
  }
}
