import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  initialize() {
     this.config = {
      enableTime: true,
      dateFormat: "F j, Y at H:i K",
      inline: true,
      minDate: "today",
      defaultHour: 9,
      defaultMinute: 30,
      disableMobile: "true",
    };
   }
}
