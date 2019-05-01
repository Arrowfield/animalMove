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
  
  
