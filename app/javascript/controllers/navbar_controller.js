import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
      console.log("Hello from Stimulus!")
    }
    toggle_sidebar() {
      $('#sidebar').toggleClass('active');
      $('#body').toggleClass('active');
    }

}