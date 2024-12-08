import { Application } from "@hotwired/stimulus"
import 'bootstrap/dist/js/bootstrap.bundle.min';

const application = Application.start()
// console.log("JavaScript is working!");

document.addEventListener('DOMContentLoaded', function() {
  var openCartLink = document.getElementById('openCartLink');
  if (openCartLink) {
    openCartLink.addEventListener('click', function(event) {
      event.preventDefault(); // Prevent the default link behavior
      var myModal = new bootstrap.Modal(document.getElementById('cartModal'));
      myModal.show();
    });
  }
});
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


export { application }
