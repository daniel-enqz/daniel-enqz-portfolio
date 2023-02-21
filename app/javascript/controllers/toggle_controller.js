import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "button", "span", "cross", "check" ]

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

  browserSupportsGeolocation() {
    return 'geolocation' in navigator;
  }

  buttonIsActivated() {
    return this.buttonTarget.classList.contains("bg-teal-300")
  }

  getUserLocation() {
    if (!this.browserSupportsGeolocation() || this.buttonIsActivated()) { this.deactivateButton(); return; }

    navigator.geolocation.getCurrentPosition((position) => {
      const { latitude, longitude } = position.coords;
      console.log(`User's location: ${latitude}, ${longitude}`);

      // Get the user's timezone offset in minutes
      const timezoneOffset = new Date().getTimezoneOffset();
      console.log(`User's timezone offset: ${timezoneOffset} minutes`);

      // Adjust the timestamp of the user's request by their timezone offset
      const timestamp = new Date(Date.now() - (timezoneOffset * 60 * 1000));
      console.log(`User's local timestamp: ${timestamp}`);

      this.activateButton()
    }, (error) => {
      console.error(`Error getting user's location: ${error.message}`);
      this.deactivateButton()
    });
  }
}
