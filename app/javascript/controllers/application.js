import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

document.addEventListener("DOMContentLoaded", () => {
    const flashMessages = document.querySelectorAll(".flash-message");
    flashMessages.forEach((message) => {
      setTimeout(() => {
        message.style.transition = "opacity 0.5s ease-out";
        message.style.opacity = "0";
        setTimeout(() => {
          message.remove();
        }, 500); // Allow time for the fade-out effect to complete
      }, 3000); // 3-second delay before starting fade-out
    });
  });

export { application }
