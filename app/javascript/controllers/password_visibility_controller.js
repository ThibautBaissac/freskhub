import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-visibility"
export default class extends Controller {
  static targets = ["password", "toggle"]

  connect() {
    this.update()
  }

  toggle() {
    this.passwordTarget.type = this.passwordTarget.type === "password" ? "text" : "password"
    this.update()
  }

  update() {
    this.toggleTarget.querySelectorAll('svg').forEach((svg, index) => {
      svg.classList.toggle('hidden', this.passwordTarget.type === "password" ? index === 1 : index === 0)
    })
  }
}
