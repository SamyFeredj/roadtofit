import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-dropdown"
export default class extends Controller {
  static targets = ["dropdown", "dropdownArrow"]
  connect() {
  }

  toggleDropdown (event) {
    if (this.dropdownArrowTarget.classList.contains("toggle-icon-toleft")) {
      this.dropdownTarget.style = "transform: translate(0);";
      this.dropdownArrowTarget.classList.add("playRotateLeft");
      this.dropdownArrowTarget.style = "transform: rotate(180deg);";
      this.dropdownArrowTarget.classList.remove("toggle-icon-toleft");
      this.dropdownArrowTarget.classList.remove("playRotateRight");
    } else {
      this.dropdownTarget.style = "transform: translate(-66);";
      this.dropdownArrowTarget.classList.add("playRotateRight");
      this.dropdownArrowTarget.style = "transform: rotate(0);";
      this.dropdownArrowTarget.classList.remove("playRotateLeft");
      this.dropdownArrowTarget.classList.add("toggle-icon-toleft");
    }
  }
}
