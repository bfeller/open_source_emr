import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    $(document).ready(function() {
      console.log("things");
      const dp = new DayPilot.Calendar("dp", {
        viewType: "Resources",
        columns: [
          {id: 1, name: "Person 1"},
          {id: 2, name: "Person 2"},
          {id: 3, name: "Person 3"}
        ]
      });
      dp.init();
    });
  }
}
