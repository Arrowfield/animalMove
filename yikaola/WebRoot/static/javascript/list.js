  //操作分页
 	$.ajax({
	  url:"GetGoodsList",
	  dataType:"json",
	  data:{method:"handlePage"},
	  type:"get",
	  success:function(res){
		  console.log(res);
		  
		  var html = "";
		  
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
		  
		  
		  var htmlTow = "";
		  
		  for(var j=0;j<res.page.total/res.page.pageSize;j++){
			  
			  htmlTow += `
			  
			  <li class="page-item"><a href="#" class="page-link">${j+1}</a></li>
			  
			  ` 
		  }
		  
		  $(".pagination>li:nth-child(1)").after(htmlTow);
		  
		  $(html).replaceAll(".ListPageUl>li");
	  }
 	});
 	
 	$("ul.pagination").on("click","li",function(){
 		
 		var $li = $(this);
 		
 		
 		
 	})
  
