$(function() {



  //ヘッダーのマイページボックスの表示
  $(".link03After").on("click",function(){
   if($("#myMenuBox").css("display") == "none"){
    $("#toolTipsPjt").css("display","none");
    $("#myMenuBox").css("display","block");
   } else{
    $("#myMenuBox").css("display","none");
   }
  })
    $(".header-bell-after").on("click",function(){
   if($("#toolTipsPjt").css("display") == "none"){
    $("#myMenuBox").css("display","none");
    $("#toolTipsPjt").css("display","block");
   } else{
    $("#toolTipsPjt").css("display","none");
   }
  })
  $("#wrapper").on("click",function(){
    $("#toolTipsPjt").css("display","none");
    $("#myMenuBox").css("display","none");
  })


  //page-topボタン
$(function() {
    var topBtn = $('#page-top_jq');
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
        //ボタンの表示方法
            topBtn.fadeIn();
            $(".tab_wrapper").addClass('tabNavigation_fixed');
        } else {
        //ボタンの非表示方法
            topBtn.fadeOut();
            $(".tab_wrapper").removeClass('tabNavigation_fixed');
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('body,  html').animate({
            scrollTop: 0
        },   500);
        return false;
    });
});

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


  // スライダー
  $(document).ready(function () {
    //initialize swiper when document ready
          var swiper = new Swiper('.swiper-container', {
            speed: 400,
            loop: true,
            autoplay: {
              delay: 7500,
              disableOnInteraction: false,
            },
            pagination: {
              el: '.swiper-pagination',
              type: 'bullets',
              clickable: true,
            },
    });
  });



});



