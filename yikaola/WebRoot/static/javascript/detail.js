(function () {
  //功能：引入头文件
  $("<link rel='stylesheet' href='css/header.css'>").appendTo('head');
  $.ajax({
    url: "/sub/header2.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("header");
      $('<script src="js/header.js"></script>').appendTo('head');
    }
  });
  //功能：tabbar的自由切换
  var tabs = document.querySelectorAll('[data-toggle=tab]');
  for (var tab of tabs) {
    tab.onclick = function (e) {
      e.preventDefault();
      var tab = this;
      //console.log(tab);
      var divs = document.querySelectorAll('#my_button>div');
      for (var div of divs) {
        div.style.display = 'none';
      } //将所有的div的display属性变为none
      var id = tab.getAttribute('data-target'); //将对应的div的display的属性变为block
      document.querySelector(id).style.display = 'block';
    }
  }
  //功能结束
  //功能：放大镜
  var lgDiv = document.getElementById('div-lg');
  lgDiv.style.backgroundImage = "url(./img/pro_detail/magn3_1.jpg)";
  var LIWIDTH = 74;
  var $my_magn = $('#my_magn');
  var $prev = $my_magn.parent().prev();
  var $next = $my_magn.parent().next();
  var moved = 0;
  var $ul = $my_magn;
  $next.click(function () {
    var $next = $(this);
    if (!$next.is('.disabled')) {
      moved++;
      $ul.css('marginLeft', -LIWIDTH * moved);
      $prev.removeClass('disabled');
      if ($ul.children().length - 4 === moved) {
        $next.addClass('disabled');
      }
    }
  });
  $prev.click(function () {
    var $prev = $(this);
    if (!$prev.is('.disabled')) {
      moved--;
      $ul.css('marginLeft', -LIWIDTH * moved);
      $next.removeClass('disabled');
      if (moved === 0) {
        $prev.addClass('disabled');
      }
    }
  });
  //(2)实现鼠标放在图片上显示图片功能
  var $mask = $('#mask');
  var $mdImg = $mask.prev();
  var $lgDiv = $("#div-lg");
  $ul.on('mouseover', 'img', function () {
    var $img = $(this);
    var md = $img.attr('data-md');
    $mdImg.attr('src', md);
    $lgDiv.css('backgroundImage', `url(${$img.attr('data-lg')})`);
  });
  //(3)实现鼠标移动小方块功能
  var MSIZE = 150;
  var $smask = $('#super-mask');
  $smask.hover(function () {
    $mask.toggleClass('d-none');
    $lgDiv.toggleClass('d-none');
  }).mousemove(function (e) {
    var top = e.offsetY - MSIZE / 2;
    var left = e.offsetX - MSIZE / 2;
    if (top < 0) top = 0;
    else if (top > 200) top = 200;
    if (left < 0) left = 0;
    else if (left > 100) left = 100;
    $mask.css({
      top,
      left
    });
    $lgDiv.css('backgroundPosition', `-${5/3*left}px -${5/3*top}px`);
  });
  //功能结束
})();