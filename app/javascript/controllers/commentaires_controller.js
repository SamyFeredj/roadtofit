import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="commentaires"
export default class extends Controller {

  static targets= ["input"]

  connect() {
  }

  submit(event) {
    if (event.detail.success) {
      this.inputTarget.value = ""
    }
  }
}
