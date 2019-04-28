//设置
function setCookie(name, value, day) {
	if(day !== 0){     //当设置的时间等于0时，不设置expires属性，cookie在浏览器关闭后删除
		var expires = day * 24 * 60 * 60 * 1000;//毫秒数
		var date = new Date(+new Date()+expires);
		document.cookie = name + "=" + escape(value) + ";expires=" + date.toUTCString();
	}else{
		document.cookie = name + "=" + escape(value);
	}
}
//获取
function getCookie(name) {
	var arr;
	var reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}
//修改
function destoryCookie(name){
	setCookie(name, '', -1);
}

$(window).scroll(function(e){
	console.log($(window).scrollTop());
	if($(window).scrollTop()<10){
		$('.NewAddClass').removeClass('my-nav');
	}else{
		$('.NewAddClass').addClass('my-nav');
	}
})
