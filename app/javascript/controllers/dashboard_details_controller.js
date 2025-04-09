import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-details"
export default class extends Controller {
  static targets = ["detailsIcon", "macros", "infosIcon", "infos"]

  connect() {
  }

  toggleDetails(event) {
    if (this.detailsIconTarget.classList.contains("toggle-icon-tobottom")) {
      // display
      this.macrosTarget.classList.toggle("display-details");
      // animation svg
      this.detailsIconTarget.classList.add("playRotateLeft");
      this.detailsIconTarget.style = "transform: rotate(180deg);";
      this.detailsIconTarget.classList.remove("toggle-icon-tobottom");
      this.detailsIconTarget.classList.remove("playRotateRight");
    } else {
      // display
      this.macrosTarget.classList.toggle("display-details");
      // animation svg
      this.detailsIconTarget.classList.add("playRotateRight");
      this.detailsIconTarget.classList.remove("playRotateLeft");
      this.detailsIconTarget.style = "transform: rotate(0);";
      this.detailsIconTarget.classList.add("toggle-icon-tobottom");
    }
  }

  toggleInfos(event) {
    if (this.infosIconTarget.classList.contains("toggle-icon-tobottom")) {
      // display
      this.infosTarget.classList.toggle("display-details");
      // animation svg
      this.infosIconTarget.classList.add("playRotateLeft");
      this.infosIconTarget.style = "transform: rotate(180deg);";
      this.infosIconTarget.classList.remove("toggle-icon-tobottom");
      this.infosIconTarget.classList.remove("playRotateRight");
    } else {
      // display
      this.infosTarget.classList.toggle("display-details");
      // animation svg
      this.infosIconTarget.classList.add("playRotateRight");
      this.infosIconTarget.classList.remove("playRotateLeft");
      this.infosIconTarget.style = "transform: rotate(0);";
      this.infosIconTarget.classList.add("toggle-icon-tobottom");
    }
  }
}
