import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  initialize() {
    //global options
     this.config = {
      altInput: true,
      altFormat: "F j at h:i K",
      altInputClass: "invisible",
      enableTime: true,
      dateFormat: "F j, Y",
      inline: true,
      minDate: "today"
     };
   }
}
