$(function(){
  var url = location.href ;
  if ( url.match(/\?/) ) {
    var new_url = url.replace(/\?.*$/,"");
    window.history.replaceState(null, null, new_url);
  }
})
