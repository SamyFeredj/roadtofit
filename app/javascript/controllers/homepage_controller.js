import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {

  static targets = ["image"];

  connect() {
    this.observeImageVisibility();
  }

  observeImageVisibility() {
    const observer = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.intersectionRatio > 0) {
          this.imageTarget.classList.add('visible');
          this.imageTarget.classList.add('slide-in-ratatouille');
          observer.disconnect;
        }
      });
    }, { threshold: 0.5 });

    observer.observe(this.imageTarget);
  }
}
