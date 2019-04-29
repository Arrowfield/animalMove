(function () {
  $("<link rel='stylesheet' href='css/header.css'>").appendTo('head');
  $.ajax({
    url: "/sub/header2.html",
    type: "GET",
    success: function (res) {
      $(res).replaceAll("#header");
      $('<script src="js/header.js"></script>').appendTo('head');
    }
  });
  //功能:用户单击加入购物车就可以实现总价的计算
  $('table').on('click', 'BUTTON', function () {
    $button = $(this);
    //修改商品个数
    $input = $button.parent().children('input');
    var i = parseInt($input.val());
    if ($button.html().trim() === '+') {
      i++;
    } else if ($button.html().trim() === '-') {
      if (i > 1) i--;
    }
    $input.val(i);
    //修改商品小计
    $price = $button.parent().prev().children(':nth-child(2)');
    $sub = $button.parent().next();
    $sub.html(`${($price.html()*i).toFixed(2)}`);
    //修改商品总价
    var total = 0;
    tds = $('table>tbody>tr>td.h5');
    for (var td of tds) {
      total += parseFloat($(td).html());
    }
    //console.log(total);
    $('table').next().children(":nth-child(8)").html(`￥${total.toFixed(2)}`);
  });
  //功能结束
})();