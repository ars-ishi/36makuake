$(document).on("turbolinks:load", function(){
  //追加するHTML雛形
  function buildHTML(adrs) {
    var html =
             `<div class=boxOrder>
                ${adrs.last_name + " " + adrs.first_name}<br/>
                ${adrs.postal_code}<br/>
                ${adrs.municipality + adrs.house_number}<br/>
                電話番号 ${" " + adrs.phone_number}
              </div>`
  return html;
  }
  //モーダルを開く関数
  $(".select_address").modaal();
  //選択中の住所を判定する機能
  $(".select_address").on("click", function(){
    var selected_id = $("#send_address_id").val();
    $("a#pointer").each(function(){
      if ( selected_id == $(this).data("id") ) {
        $(this).addClass("selectingAdrs");
        var before = $(this).text();
        var after  = before.replace("この住所を使う", "使用中");
        $(this).text(after);
      } else {
        $(this).removeClass("selectingAdrs");
        var before = $(this).text();
        var after  = before.replace("使用中", "この住所を使う");
        $(this).text(after);
      }
    });
  });
  //住所を選択して元のページの部分と入れ替える関数
  $(".btnSelector").on("click", function(){
    var searchId = $(this).data("id");
    var user     = $(this).data("user");
    $.ajax({
      type: "GET",
      url: "/users/:user_id/orders",
      data: { id: searchId },
      dataType: "json",
    })
    .done(function(address) {
      var adrs_id = address.id //Uglifierのエラー対策のため、バッククオートを使わない処理
      $("#sendAddressArea").empty();
      $("#send_address_id").val(adrs_id);
      var html = buildHTML(address);
      $("#sendAddressArea").append(html);
      $(".select_address").modaal("close");
    })
    .fail(function(){
      alert("住所の取得に失敗しました");
    })
  });
});
