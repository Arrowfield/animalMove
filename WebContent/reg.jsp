﻿<!-- 文件部分四 -->
<!Doctype html>
<html>
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<style>
	body,html{
		min-width:1090px;
	}
	.container-login{
		
	}
	.header-color{
		background:white;	
	}
	.login-header{
		width:1090px;
		margin:0px auto;
		padding:20px 0;
		position:relative;
	}
	.center{
		width:100%;
		height:500px;
		position:relative;
		background:url("./static/img/login/01.jpg") no-repeat;
		background-position: 50% 50%;
		background-size:cover;
	}
	
	.like-table{
		background-color:white;
		position:absolute;
		top:10%;
		left:60%;
	}
	/*消除为子元素设置外边距却作用于父元素的 问题*/
	.like-table::before{
		display:table;
		content:"";
	}
	.phone-email{
		padding:13px 0;
		background:#f2f2f2;
	}
	.phone-email em{
		padding:0 50px;
		font-weight:blod;
	}
	
	.phone-email em:nth-child(1){
		border-right:1px solid gray;
		color:red
	}
	.table-center{
		padding:10px 30px;
	}
	.vail{
		padding:6px 0;
		font-size:12px;
		color:gray;
		float:right;
	}
	.vail i{
		padding-right:2px;
	}
	.my-input{
		border:1px solid #ddd;
		padding:8px;
		border-radius:2px;
	}
	.my-input input{
		border:none;
		width:80%;
	}
	.my-input input:focus .my-input{
		border:1px solid blue !important;
	} 
	.huakuai{
		padding:2px 0;
		margin:20px 0;
		border-radius:10px;
		border:1px solid #ddd;
		background-color:#EEEEEE;
		position:relative;
		text-align:center;
		overflow:hidden;
	}
	.huakuai em{
		-moz-user-select:none;
		color:gray;
		user-select:none;
	}
	.huakuai i{
		cursor:move;
		padding:0 8px;
		position:absolute;
		left:0;
		z-index:10
	}
	.get-code{
		border:1px solid #ddd;
	}
	.get-code button{
		width:36%;
		padding:8px;
		border:none;
		float:right;
		cursor:pointer;
	}
	.get-code input{
		border:none;
		width:60%;
		float:left;
		padding:8px;
	}
	.btn-login{
		width:100%;
		background:red;
		text-align:center;
		color:white;
		padding:8px 0;
		border:0;
		cursor:pointer;
	}
	.icons{
		padding-left:30px;
	}
	.icons i{
		margin-right:5px;
		font-size:20px;
	}
	.my-img01{
		position:absolute;
		left:450px;
		top:0;
	}
	.RegAddClass{
		text-decoration:none;
		color:black;
	}
	.RegBgColor{
		position:absolute;
		left:0;
		height:100%;
		background:#ADD8E6;
		opacity:0.3;
		top:0;
	}
	.LoginMsg{
		font-size:12px;
		color:red;
		line-height:25px;
		display:block;
		height:25px;
	}
</style>

<body>
	<div class="container-login">
		<div class="header-color">
			<div class="login-header">
				<a href="./index.jsp"><img src="./static/img/login/01.png"></a>
				<img class="my-img01" src="./static/img/register/01.jpg">
			</div>
		</div>
		<div class="center">
			<div class="like-table">
				<div class="phone-email">
					<em>欢迎注册</em><em>已有账号？<a class='RegAddClass' href="./login.jsp">去登录</a></em>
				</div>
				<div class="table-center">
				<div class="clearfix">
					<em class="vail">
					<i class="iconfont icon-suo"></i>使用手机号注册</em>
				</div>
				<div class="my-input">
					
					<input id='phone' data-reg='^1[34578][0-9]{9}$' type="text" placeholder="请输入手机号">
				</div>
				<div class="huakuai">
					<i class="iconfont icon-huadong"></i>
					<em>按住滑块，拖动完成相关验证</em>
					<div class='RegBgColor'></div>
				</div>
				<div class="get-code clearfix">
					<input id='code' maxlength='6' type="text" placeholder="请输入短信验证码">
					<button disabled>获取验证码</button>
				</div>
				<span class='LoginMsg'></span>
				<button disabled class="btn-login">注册</button>
			</div>
				<div class="phone-email">
					<div class="icons">
						<i class="iconfont icon-weixin"></i>
						<i class="iconfont icon-zhifubao"></i>
						<i class="iconfont icon-weibo"></i>
						<i class="iconfont icon-tubiao215"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file='../common/footer.jsp'%>
	<script>
		var allWidth = $('.huakuai').width();
		var dom = $('.huakuai>i');
		var bgDom = $('.RegBgColor');
		var width = dom.innerWidth();
		var needWidth = allWidth - width;
		var downX;
		var isSuccess;
		dom.mousedown(function(e){
			isSuccess = false;
			var left = $(this).offset().left;
			
			downX = e.clientX;
			document.onmousemove = function(e){
				var e = e || window.event ||　window.which;
				
				var d = e.clientX - downX;
				
				if(d　<　0){
					d = 0;
				}else if(d >　needWidth){
					d = needWidth;
					isSuccess = true;
					
				}else if(d == needWidth){
					
				}
				
				dom.css({'left':d});
				
				bgDom.width(d);
			};
			
			document.onmouseup = function(e){
				if(!isSuccess){
					//dom.css({'left':0});
					dom.animate({'left':0},500);
					bgDom.animate({'width':0},500);
				}else{
					$('.huakuai>em').html('验证通过');
					bgDom.css({'background':'#90EE90'});
				}
				document.onmousemove = null;
				document.onmouseup = null;
			};
		})
		
		
		var reg = $('#phone').data('reg');
			reg = new RegExp(reg);
		$('#phone').blur(function(e){
			e.preventDefault;
			if(!reg.test($(this).val())){
				$('.LoginMsg').html('输入格式错误');
			}else{
				$('.LoginMsg').html('输入格式正确');
			}
		});
		
		$('#phone').on('input','',function(){
			if(!reg.test($(this).val())){
				$('.get-code button').attr({'disabled':true});
			}else{
				$('.get-code button').attr({'disabled':false});
				$('.btn-login').attr({disabled:false});
			}
		})
		
		//调接口获取验证码
		$('.get-code button').click(function(){
			$.ajax({
				url:"LoginServlet",
				type:'GET',
				success:(res) => {
					console.log(res);
					getToast(res);
				}
			});
		});
		
		//操作注册
		$('.btn-login').click(function(){
			var phone = $('#phone').val();
			var code = $('#code').val();
			$.ajax({
				url:"RegServlet",
				type:'GET',
				dataType:'json',
				data:{phone,code},
				success:function(res){
					if(res.code == 200){
						getToast(res.message+'进入登录界面...');
						setTimeout(()=>{
							location.href = "./login.jsp";
						},2000);
					}else{
						console.log(res);
						getToast(res.message);
					}
				},
				error:function(err){
					throw  err;
				}
			})
		})
		
	</script>
</body>
</html>