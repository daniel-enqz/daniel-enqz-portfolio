import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "dropdown", "dropdownButton" ]

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden")
    this.dropdownButtonTarget.innerHTML = this.dropdownTarget.classList.contains("hidden") ? 'toggle' : 'untoggle'
    this.dropdownButtonTarget.classList.toggle("animate-bounce")
  }
}
