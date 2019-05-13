  //操作分页
  $.ajax({
	  url:"GetGoodsList",
	  dataType:"json",
	  data:{method:"handlePage"},
	  type:"get",
	  success:function(res){
		  console.log(res);
	  }
  })
  
