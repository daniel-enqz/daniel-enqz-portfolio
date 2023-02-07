import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "thankYouAlert"]

  initialize() {
    this.thankYouAlertTarget.classList.remove("hidden")
  }

  close() {
    this.thankYouAlertTarget.classList.add("hidden")
  }
}
