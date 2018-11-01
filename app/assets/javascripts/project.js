$(document).on('turbolinks:load', function() {
  $('.modal').modaal();
  //ヘッダーのマイページボックスの表示
  $(".link03After").on("click",function() {
    if ($("#myMenuBox").css("display") == "none") {
      $("#toolTipsPjt").css("display","none");
      $("#myMenuBox").css("display","block");
    } else {
      $("#myMenuBox").css("display","none");
    }
  });
  $(".header-bell-after").on("click",function() {
    if ($("#toolTipsPjt").css("display") == "none") {
      $("#myMenuBox").css("display","none");
      $("#toolTipsPjt").css("display","block");
    } else {
      $("#toolTipsPjt").css("display","none");
    }
  });
  $(document).click(function(event) {
    if(!$(event.target).closest('.header-bell-after').length) {
      $("#toolTipsPjt").css("display","none");
    }
  });
  $(document).click(function(event) {
    if(!$(event.target).closest('.link03After').length) {
      $("#myMenuBox").css("display","none");
    }
  });

  //page-topボタン
    var topBtn = $('#page-top_jq');
    topBtn.hide();
    $(window).scroll(function () {
      if ($(this).scrollTop() > 100) {
        topBtn.fadeIn();
        $(".tab_wrapper").addClass('tabNavigation_fixed');
      } else {
        topBtn.fadeOut();
        $(".tab_wrapper").removeClass('tabNavigation_fixed');
      }
    });
    topBtn.click(function () {
      $('body,  html').animate({
        scrollTop: 0
      }, 500);
      return false;
    });

  // スライダー
    function slideSwiper(index) {
    swiper.slideTo(index);
    }

    var thumb_1= $('.thumbnail_0').val();
    var thumb_2= $('.thumbnail_1').val();
    var thumb_3= $('.thumbnail_2').val();
    var thumb_4= $('.thumbnail_3').val();
    var thumb_5= $('.thumbnail_4').val();

    var swiper;
    var thumb = [
    thumb_1,
    thumb_2,
    thumb_3,
    thumb_4,
    thumb_5,
    'https://hayabusa.io/makuake/upload/hero/121/hero_thumb_121.png?format=png&ttl=31536000&version=1538378133&force&width=260&height=146&quality=95',
    'https://hayabusa.io/makuake/upload/hero/85/hero_thumb_85.jpg?format=jpg&ttl=31536000&version=1535624113&force&width=520&height=292&quality=95',
    'https://hayabusa.io/makuake/upload/hero/7/hero_thumb_7.png?format=png&ttl=31536000&version=1535624113&force&width=260&height=146&quality=95'
    ];


    swiper = new Swiper('.swiper-container', {
      speed: 400,
      loop: true,
      autoplay: {
        delay: 7500,
        disableOnInteraction: false
      },
      pagination: {
        bulletClass:'swiper-pagination-thumb',
        bulletActiveClass:'swiper-pagination-thumb-active',
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
        renderBullet: function (index, className) {
          return '<span class="' + className + '">' +'<img src="'+thumb[index]+'" alt="thumbnail_'+index+'" class="thumbnail-img">'+ '</span>';
        }
      }
    });
});

