import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "button", "span", "cross", "check", "timeFeedback", "timezoneValue" ]

  activateButton() {
    this.buttonTarget.classList.add("bg-teal-300")
    this.spanTarget.classList.add("translate-x-5")
    this.buttonTarget.classList.remove("bg-gray-200")
    this.spanTarget.classList.remove("translate-x-0")
    this.crossTarget.classList.add("hidden")
    this.checkTarget.classList.remove("hidden")
  }

  deactivateButton() {
    this.buttonTarget.classList.remove("bg-teal-300")
    this.spanTarget.classList.remove("translate-x-5")
    this.buttonTarget.classList.add("bg-gray-200")
    this.spanTarget.classList.add("translate-x-0")
    this.crossTarget.classList.remove("hidden")
    this.checkTarget.classList.add("hidden")
  }

  displayTimeFeedback(time_zone = "CST") {
    this.timeFeedbackTarget.innerHTML = `Let's Schedule! (${time_zone}) 📅`
    this.timezoneValueTarget.value = time_zone
  }

  browserSupportsGeolocation() {
    return 'geolocation' in navigator;
  }

  buttonIsActivated() {
    return this.buttonTarget.classList.contains("bg-teal-300")
  }

  getUserLocation() {
    if (!this.browserSupportsGeolocation() || this.buttonIsActivated()) { this.displayTimeFeedback(); this.deactivateButton(); return; }

    navigator.geolocation.getCurrentPosition((position) => {
      // const { latitude, longitude } = position.coords;
      const time_zone = Intl.DateTimeFormat().resolvedOptions().timeZone;

      this.activateButton()
      this.displayTimeFeedback(time_zone)
    }, (error) => {
      console.error(`Error getting user's location: ${error.message}`);
      this.deactivateButton()
      this.displayTimeFeedback()
    });
  }
}
