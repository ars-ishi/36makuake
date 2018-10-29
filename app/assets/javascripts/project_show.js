$(document).on('turbolinks:load', function() {
$(function() {

  $(".movieThumb").on("click",function(){
    $(".image_area").html(`
      <div id="btn-playBase"><div class="r5" id="btn-play">▶&nbsp;再生</div></div>
      <img alt="" class="video-image" height="388" src="" style="object-fit:cover;" width="690">`)
    var image = $(this).attr("src")
    $(".image_area").show()
    $(".video-image").attr({src:image})
    $("iframe").remove()
  })

  $(".imageThumb").on("click",function(){
    $(".image_area").html(`<img alt="" class="main-image" height="388" src="" style="object-fit:contain;" width="690">`)
    var image = $(this).attr("src")
    $(".image_area").show()
    $(".main-image").attr({src:image})
    $("iframe").remove()
  })


  $(document).on("click","#btn-playBase",function(){
    var id = $(".youtube").attr("id")
    $(".image_area").hide()
    $(".video_area").html(`<iframe width="690" height="388" src="https://www.youtube.com/embed/${id}?rel=0&autoplay=1" frameborder="0" allowfullscreen class="movieMoveBase"></iframe>`)
  })


    $(document).ready(function(){
        $(window).scroll(function () {
            if ( ($(this).scrollTop() > 540) && ($(".movieMoveBase").length) && ($(".movieReturn").length) ) {
                $(".movieMoveBase").addClass('movieMove');   //iframeを移動させる
                $(".movieReturn").show(100);  //しまうボタンを出す
            } else if($(this).scrollTop() < 500 && $(".movieMoveBase").length ) {
                $(".movieMoveBase").removeClass('movieMove');  // iframeを戻す
                $(".movieReturn").hide();  //しまうボタンを消す
            }
        });
            //しまうボタンを押したらこの要素自体を消去するので二度ともどれません　上のif判定で.movireRturnがある時のみ映像が左下にくるようになっています
        $(".movieReturn").click(function(){
            $(this).remove();
            $(".movieMoveBase").removeClass('movieMove');
        });
    });

  });
});
