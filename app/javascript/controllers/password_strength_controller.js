import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-strength"
export default class extends Controller {
  static targets = ["password", "feedback"]

  connect() {
    this.updateFeedback = this.updateFeedback.bind(this)
    this.passwordTarget.addEventListener('input', this.updateFeedback)
  }

  disconnect() {
    this.passwordTarget.removeEventListener('input', this.updateFeedback)
  }

  updateFeedback() {
    const password = this.passwordTarget.value
    const feedbackElements = this.feedbackTargets

    const validations = [
      { regex: /.{12,}/, element: feedbackElements[0] }, // at least 12 chars
      { regex: /\d/, element: feedbackElements[1] }, // at least 1 digit
      { regex: /[a-z]/, element: feedbackElements[2] }, // at least 1 downcase letter
      { regex: /[A-Z]/, element: feedbackElements[3] }, // at least 1 uppercase letter
      { regex: /[@:,\-?*_()!#$%^&+=]/, element: feedbackElements[4] } // at least 1 special char
    ]

    validations.forEach(validation => {
      if (validation.regex.test(password)) {
        validation.element.classList.remove('text-red-800')
        validation.element.classList.add('text-green-800')
      } else {
        validation.element.classList.remove('text-green-800')
        validation.element.classList.add('text-red-800')
      }
    })
  }
}
