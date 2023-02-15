import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // Steps to add a new tab:
  // 1. Add the button with its id and data-tabs-target="tabButton" in _tabs.html.erb
  // 2. Add the tab with its id and data-tabs-target="exampleTab" in home.html.erb (remember to include all the config)
  // 3. Add the tab to the targets array
  // 4. Add the design of the button to the buttonClass object

  static targets = [ "requestTab", "reviewTab", "tabButton" ]
  connect() {
    this.buttonClass = {
      reviewButton: ["border-indigo-500", "text-indigo-600"],
      requestButton: ["border-pink-500", "text-pink-600"],
      inactiveButton: ["border-transparent", "text-gray-500", "hover:text-gray-700", "hover:border-gray-300"]
    }
  }

  toggleTab(button) {
    // to acces the data-tabs-target, you need to use:
    const identifier = button.target.id
    this.setTab(this[`${identifier}TabTarget`], button.target, identifier)
    this.hideAllOtherTabs(identifier)
  }

  setTab(tab, button, identifier) {
    tab.classList.remove("hidden")
    tab.classList.add("item-animate")
    button.classList.add(...this.buttonClass[`${identifier}Button`])
    button.classList.remove(...this.buttonClass["inactiveButton"])
  }

  hideAllOtherTabs(identifier) {
    this.tabButtonTargets.forEach((tb) => {
      if (tb.id != identifier) {
        tb.classList.add(...this.buttonClass["inactiveButton"])
        tb.classList.remove(...this.buttonClass[`${tb.id}Button`])
        this[`${tb.id}TabTarget`].classList.add("hidden")
      }
    })
  }
}
