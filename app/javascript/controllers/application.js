import { Application } from "@hotwired/stimulus"


const application = Application.start()
document.addEventListener('turbo:click', function(event) {
  const link = event.target.closest('a[data-method="delete"]');
  if (link) {
    event.preventDefault();
    Rails.fire(link, 'click');
  }
});
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


export { application }
