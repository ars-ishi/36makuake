$(document).on('turbolinks:load', function(){
  if (window.location.href.match(/\/projects\/\d+/)) {
    $(document).on("click", '.iframeBase', function() {
      $('.tabNavigation_fixed').css('z-index', '200');
    });
    $('.iframeBase').modaal();
    $(document).on("click", '.modaal-close', function() {
      $('.tabNavigation_fixed').css('z-index', '6000');
    });
  }
});
