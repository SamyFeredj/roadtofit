import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="commentaires"
export default class extends Controller {

  static targets= ["input"]

  connect() {
    console.log("hello");
  }

  submit(event) {
    setTimeout(() => console.log("test"), 250)
    this.inputTarget.value = ""
  }
}
