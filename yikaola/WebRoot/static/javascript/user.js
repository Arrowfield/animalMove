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
  
  function handleChange(){
	  let file = $('.InputForAva')[0].files[0];
	  const imgUrl = window.URL.createObjectURL(file);
	  $('.avatar>img').attr("src",imgUrl);
	  
  }
  //获取
  
  var url = location.href.split('?')[1];
  if(url.indexOf('everyday') > -1){
	  //alert('激活每日打卡');
	  $('.UserMenu>li:nth-child(3)>ul')
	  .addClass('in')
	  .children('li:last-child')
	  .addClass('in-active');
  }
  
  //获取数据
  $.ajax({
	  url:"DoCard",
	  type:'GET',
	  dataType:"json",
	  success:function(res){
		  //console.log(res);
		  if(res.num > 0){
			  $("#UserNum").html(res.num);
		  }
	  },
	  error:function(err){
		  throw err;
	  }
  });
  
  function handleClick(){
	  //alert(1);
	  var num = $("#UserNum").html();
	  $.ajax({
		  url:"AddCard",
		  data:{num},
		  type:"get",
		  dataType:"json",
		  success:(res)=>{
			  console.log(res);
			  $("#UserNum").html(res.num);
			  getToast("签到成功");
		  },
		  error:(err)=>{
			  throw err
		  }
	  })
	  
  }
  
  
  
