import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  initialize() {
    //global options
     this.config = {
      enableTime: true,
      time_24hr: true,
      dateFormat: "l, F j at h:i K",
      inline: true,
      minDate: "today"
     };
   }
}
