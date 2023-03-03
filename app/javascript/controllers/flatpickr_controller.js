import { Controller } from "@hotwired/stimulus"
// Import flatpickr function
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
export default class extends Controller {
  // retrieve the targets from the DOM
  static targets = [ 'bookingDateInput','startTimeInput', 'endTimeInput' ]
  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    console.log("i'm connected"),
    console.log((this.startTimeInputTarget)),
    console.log(typeof(this.endTimeInputTarget)),

    flatpickr(this.bookingDateInputTarget, {
      dateFormat: "Y-m-d"
}),

    flatpickr(this.startTimeInputTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true
}),
    flatpickr(this.endTimeInputTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true
    })

}

}
