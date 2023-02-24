import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  initialize() {
    this.config = {
      dateFormat: "l, F j, Y",
      inline: true,
      minDate: "today",
      disableMobile: "true",
    };
  }
}
