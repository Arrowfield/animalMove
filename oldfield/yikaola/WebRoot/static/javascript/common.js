//设置
function setCookie(name, value, day) {
	if(day !== 0){     // 当设置的时间等于0时，不设置expires属性，cookie在浏览器关闭后删除
		var expires = day * 24 * 60 * 60 * 1000;// 毫秒数
		var date = new Date(+new Date()+expires);
		document.cookie = name + "=" + escape(value) + ";expires=" + date.toUTCString();
	}else{
		document.cookie = name + "=" + escape(value);
	}
}
// 获取
function getCookie(name) {
	var arr;
	var reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}
// 修改
function destoryCookie(name){
	setCookie(name, '', -1);
}

function getToast(data){
	var dom = document.createElement('div');
    dom.classList.add('toast');
    // 消息
    dom.innerHTML = "<span class='MyAllLoading'><i class='iconfont icon-loading'></i></span>"+data;
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



// 检测用户是否处于登录
var isLogin = false;
$.ajax({
	url: "IsLogin",
	type: "GET",
	dataType: "json",
	success: function (res) {
		
		if (res.code == 200) {
			isLogin = true;
        	var html = res.uname;
            $("span.login-after").html(html);
            $(".login-after").show();
            $(".login-before").hide();
           
        } else {
            $("span.login-after").html("");
            $(".login-after").hide();
            $(".login-before").show();
            
        }
	},
	error:function(err){
		throw err;
	}
})

var time = null;
var i = 0;
time = setInterval(()=>{
	i++;
	if(i == 100){
		clearInterval(time);
		$('.progress').hide();
	}
	$('.progress-bar').width(i+'%');
},20);

function handleEveryday(url){
	if(!isLogin){
		getToast('您处于为登录状态，请先登录');
		setTimeout(()=>{
			location.href = './login.jsp';
		},3000);
		
		return false;
	}else{
		if(url){
			
			if(url.indexOf('cart') > -1){
				location.href = url;
			}else{
				location.href = './user.jsp?'+url;
			}
			
		}else{
			return true;
		}
	}
}


