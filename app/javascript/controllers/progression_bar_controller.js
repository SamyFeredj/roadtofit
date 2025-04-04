import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progression-bar"
export default class extends Controller {
  static targets = ["bar"]
  static values = {
    calories: Number
  }

  connect() {
    this.barTarget.style = `width: ${this.caloriesValue}%;`;
  }
}
