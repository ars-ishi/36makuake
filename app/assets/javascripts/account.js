// 登録フォーム・ログインフォームのモーダルウィンドウを表示
$(function() {
  $('.sign_in').modaal();
  $('.sign_up').modaal();
});

// 利用規約をポップアップで表示
function agreementWindow() {
  window.open("https://www.makuake.com/pages/term/",
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

// フラッシュメッセージを表示
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
