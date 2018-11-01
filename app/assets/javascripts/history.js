$(document).on('turbolinks:load', function(){
  if (window.location.href.match(/\/projects\/\d+$/)) {
    $(document).ready(function() {
      var projectId = location.pathname.replace('/projects/', '');
      var cookieName = 'RecentlyViewedProjects';
      var viewedProjects = [];
      var deleteProject = false;
      $.cookie.defaults.path = "/";
      // 既にクッキーが存在している場合は、ストリングを配列にする
      if ($.cookie(cookieName)) {
        viewedProjects = $.cookie(cookieName).split(",");
      }
      // 重複していたら先に入っていた要素を削除。その後projectIdを配列の最後に追加
      if ($.inArray(projectId, viewedProjects) > -1 ) {
        var arrayNum = $.inArray(projectId, viewedProjects);
        viewedProjects.splice(arrayNum, 1);
      }
      viewedProjects.push(projectId);
      // 4個以上ならば1つ削除する
      if ( viewedProjects.length > 4 ) {
        viewedProjects.shift();
      }
      // 配列をクッキ―に保存する
      $.cookie(cookieName, viewedProjects);
    });
  }
});
