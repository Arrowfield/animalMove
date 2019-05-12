(function () {
	
	$.ajax({
		url:"CartMessage",
		type:"get",
		dataType:"json",
		success:function(res){
			console.log(res)
			if(res.code == 200){
				
				$(".SumNum").html(res.data.length);
				
				var html = "";
				
				for(var i=0;i<res.data.length;i++){
					
					var arr = res.data[i];
					
					html += `
					
					<tr>
						<td><input type="checkbox" class="my_input"></td>
						<td>
							<div class="CartAddFlex">
								<div>
									<img src="./static/img/index/02.webp" alt="" class="my_img">
									<p>减价5.81元</p>
								</div>
								<p class='ml-2 text-left'>${arr[3]}</p>
							</div>
						</td>
						<td>
						<span>
							颜色：${arr[8] == 1?'红':arr[8] == 2?'绿':arr[8] == 3?'黄':'蓝'}
						</span>
							<p>尺码：${arr[9]}</p></td>
						<td><i class="CartLine">58.16</i>
							<p class="mb-1 text-muted">${arr[5]}</p>
							<p class="text-danger mt-0">拼团价</p></td>
						<td>
						<div class='d-flex align-items-center'>
							<button class="my_btn">-</button> <input type="text"
							class="my_input1" value=${arr[4]}>
							<button class="my_btn">+</button>
							</div>
						</td>
						<td class="text-danger h5">${arr[4]*arr[5]}</td>
						<td>删除</td>
					</tr>
					`;
				}
				
				//当条数大于5条显示
				
				html += `
					<tr><td colspan="7" class="LoadMore text-center">加载更多</td></tr>
				`
				
				$(html).replaceAll('table>tbody>tr');
				
			}
			
		}
	})

  // 功能:用户单击加入购物车就可以实现总价的计算
  $('table').on('click', 'BUTTON', function () {
    $button = $(this);
    // 修改商品个数
    $input = $button.parent().children('input');
    var i = parseInt($input.val());
    if ($button.html().trim() === '+') {
      i++;
    } else if ($button.html().trim() === '-') {
      if (i > 1) i--;
    }
    $input.val(i);
    // 修改商品小计
    $price = $button.parent().prev().children(':nth-child(2)');
    $sub = $button.parent().next();
    $sub.html(`${($price.html()*i).toFixed(2)}`);
    // 修改商品总价
    var total = 0;
    tds = $('table>tbody>tr>td.h5');
    for (var td of tds) {
      total += parseFloat($(td).html());
    }
    // console.log(total);
    $('table').next().children(":nth-child(8)").html(`￥${total.toFixed(2)}`);
  });
  // 功能结束
})();