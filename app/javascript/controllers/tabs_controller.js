import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "requestTab", "reviewTab", "requestButton", "reviewButton"]

  connect() {
  }

  toggleRequestTab() {
    this.requestTabTarget.classList.remove("hidden")
    this.reviewTabTarget.classList.add("hidden")
    this.requestButtonTarget.classList.add("border-pink-500", "text-pink-600")
    this.requestButtonTarget.classList.remove("border-transparent", "text-gray-500", "hover:text-gray-700", "hover:border-gray-300")
    this.reviewButtonTarget.classList.add("border-transparent", "text-gray-500", "hover:text-gray-700", "hover:border-gray-300")
    this.reviewButtonTarget.classList.remove("border-indigo-500", "text-indigo-600")
  }

  toggleReviewTab() {
    this.requestTabTarget.classList.add("hidden")
    this.reviewTabTarget.classList.remove("hidden")
    this.reviewButtonTarget.classList.add("border-indigo-500", "text-indigo-600")
    this.reviewButtonTarget.classList.remove("border-transparent", "text-gray-500", "hover:text-gray-700", "hover:border-gray-300")
    this.requestButtonTarget.classList.add("border-transparent", "text-gray-500", "hover:text-gray-700", "hover:border-gray-300")
    this.requestButtonTarget.classList.remove("border-pink-500", "text-pink-600")
  }
}
