import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.timeout = setTimeout(() => {
      this.close()
    }, 4000)
  }

  close() {
    this.element.classList.add(
      "opacity-0",
      "translate-y-2",
      "pointer-events-none"
    )

    setTimeout(() => {
      this.element.remove()
    }, 500)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
