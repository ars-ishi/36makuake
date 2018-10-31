$(document).on("turbolinks:load",function() {
  var counter = $(".nextBtn").data('id')
  if (counter == 0) {
    $(".nextBtn").modaal({
      content_source: "#send__address--alert"
    });
    return false
  } else {
    return true
  }
});

