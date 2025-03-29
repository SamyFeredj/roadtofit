import { Controller } from "@hotwired/stimulus";
import { Carousel } from "bootstrap"; // Import Bootstrap's Carousel class

// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
    console.log("coucou");

    this.carousel = new Carousel(this.element.querySelector('.carousel'), {
      touch: true, // Enable touch swiping
      ride: 'carousel' // Optional, auto-start the carousel
    });
  }


}
