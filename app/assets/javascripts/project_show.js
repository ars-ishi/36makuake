$(function() {
    var num = $(".projectTtl").offset().top;
    $(window).scroll(function () {

        if( $(this).scrollTop() >= num){
            $("#scrollContent").fadeIn(150);

        } else if($(this).scrollTop() <= num){
            $("#scrollContent").fadeOut(150);
        }
    });
  });
