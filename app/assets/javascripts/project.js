$(function() {
  $(document).ready(function () {
    //initialize swiper when document ready
          var swiper = new Swiper('.swiper-container', {
            speed: 400,
            loop: true,
            // autoplay: {
            //   delay: 7500,
            //   disableOnInteraction: false,
            // },
            pagination: {
              el: '.swiper-pagination',
              type: 'bullets',
              clickable: true,
            },
    });
  });
})


