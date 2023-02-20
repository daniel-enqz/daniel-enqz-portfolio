import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  initialize() {
     this.config = {
      enableTime: true,
      dateFormat: "F j, Y at H:i",
      inline: true,
      minDate: "today"
     };
   }
}
