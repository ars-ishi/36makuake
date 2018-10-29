
// マイページのユーザー画像のプレビュー

$( document ).on('turbolinks:load', function() {

 function readURL(input) {

   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
       $('#upload_image').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $("#upload_1").change(function(){
   readURL(this);
 });
});

// プロフィール編集画面のユーザー画像サムネイル（36*36)のプレビュー

$( document ).on('turbolinks:load', function() {

 function readURL(input) {

   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
       $('.image_preview').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $(".filetInput").change(function(){
   readURL(this);
 });
});
