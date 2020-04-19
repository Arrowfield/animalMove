$(function () {
	function getRandomName(){
		//随机生成20位字母带数字的用户名
		//return Math.random().toString(36).substr(2);
	}
    //判断用户是否在线
	var pro = new Promise((resolve,reject)=>{
		$.ajax({
	        url: "IsLogin",
	        type: "GET",
	        dataType: "json",
	        success: function (res) {
	            if (res.code == 200) {
	            	var html = res.uname;
	                $("span.login-after").html(html);
	                $(".login-after").show();
	                $(".login-before").hide();
	               
	            } else {
	                $("span.login-after").html("");
	                $(".login-after").hide();
	                $(".login-before").show();
	                
	            }
	            resolve(res);
	        },
	        error:function(err){
	        	throw err;
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
	           
	           
	           if(res.code == 200){
	        	   
	        	   var html = "";
	        	   
	        	   for(var i=0;i<res.data.length;i++){
	        		   
	        		   var tmp = res.data[i]
	        		   
	        		   html += `
	        			   <li>
							<div class="show-border">
								<img src="./static/img/M01.webp">
								
								<div class="change-color">
									<span class="my-first-span title"> 
										<a href="detail.jsp?id=${tmp.id}">${tmp.goodName}</a>
									</span> 
									
									<span class="my-first-span sub-title">${tmp.desc}</span> 
									
									<span class="my-first-span price"> 
										<em> 
											<i class="new-price">￥</i>${tmp.price}<i class="old">￥1${tmp.oldPrice}</i>
										</em>
										<button onclick=handleBuy(${tmp.id}) class="my-buy">立即购买</button>
									</span>
								</div>
							</div>
	        			   </li>
	        		   `
	        	   }
	        	   $(".YouLike").append(html);
	        	   
	           }
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

function handleBuy(id){
	
	window.location.href = "./pay.jsp?sid="+id; 
}
