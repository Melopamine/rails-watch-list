// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "bootstrap"
import "@popperjs/core"

document.addEventListener("DOMContentLoaded", function() {
  const starContainer = document.querySelector(".star-rating-container");
  const stars = starContainer.querySelectorAll(".fa-star");
  const ratingInput = document.getElementById("star-rating");

  stars.forEach(star => {
    star.addEventListener("click", function() {
      const value = this.dataset.value;
      ratingInput.value = value;

      stars.forEach((s, index) => {
        if (index < value) {
          s.classList.add("fa-solid");
        } else {
          s.classList.remove("fa-solid");
        }
      });
    });
  });
});
