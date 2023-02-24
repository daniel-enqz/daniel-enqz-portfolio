import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "validField", "flashContainer", "startTimeField", "endTimeField", "dateField" ]

  static values = {
    unavailableTimes: Array,
  }

  validate(event) {
    console.log("user Selected date with value: " + this.dateFieldTarget.value);
    console.log(this.unavailableTimesValue);
  }
}
