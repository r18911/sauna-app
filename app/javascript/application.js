// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery3
//= require popper
//= require bootstrap-sprockets
import "@hotwired/turbo-rails"
import "controllers"
import "card"
import "menu"

document.addEventListener("turbo:load", function () {
  const pageTopBtn = document.querySelector(".page-top");

  pageTopBtn.addEventListener("click", function (event) {
    event.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  });
});


document.addEventListener("turbo:load", function () {
  var carouselElement = document.querySelector("#carouselExampleFade");
  if (carouselElement) {
    var carousel = new bootstrap.Carousel(carouselElement, {
      interval: 8000,
      ride: "carousel",
      pause: false,
    });
  }
});