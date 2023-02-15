import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "requestTab", "reviewTab", "tabButton" ]
  static classes = {
    reviewButton: "item-animate border-indigo-500 text-indigo-600",
    requestButton: "item-animate border-pink-500 text-pink-600",
    inactiveButton: "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300"
  }

  connect() {
  }

  toggleTab(button) {
    const identifier = button.target.id
    this.setTab(this[`${identifier}TabTarget`], button.target, identifier)
  }

  hideAllOtherTabs(identifier) {
    this.tabButtonTargets.forEach((tb) => {
      if (tb.id != identifier) {
        tb.classList.add(this.classes.inactiveButton)
        tb.classList.remove(this.classes[`${tb.id}Button`])
      }
    })
    this.targets.forEach((t) => {
      if (t != this[`${identifier}TabTarget`]) {
        t.classList.add("hidden")
      }
    })
  }

  setTab(tab, button, identifier) {
    tab.classList.remove("hidden")
    button.classList.remove(this.classes.inactiveButton)
    button.classList.add(this.classes[`${identifier}Button`])
  }
}
