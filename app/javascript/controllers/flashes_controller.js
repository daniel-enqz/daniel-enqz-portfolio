import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "flashContainer"]

  close() {
    this.flashContainerTarget.classList.add("hidden")
  }
}
