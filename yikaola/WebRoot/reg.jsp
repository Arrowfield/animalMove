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
		padding:2px 8px;
		margin:20px 0;
		border-radius:10px;
		border:1px solid #ddd;
		background-color:#EEEEEE;
	}
	.huakuai em{
		-moz-user-select:none;
		margin-left:20px;
		color:gray;
	}
	.huakuai i{
		cursor:pointer;
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
		margin-top:30px;
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
					
					<input type="text" placeholder="请输入手机号">
				</div>
				<div class="huakuai">
					<i class="iconfont icon-huadong"></i>
					<em>按住滑块，拖动完成上方拼图</em>
				</div>
				<div class="get-code clearfix">
					<input type="text" placeholder="请输入短信验证码">
					<button>获取验证码</button>
				</div>
				<button class="btn-login">登录</button>
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
</body>
</html>