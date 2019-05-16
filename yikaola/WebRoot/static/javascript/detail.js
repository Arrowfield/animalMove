var goodMessage = {num:1,status:1};
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
  
  var id = location.href.split("?")[1].split("=")[1];

  $.ajax({
  	url:"GoodsMessage",
  	type:"get",
  	dataType:"json",
  	data:{id},
  	success:function(res){
  		console.log(res);
  		if(res.code == 200){
  			
  		var arr = res.good;
  		
  		goodMessage.price = arr[3];
  		
  		goodMessage.name = arr[1];
  		
  		goodMessage.count = arr[2];
  		
  		goodMessage.id = id;
  		
  		var html = `
 
  			<h4 class="font-weight-bold">${arr[1]}</h4>
					<div>
						<div class="my_bg1 pt-2 pb-2 mb-3 pl-2">
							<p>
								<span class="font-weight-bold">现价：￥${arr[3]}</span> 
								<span><i class="TextLine">原价：￥${arr[4]}</i></span>
							</p>
							
							<p>
								店铺优惠：
								<!--小方制作-->
								<span class="border border-danger p-1 text-danger ">
									满99立减3元 </span><a href="#"
									class=" bg-danger btn  text-white rounded-0 p-0 my_small pt-1"
									style="width: 55px; height: 27px"> 领取</a> <span
									class="border border-danger p-1 text-danger "> 满199立减15元
								</span><a href="#"
									class=" bg-danger btn  text-white rounded-0 p-0 my_small pt-1"
									style="width: 55px; height: 27px"> 领取</a>
							</p>
						</div>
						<p>
							客服：
							<button class="bg-white">联系客服</button>
						</p>
						<div class="AddDetailC">颜色：<div class="color"></div></div>
						<div class="AddDetailC">尺码：<div class="size"></div></div>
						<p>
							数量：
							<button class="my_btn">-</button>
							<input disabled value="1" min="1" max=${arr[2]} type="text" class="text-center my_input">
							<button class="my_btn">+</button>
							<span>库存${arr[2]}件</span>
						</p>
						
						<p class="mb-4">
							<a href="#" class="btn bg-danger text-white rounded-0">2人拼团购买</a>
							<a href="#"
								class="btn bg-secondary text-white mr-2 ml-2 rounded-0">现价单独购买</a>
							<a href="javascript:handleAddCart()" class="btn bg-danger text-white rounded-0">加入购物车</a>
						</p>
						<p>收藏 分享 举报</p>
						<p>服务承诺：全国包邮 七天无理由退货 72小时发货 退货补运费</p>
						<p>支付方式：微信 支付宝 微博</p>
					</div>
  		`
  			$('.DetailCenter').prepend(html);
  		
  		var numTow = 1;
  		
  		$(".my_btn").click(function(){
  			
  			//console.log(numTow,arr[2]);
  			
  			
  			
  			if($(this).html() == "-"){
  				
  				numTow --;
  				
  			}else if($(this).html() == "+"){
  				
  				numTow ++;
  			}
  			
  			if(numTow <= 0){ numTow = 1;return;}
  			
  			if(numTow > arr[2]){
  				
  				numTow = arr[2];
  				
  				return;
  			}
  			
  			$(".my_input").val(numTow);
  			
  			goodMessage.num = numTow; 
  		})
  		
  		
  		
  		if(res.sku){
  			
  			var size = res.sku[1].split(' ');
  			
  			var html = "";
  			
  			for(var i=0;i<size.length;i++){
  				
  				html += `<button class="sizeBtn">${size[i]}</button>`
  			}
  			
  			$(html).replaceAll(".size");
  			
  			$(".sizeBtn").click(function(){
  				
  				var val = $(this).html();
  				
  				$(this).css("border","1px solid red").siblings().css("border","1px solid gray");
  				
  				goodMessage.size = val;
  				
  			})
  		
  			
  			var html = "";
  			
  			var color = res.sku[2].split(' ');
  			
  			for(var i=0;i<color.length;i++){
  				
  				var num = color[i];
  				
  				switch(color[i]){
  				
  					case "1":color[i] = "红";break;
  					case "2":color[i] = "绿";break;
  					case "3":color[i] = "黄";break;
  					case "4":color[i] = "蓝";break;
  				
  				}
  				
  				html += `
  					<button data-value=${num} class="colorBtn">${color[i]}</button>
  				`
  			}
  			
  			$(html).replaceAll(".color");
  			
  			//并且绑定事件
  			
  			

  			$(".colorBtn").click(function(){
  				
  				
  				var val = $(this).attr('data-value');
  				
  				$(this).css("border","1px solid red").siblings().css("border","1px solid gray");
  				
  				goodMessage.color = val;
  				
  			})
  			
  		}
  		//添加sku结束
  		
  	}
  	}
  })
  
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
  lgDiv.style.backgroundImage = "url(./static/img/detail01.jpg)";
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



function handleAddCart(){
	  
	//判断用户是否处于登录状态

	if(!handleEveryday()){
		return;
	}
	
	//数量默认1
	
	if(!goodMessage.color){
		
		getToast("请选择颜色");
		
		return;
	}
	
	if(!goodMessage.size){
		
		getToast("请选择型号大小");
		
		return;
	}
	
	//加入购物车
	
	$.ajax({
		url:"AddCart",
		type:"post",
		data:goodMessage,
		dataType:"json",
		success:function(res){
			console.log(res);
			if(res.code == 200){
				getToast("添加购物车成功，可以进入购物车中查看！");
			}else{
				getToast("添加失败");
			}
		}
	})
	
}

//事件绑定
function handleColor(){
	
	
}



