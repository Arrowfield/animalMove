  //操作分页
		
	var page = {}; 

	function handlePage(page){
 	$.ajax({
	  url:"GetGoodsList",
	  dataType:"json",
	  data:{method:"handlePage",page:page},
	  type:"get",
	  success:function(res){
		   
		  console.log(res);
		  
		  var html = "";
		  
		  page = res.page;
		  
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
		  
		  for(var j=0;j<res.page.total/res.page.pageSize;j++){
			  
			  htmlTow += `
			  
			  <li class="page-item"><a href="javascript:" class="page-link">${j+1}</a></li>
			  
			  ` 
		  }
		  
		  $(".pagination>li:not(:first-child,:last-child)").remove();
		  
		  $(".pagination>li:nth-child(1)").after(htmlTow);//分页
		  
		  
	  }
 	});
	}
	
	handlePage();
 	
 	$("ul.pagination").on("click","li",function(){
 		
 		var $li = $(this);
 		
 		//情况当用户点击第一页时
 		
 		//用户点击最后一页时
 		
 		if($(this).children('a').html() != 1 && !$li.hasClass("prev")){
 			
 			$(".prev").removeClass("disabled");
 		}else{
 			
 			$(".prev").addClass("disabled");
 			
 		}
 		
 		if($li.hasClass("prev")){
 			
 			return;
 		
 		}else if($li.hasClass("next")){
 			
 			return;
 			
 		}else{
 			
 			handlePage($(this).children("a").html());
 		}

 		
 		getToast("加载中...");
 		
 	})
  
