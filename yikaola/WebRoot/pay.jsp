<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<style>
	.PayPage{
		width:1090px;
		margin:0 auto;
	}
	.PayPage:before{
		content:"";
		display:table;
	}
	.PayPageTitle{
		margin-top:50px;
		height:40px;
		line-height:40px;
		text-align:center;
		background:#ffeeb9;
		color:#f8705c;
		font-size:13px;
	}
	.PayForWx{
		height:500px;
		padding:0 0 10px;
		border:2px solid gray;
		border-radius:12px;
		margin-top:30px;
		background:#f2f2f2;
		overflow:hidden;
		
	}
	.PayForWx>div:nth-child(1){
		display:flex;
		justify-content:space-between;
		padding:10px 30px;
		background:white;
	}
	
	.d-flex{
		display:flex;
		align-items:center;
	}
	
	.PayFlex{
		display:flex;
		padding:30px 50px;
	}
	.PayFlex div{
		flex:1 1 auto;
		text-align:center;
	}
	.PayFlex div p{
		font-size:13px;
	}
	.PayFlex div:nth-child(1){
		background:white;
	}
	.PayFlex div:nth-child(2){
		background:#ddd;
		display:flex;
		align-items:center;
		justify-content:center;
		flex-direction:column;
	}
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section class='PayPage'>
		<p class='PayPageTitle'>4.8-5.14白付美分期享受前3期免息啦</p>
		<p>2018秋季新款Chic韩版休闲长款纯色T恤女短袖连衣裙修身显瘦百搭简约基础款圆领长裙裙子</p>
		<p>请您于 <span>0时1分5秒</span>内完成支付 (逾期将被取消)</p>
		<hr>
		<div class="PayForWx">
			<div>
				<h4>微信支付</h4>
				<h5>实付金额：￥29.90</h5>
			</div>
			
			<div class="PayFlex">
				<div>
					<img src="./static/img/code.png" alt="">
				</div>
				
				<div>
					<p>请使用微信扫描二维码以完成支付</p>
					<p><a href="">详细使用帮助</a></p>
					<p>（如果支付遇到问题，<a href="">可联系客服</a>）</p>
				</div>
				
			</div>
		</div>
	</section>
	<%@ include file='../common/footer.jsp'%>
</body>
</html>