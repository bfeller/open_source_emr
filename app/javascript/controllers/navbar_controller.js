import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
      $(document).ready(function() {
        $('.select2').select2();
      });
    }
    toggle_sidebar() {
      $('#sidebar').toggleClass('active');
      $('#body').toggleClass('active');
    }

}