import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="boutton-repas"
export default class extends Controller {

  static targets = ["petit", "dej", "diner", "dessert"]

  changepetitdej() {
    this.petitTarget.classList.add("active")
    this.dejTarget.classList.remove("active")
    this.dinerTarget.classList.remove("active")
    this.dessertTarget.classList.remove("active")
  }
  changedej() {
    this.dejTarget.classList.add("active")
    this.petitTarget.classList.remove("active")
    this.dinerTarget.classList.remove("active")
    this.dessertTarget.classList.remove("active")
  }
  changediner() {
    this.dinerTarget.classList.add("active")
    this.dejTarget.classList.remove("active")
    this.petitTarget.classList.remove("active")
    this.dessertTarget.classList.remove("active")
  }
  changedessert() {
    this.dessertTarget.classList.add("active")
    this.dejTarget.classList.remove("active")
    this.dinerTarget.classList.remove("active")
    this.petitTarget.classList.remove("active")
  }

  petitdej(event) {
    console.log("coucou");
    const recettes = document.querySelectorAll(".recettes-card");

    if (this.petitTarget.classList.contains("active")) {
      // retirer la classe active
    } else {
      recettes.forEach(recette => {
        if (recette.dataset.repas !== "Petit-déjeuner") {
          console.log(recette.dataset.repas)
          recette.style.display = "none";
        }
      });
      this.petitTarget.classList.add("active")
    }
    this.dejTarget.classList.remove("active")
    this.dinerTarget.classList.remove("active")
    this.dessertTarget.classList.remove("active")
  }
}
