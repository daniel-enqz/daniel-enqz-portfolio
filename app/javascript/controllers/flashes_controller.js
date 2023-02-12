import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "flashContainer"]

  // initialize() {
  //   this.alertTarget.classList.remove("hidden")
  // }

  close() {
    this.flashContainerTarget.classList.add("hidden")
  }
}
