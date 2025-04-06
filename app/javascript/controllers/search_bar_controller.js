import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["input", "clearButton"]

  connect() {
    console.log("hello c connecte")
    this.toggleClearButton();
  }

  toggleClearButton() {
    if (this.inputTarget.value) {
      this.clearButtonTarget.style.display = "inline";
    } else {
      this.clearButtonTarget.style.display = "none";
    }
  }

  clearInput() {
    this.inputTarget.value = "";
    this.toggleClearButton();

    const urlWithoutQuery = window.location.pathname;
    window.location.href = urlWithoutQuery;
  }

  inputChanged() {
    this.toggleClearButton();
  }
}
