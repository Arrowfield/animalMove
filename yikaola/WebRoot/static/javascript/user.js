(function () {
  //功能：引入头文件
  $("<link rel='stylesheet' href='css/header.css'>").appendTo('head');
  $('<link rel="stylesheet" href="css/footer.css">').appendTo('head');
  $.ajax({
    url: "/sub/header1.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("header");
      $('<script src="js/header.js"></script>').appendTo('head');
    }
  });
  $.ajax({
    url: "/sub/footer.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("footer");
    }
  })
  //功能：模拟bootstrap手风琴效果
  $('#my_bar>ul>li>a').click(function (e) {
    e.preventDefault();
    $a = $(this);
    $a.next().toggleClass("in")
      .parent()
      .siblings()
      .children("ul")
      .removeClass('in');
  })
})();