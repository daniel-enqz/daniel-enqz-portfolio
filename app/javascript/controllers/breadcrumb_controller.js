import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "dropdown", "dropdownButton" ]

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden")
    this.dropdownButtonTarget.classList.toggle("animate-bounce")
  }
}
