$(function () {
    //判断用户是否在线
	var pro = new Promise((resolve,reject)=>{
		$.ajax({
	        url: "IsLogin",
	        type: "GET",
	        dataType: "json",
	        success: function (res) {
	            if (res.code == 200) {
	                $("span.login-after").html(res.uname);
	                $(".login-after").show();
	                $(".login-before").hide();
	               
	            } else {
	                $("span.login-after").html("");
	                $(".login-after").hide();
	                $(".login-before").show();
	                
	            }
	            resolve(res);
	        }
	    });
	})
	
	pro.then((res)=>{
		$.ajax({
	        url: "IndexData",
	        type: "GET",
	        dataType: "json",
	        success: function (res) {
	           console.log(res);
	        }
	    });
	}).catch((err)=>{
		throw err;
	})
    
    //注销功能
    $("#destory").click(function () {
        $.ajax({
            url: "ExitServlet",
            type: "GET",
            success: function (res) {
                window.location.reload();
                console.log(res);
            }
        });
    });
    /*易考拉官网：https://www.kaola.com*/
    $('.my-hide-img').click(function (e) {
        e.stopPropagation();
        $(this).parent("a").hide();
    });
});
