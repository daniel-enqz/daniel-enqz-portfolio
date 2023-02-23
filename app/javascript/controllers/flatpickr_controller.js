import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  static targets = [ "input" ]

  initialize() {
    this.config = {
      enableTime: true,
      dateFormat: "F j, Y at H:i K",
      inline: true,
      minDate: "today",
      defaultHour: 9,
      defaultMinute: 30,
      disableMobile: "true",
      onChange: this.onChange.bind(this)
    };
  }

  addSuccessClasses(field) {
    field.classList.add("bg-emerald-50");
    field.classList.add("border-emerald-300");
    field.classList.remove("bg-red-50");
    field.classList.remove("border-red-300");
  }

  addErrorClasses(field) {
    field.classList.add("bg-red-50");
    field.classList.add("border-red-300");
    field.classList.remove("bg-emerald-50");
    field.classList.remove("border-emerald-300");
  }

  onChange(selectedDates, dateStr, instance) {
    if (dateStr === "") {
      this.addErrorClasses(this.inputTarget);
    } else {
      this.addSuccessClasses(this.inputTarget);
    }
  }
}
