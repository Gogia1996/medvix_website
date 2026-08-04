import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.closeModal = this.closeModal.bind(this)
    window.addEventListener("close-modal", this.closeModal)
  }

  disconnect() {
    window.removeEventListener("close-modal", this.closeModal)
  }

  open() {
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    this.modalTarget.classList.add("hidden")
  }

  closeModal() {
    this.close()
  }
}
