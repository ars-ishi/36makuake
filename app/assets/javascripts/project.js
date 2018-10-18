$(function() {

  $(".link03After").on("click",function(){
   if($("#myMenuBox").css("display") == "none"){
    $("#toolTipsPjt").css("display","none");
    $("#myMenuBox").css("display","block");
    console.log("1")
   } else{
    $("#myMenuBox").css("display","none");
    console.log("2")
   }
  })


    $(".header-bell-after").on("click",function(){
   if($("#toolTipsPjt").css("display") == "none"){
    $("#myMenuBox").css("display","none");
    $("#toolTipsPjt").css("display","block");
    console.log("1")
   } else{
    $("#toolTipsPjt").css("display","none");
    console.log("2")
   }
  })


  // スライダー
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


