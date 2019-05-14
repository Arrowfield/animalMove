  //操作分页
		
	var page = {}; 

	function handlePage(page){
 	$.ajax({
	  url:"GetGoodsList",
	  dataType:"json",
	  data:{method:"handlePage",page:page},
	  type:"get",
	  success:function(res){
		   
		  //console.log(res);
		  
		  var html = "";
		  
		  //page = res.page;
		  
		  for(var i = 0;i<res.data.length;i++){
			  
			  var obj = res.data[i];
			  
			  html += `
				  <li class="pb-1">
				  	<a href="#"> 
				  		<img src="./static/img/M01.webp" alt="" class="my_img">
						<p class="mb-0">${obj.sname}</p> 
						<span>¥${obj.sprice}</span>
				  	</a>
				  </li>
			  ` 
		  }
		  
		  
		  $(".ListPageUl>li").remove();
		  
		  $(".ListPageUl").append("<li></li>");
		  
		  $(html).replaceAll(".ListPageUl>li");//数量
		  
		  
		  var htmlTow = "";
		  
		  for(var j=1;j<=res.page.total/res.page.pageSize;j++){
			  
			  htmlTow += `
			  
			  <li class="page-item ${j == res.page.currentPage ? 'active': ''}">
				  <button class="page-link ">${j}</button>
			  </li>
			  
			  ` 
		  }
		  
		  
		  $(".pagination>li:not(:first-child,:last-child)").remove();
		  
		  $(".pagination>li:nth-child(1)").after(htmlTow);//分页
		  
		  
		  //为添加的dom元素绑定事件
	  	}
 		});
	}
	
	handlePage();
	
	 $("ul.pagination").on("click","li>button",function(){
	 		
	 		var $btn = $(this);
	 		
	 		//console.log(page);
	 		
	 		if($(this).html() == page){
	 			
	 			$(this).css("border","1px solid gray");
	 		}
	 		
	 		if($(this).html() != 1){
	 			
	 			$('.prev').attr("disabled",false).parent().removeClass("disabled");
	 			
	 			
	 		}else{
	 			
	 			$('.prev').attr("disabled",true).parent().addClass('disabled');;
	 		}
	 		
	 		if($btn.parent().next().hasClass("next")){
	 			
	 			
	 			
	 			//$btn.parent().next().addClass("disabled").children().attr('disabled',true);
	 			
	 		}else{
	 			
	 			
	 			
	 			//$btn.parent().next().removeClass("disabled").children().attr('disabled',false);
	 		}
	 		
	 		if($(this).hasClass("prev")){
	 			
	 			return;
	 			
	 		}else if($btn.hasClass('next')){
	 			
	 			return;
	 			
	 		}else{
	 			
	 			handlePage($btn.html());
	 			
	 			
	 			//$btn.addClass('active');
	 			
	 			getToast("加载中...");
	 		}
	 		
	 	})
	 	//结束
 	
 	
  
