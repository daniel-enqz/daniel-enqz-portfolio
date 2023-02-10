import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "dropdown", "dropdownButton" ]

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden")
    this.dropdownButtonTarget.innerHTML = this.dropdownTarget.classList.contains("hidden") ? '<i class="fa-solid fa-bars"></i>' : '<i class="fa-solid fa-bars-staggered"></i>'
    this.dropdownButtonTarget.classList.toggle("animate-bounce")
  }
}
