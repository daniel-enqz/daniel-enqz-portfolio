import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "alert"]

  initialize() {
    this.alertTarget.classList.remove("hidden")
  }

  close() {
    this.alertTarget.classList.add("hidden")
  }
}
