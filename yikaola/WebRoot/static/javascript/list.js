$(function () {
  //功能：引入头文件
  $("<link rel='stylesheet' href='css/header1.css'>").appendTo('head');
  $('<link rel="stylesheet" href="css/header0.css">').appendTo('head');
  $('<link rel="stylesheet" href="css/footer.css">').appendTo('head');
  $.ajax({
    url: "index_subsidiary/header1.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("header");
      $('<script src="js/header1.js"></script>').appendTo('head');
    }
  });
  $.ajax({
    url: "index_subsidiary/footer.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("footer");
    }
  })
})