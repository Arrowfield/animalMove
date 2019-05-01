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

function getToast(data){
	var dom = document.createElement('div');
    dom.classList.add('toast');
    //消息
    dom.innerHTML = data;
    document.body.appendChild(dom);
    dom.style.display = 'block';
    setTimeout(() => {
  	  dom.style.display = 'none';
    },3000)
}

$(window).scroll(function(e){
	if($(window).scrollTop()<10){
		$('.NewAddClass').removeClass('my-nav');
	}else{
		$('.NewAddClass').addClass('my-nav');
	}
})
