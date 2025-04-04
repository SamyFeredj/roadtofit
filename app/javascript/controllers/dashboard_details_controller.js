import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-details"
export default class extends Controller {
  static targets = ["detailsIcon", "macros"]

  connect() {
  }

  toggleDetails(event) {
    if (this.detailsIconTarget.classList.contains("toggle-icon-tobottom")) {
      this.macrosTarget.classList.add = "display-details";
      console.log(this.macrosTarget);
      this.detailsIconTarget.classList.add("playRotateLeft");
      this.detailsIconTarget.style = "transform: rotate(180deg);";
      this.detailsIconTarget.classList.remove("toggle-icon-tobottom");
      this.detailsIconTarget.classList.remove("playRotateRight");
    } else {
      this.macrosTarget.classList.remove = "display-details";
      this.detailsIconTarget.classList.add("playRotateRight");
      this.detailsIconTarget.classList.remove("playRotateLeft");
      this.detailsIconTarget.style = "transform: rotate(0);";
      this.detailsIconTarget.classList.add("toggle-icon-tobottom");
    }

  }
}
