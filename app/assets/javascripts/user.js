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
  console.log('メール一致チェック');
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
  console.log('パスワード一致チェック');
  var pass = document.getElementById(path).value;
  var passConfirm = input.value;
  if (pass != passConfirm) {
    input.setCustomValidity('パスワードが一致しません');
  } else {
    input.setCustomValidity('');
  }
};

// 成功した場合のフラッシュメッセージをしばらくして消す
$(function() {
  $(".flash-message-notice").fadeOut(4000).queue(function() {
    this.remove();
  });
});
