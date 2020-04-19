function handleCart(id,num,price){
	$.ajax({
		url:"AllCartHandle",
		type:"post",
		data:{method:'update',id,num,price},
		dataType:"json",
		success:function(res){
			conosole.log(res);
		}
	})
}

function handleDel(id,name){
	console.log(id,name);
	
	$(".MyModalBody>p").html(name);
	
	console.log($(".MyModalBody>em"));
	
	$(".MyModalBody>em").html(id);
}

$('.CartBtn>button:nth-child(2)').click(function(){
	
	$("#myModal").click();
	
});

//

$('.CartBtn>button:nth-child(1)').click(function(){
	
	//操作删除
	//$("#myModal").click();
	
	var id = $(".MyModalBody>em").html();
	
	$.ajax({
		
		url:"AllCartHandle",
		type:"get",
		dataType:"json",
		data:{method:"delete",id},
		success:function(res){
			
			console.log(res);
			
			if(res.code == 200){
				
				$("#myModal").click();
				
				getToast("删除成功");
				
				setTimeout(()=>{
					
					history.go(0);
				
				},1000);
				
			}
		
		}
		
	})
	
});

function handleClick(e,id){
	//判断当前是否选中状态
	
	//console.log(e.target);
	
	var dom = e.target;
	
	//console.log($(e.target).is(":checked"),id);
	
	var status = '';
	
	//当全部选中的时候就让全选进入状态
	
	var inputs = $("table>tbody>tr>td:nth-child(1)>input");
	
	//for()
	
	inputs.each((i,tmp)=>{
		
		if(!$(tmp).is(":checked")){
			
			$("#my_money input").prop("checked",false);
			
			return false;//结束
			
		}else{
			
			$("#my_money input").prop("checked",true);
		}
	})
	
	
	
	if($(e.target).is(":checked")){
		
		//选中状态调数据库将status更改为1;
		
		status = 1;
		
		//修改总价
		
		
		var sum = parseFloat($(".SumPrice i").html());
		
		sum += parseFloat($(e.target).parent().nextAll('.h5').html());
		
		
		
		$(".SumPrice i").html(sum.toFixed(2));
		
	}else{
		
		status = 0;
		
		var sum = $(".SumPrice i").html();
		
		sum -= $(e.target).parent().nextAll('.h5').html();
		
		$(".SumPrice i").html(sum.toFixed(2));
		
		//修改总价
		
	}
	
	$.ajax({
		url:"AllCartHandle",
		data:{method:"status",status,id},
		dataType:"json",
		success:function(res){
			
			console.log(res);
		}
	})
}

//操作全选

function handleCheckAll(e){
	
	//初始状态（解决）
	
	//点击状态
	
	//console.log(e.target);
	
	var inputs = $("table>tbody>tr>td:nth-child(1)>input");
	
	var statusAll;
	
	if($(e.target).is(":checked")){
		
		//修改inputs的状态
		
		for(var input of inputs){
			
			$(input).prop("checked",true);
			
		}
		
		var tds = $('table>tbody>tr>td.h5');
		
		var sum = 0;
		
		for(var td of tds){
			
			sum += parseFloat($(td).html());
			
		}
		
		
		$(".SumPrice>i").html(sum.toFixed(2));
		
		//入库
		
		statusAll = 1;
		
		
	}else{
		
		for(var input of inputs){
			
			$(input).prop("checked",false);
			
		}
		
		var sum = parseFloat(0);
		
		$(".SumPrice>i").html(sum.toFixed(2));
		
		//入库
		
		statusAll = 0;
	}
	
	$.ajax({
		url:"AllCartHandle",
		dataType:"json",
		data:{method:"status",statusAll},
		success:function(res){
			console.log(res);
		}
	})
	
}

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
				
				var sum = 0;
				
				for(var i=0;i<res.data.length;i++){
					
					var arr = res.data[i];
					
					if(arr[7] == 1){
					
						sum += arr[4] * arr[5]; 
						
					}
					
					html += `
					
					<tr>
						<td>
							<input onclick="handleClick(event,${arr[0]})" ${arr[7] == 1?'checked':""} type="checkbox" class="my_input">
						</td>
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
						<td>
							<i class="CartLine">58.16</i>
							<p class="mb-1 text-muted">${arr[5]}</p>
							<p class="text-danger mt-0">拼团价</p>
						</td>
						
						<td>
							<div class='d-flex align-items-center'>
								<button class="my_btn">-</button> 
								<input type="text" class="my_input1" value=${arr[4]}>
								<i class="d-none">${arr[0]}</i>
								<em class="d-none">${arr[5]}</em>
								<button class="my_btn">+</button>
							</div>
						</td>
						
						<td class="text-danger h5">${(arr[4]*arr[5]).toFixed(2)}</td>
						
						<td class="MyNewsDel" data-toggle="modal" data-target="#myModal" onclick="handleDel(${arr[0]},'${arr[3]}')">删除</td>
					</tr>
					`;
				}
				
				//当条数大于5条显示
				
				html += `
					<tr><td colspan="7" class="LoadMore text-center">加载更多</td></tr>
				`
				//总价复制
				
				$('.SumPrice i').html(sum.toFixed(2));
				
				$(html).replaceAll('table>tbody>tr');
				
				//初始状态
				
				var inputs = $("table>tbody>tr>td:nth-child(1)>input");
				
				//for()
				
				var bool = inputs.each((i,tmp)=>{
					
					if(!$(tmp).is(":checked")){
						
						$("#my_money input").prop("checked",false);
						
						return false;
						
					}
				})
				
			}
			
		}
	})
	


  // 功能:用户单击加入购物车就可以实现总价的计算
  $('table').on('click', 'BUTTON', function () {
    
	$button = $(this);
    
    // 修改商品个数
    $input = $button.parent().children('input');
    
    var i = parseInt($input.val());
    
    var id = $(this).parent().children('i').html();
    
    var price = $(this).parent().children('em').html();
 
    if ($button.html().trim() === '+') {
    	
      i++;
      
      handleCart(id,i,price);
      
    } else if ($button.html().trim() === '-') {
    	
      if (i > 1) i--;
      
      handleCart(id,i,price);
      
    }
    
    $input.val(i);
    
    // 修改商品小计
    
    var $sub = $(this).parent().parent().next();
    
    $sub.html(`${(price*i).toFixed(2)}`);
    
    // 修改商品总价
    
    var total = 0;
    
    tds = $('table>tbody>tr>td.h5');
    
    inputs = $('table>tbody>tr>td:nth-child(1)>input');
    
    //console.log(tds,inputs);
    
   
    for(var i=0;i<inputs.length;i++){
    	
    	if($(inputs[i]).is(":checked")){
    		
    		for(var j=0;j<tds.length;j++){
    			
    			if(j == i){
    				
    				total += parseFloat($(tds[j]).html());
    			}
    			
    		}
    	}
    }
    
    $(".SumPrice i").html(total.toFixed(2));
    
  });
  // 功能结束
})();