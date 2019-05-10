  $('#my_bar>ul>li>a').click(function (e) {
    e.preventDefault();
    $a = $(this);
    $a.next().toggleClass("in")
      .parent()
      .siblings()
      .children("ul")
      .removeClass('in');
  })
  
  $('.avatar').click(function(){
	  $('.InputForAva').click();
  })
  
  let file = "";
  
  function handleChange(){
	   file = $('.InputForAva')[0].files[0];
	  // file对象诞生
	  const imgUrl = window.URL.createObjectURL(file);
	  $('.avatar>img').attr("src",imgUrl);
	  
  }
  
  function handleAvatar(){
	 
	  if(file){
		  //console.log(file);
		  var formData = new FormData();
		  formData.append("filename","avatar");
		  formData.append("file",file);
		  $.ajax({
			  url:"UserAvatar",
			  data:formData,
			  type:"POST",
			  dataType:"json",
			  processData:false,
			  success:function(res){
				  console.log(res);
			  }
		  })
	  }else{
		  //getToast("请选择图片");
		  return;
	  }
  }
  // 获取
  
  var url = location.href.split('?')[1];
  
  if(url.indexOf('everyday') > -1){
	  // alert('激活每日打卡');
	  $('.UserMenu>li:nth-child(3)>ul')
	  .addClass('in')
	  .children('li:last-child')
	  .addClass('in-active');
	  
	  $('#UserRight>div:nth-child(3)').show();
  }else if(url.indexOf('order') > -1){
	  $('.UserMenu>li:nth-child(1)>ul')
	  .addClass('in')
	  .children('li:first-child')
	  .addClass('in-active');
	  
	  $('#UserRight>div:nth-child(1)').show();
	  
	  $.ajax({
		  url:"OrderList",
		  type:"get",
		  dataType:"json",
		  success:function(res){
			  
			  if(res.code == 301){
				  $(".OrderList").css("display","flex");
			  }else{
				  // 有数据
				 
				  
				  var html = "";
				  
				  for(var i=0;i<res.data.length;i++){
					  
					  var arr = res.data[i];
					  
					  
					  html += `
						  <tr>
						  	<td>${arr[3]}</td>
						  	<td>${arr[5]}</td>
						  	<td>${arr[4]}</td>
						  	<td>暂无</td>
						  	<td>${arr[6]}</td>
						  	<td>待付款</td>
						  	<td><a data-toggle="modal" data-target="#myModal" onclick="handleDel(${arr[0]},'${arr[3]}')" href="javascript:">删除订单</a></td>
						  </tr>
					  `;
				  }
				  
				  $(html).replaceAll('tbody>tr');
				  
			  }
		  }
	  });
  }else if(url.indexOf('user')>-1){
	  
	  $('.UserMenu>li:last-child>ul')
	  .addClass('in')
	  .children('li:last-child')
	  .addClass('in-active');
	  
	  $('#UserRight>div:nth-child(2)').show();
  }
  
  function handleDel(id,name){
	  // 操作删除
	  console.log(id,name);
	  $(".name").html(name);
	  $('.id').html(id);
	  //
  }
  
  function handleSearch(){
	  // 操作搜索
	  var keyword = $("#input").val();
	  $.ajax({
		  url:"OrderSearch",
		  type:"get",
		  data:{keyword},
		  dataType:"json",
		  success:function(res){
			  
			  if(res.code == 301){
				  $('table>tbody>tr').remove();
				  $('table>tbody').append('<tr></tr>');
				  $('.add').show();
			  }else{
				  
				  $('.add').hide();
				  
				  var html = "";
				  
				  for(var i=0;i<res.data.length;i++){
					  
					  var arr = res.data[i];
					  
					  html += `
						  <tr>
						  	<td>${arr[3]}</td>
						  	<td>${arr[5]}</td>
						  	<td>${arr[4]}</td>
						  	<td>暂无</td>
						  	<td>${arr[6]}</td>
						  	<td>待付款</td>
						  	<td><a data-toggle="modal" data-target="#myModal" onclick="handleDel(${arr[0]},'${arr[3]}')" href="javascript:">删除订单</a></td>
						  </tr>
					  `;
				  }
				  
				  $(html).replaceAll('tbody>tr');
				  
			  }
		  }
	  })
  }
  
  function handleRelDel(){
	  var id = $('.id').html();
	  $.ajax({
		  url:"OrderDel",
		  type:"get",
		  data:{id},
		  dataType:"json",
		  success:function(res){
			  console.log(res);
		  }
	  })
  }
  
  // 获取数据
  $.ajax({
	  url:"DoCard",
	  type:'GET',
	  dataType:"json",
	  success:function(res){
		  // console.log(res);
		  if(res.num > 0){
			  $("#UserNum").html(res.num);
		  }
	  },
	  error:function(err){
		  throw err;
	  }
  });
  
  function handleClick(){
	  // alert(1);
	  var num = $("#UserNum").html();
	  $.ajax({
		  url:"AddCard",
		  data:{num},
		  type:"get",
		  dataType:"json",
		  success:(res)=>{
			  console.log(res);
			  if(res.code == 301){
				  getToast("今日你已经签到，明天再来！");
			  }else{
				  $("#UserNum").html(res.num);
				  getToast("签到成功");
			  }
		  },
		  error:(err)=>{
			  throw err
		  }
	  })
	  
  }
  
  
  
