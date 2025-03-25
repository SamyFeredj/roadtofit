import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modal = new Modal(this.modalTarget)
  }

  open() {
    this.modal.show()
  }

  close() {
    this.modal.hide()
  }
}
