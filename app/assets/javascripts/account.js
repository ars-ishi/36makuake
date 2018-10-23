$(document).on('turbolinks:load', function(){
  // 登録フォーム・ログインフォームのモーダルウィンドウを表示
  $('.sign_in').modaal();
  $('.sign_up').modaal();
  // モーダルが表示されている状態で新しいモーダルを開くとき古いモーダルを閉じる
  function modaalClose(btn, modal) {
    $(btn).on('click', function() {
      $(modal).modaal('close');
    });
  };
  modaalClose('.close_sign_in', '.sign_in');
  modaalClose('.close_sign_up', '.sign_up');
});
// 利用規約をポップアップで表示
function agreementWindow() {
  window.open("/pages/term",
  "agreementWindow",
  "width = 800, height = 800");
}
// メールが確認欄と一致しているかチェックする
function mailValidates(input, path) {
  var mail = document.getElementById(path).value;
  var mailConfirm = input.value;
  if (mail != mailConfirm) {
    input.setCustomValidity('メールアドレスが一致しません');
  } else {
    input.setCustomValidity('');
  }
};
// パスワードが確認欄と一致しているかチェックする
function passValidates(input, path) {
  var pass = document.getElementById(path).value;
  var passConfirm = input.value;
  if (pass != passConfirm) {
    input.setCustomValidity('パスワードが一致しません');
  } else {
    input.setCustomValidity('');
  }
};
// ログインログアウト時にフラッシュメッセージを表示
$(function() {
    $(".modal_login").css('transform', 'translateY(66px)');
    $(".modal_login").delay(1000).queue(function() {
      $(this).css('transform', 'translateY(0px)');
    });
  });
// SNS認証で必要なダミーメールアドレスをリセット
$(function() {
  if (window.location.href.match(/\/users\/\d+\/edit_omniauth/)) {
    $(document).ready(function(){
      $('#omniauth_edit_email').val('');
      $('#omniauth_edit_email_confirm').val('');
    });
  }
});
// メールが正規表現かチェックして、okだったらメールがすでに登録済みでないかチェックする。
function mailFormatValidates(id) {
  var email = document.getElementById(id);
  var emailVal = email.value;
  var format = /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/;
  if (format.test(emailVal)) {
    $.ajax({
      type: 'GET',
      url: '/users',
      dataType: 'json'
    })
    .done(function(user_emails) {
      if ( user_emails.indexOf(emailVal) > 0 ) {
        email.setCustomValidity('使用できないメールアドレスです');
      }
      else {
        email.setCustomValidity('');
      }
    })
    .fail(function() {
      alert('通信環境のよいところで再度お試しください');
    })
  } else {
    email.setCustomValidity('メールアドレスの形式が正しくありません');
  }
};
// パスワードが正規表現かチェック
function passFormatValidates(id) {
  var pass = document.getElementById(id);
  var passVal = pass.value;
  var format = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;
  if (format.test(passVal)) {
    pass.setCustomValidity('');
  } else {
    pass.setCustomValidity('6文字以上で半角英数字をそれぞれ1種類以上含めてください');
  }
};
