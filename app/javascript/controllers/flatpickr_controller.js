import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  connect() {
    this.config = {
      altInput: true,
      enableTime: true,
      time_24hr: true,
      dateFormat: "Y-m-d H:i",
      inline: true,
      altInputClass: "invisible",
      minDate: "today"
    };

    super.connect();
  }
}
