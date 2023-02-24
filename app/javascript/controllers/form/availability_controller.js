import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["dateField"]
  static values = {
    usedDays: Object,
    defaultDayHours: Array
  }

  validate(event) {
    const startTimeField = document.getElementById('start-time-field');
    const endTimeField = document.getElementById('end-time-field');
    const unavailableHours = this.getDayUnavailableHours(this.dateFieldTarget.value);;
    const availableTimes = this.defaultDayHoursValue.filter((hour) => !unavailableHours.includes(hour));
    const parsedAvailableTimes = availableTimes.map((hour) => {
      let hour_string = hour.toString()
      return hour_string.slice(0, hour_string.length - 2) + ":" + hour_string.slice(hour_string.length - 2)
    });
    startTimeField.innerHTML = parsedAvailableTimes.map((time) => `<option value="${time}">${time}</option>`).join("");
    endTimeField.innerHTML = parsedAvailableTimes.map((time) => `<option value="${time}">${time}</option>`).join("");
  }

  getDayUnavailableHours(date_string) {
    let date = new Date(date_string);
    let year = date.getFullYear();
    let month = ("0" + (date.getMonth() + 1)).slice(-2);
    let day = ("0" + date.getDate()).slice(-2);
    let dateFormatted = `${year}-${month}-${day}`;
    let unavailableHours = this.usedDaysValue[dateFormatted].flat();
    console.log(unavailableHours);
    return unavailableHours.map((hour) => {
      let timeString = hour.split("T")[1].split(":").slice(0, 2).join("");
      return parseInt(timeString);
    }).sort();
  }
}
