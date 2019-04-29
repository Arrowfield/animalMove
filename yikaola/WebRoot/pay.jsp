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
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section class='PayPage'>
		<p class='PayPageTitle'>4.8-5.14白付美分期享受前3期免息啦</p>
		<p>新款少女甜美蝴蝶结小胸聚拢文胸内衣套装无钢圈性感美背学生胸罩 等1件</p>
		<p>请您于 <span>0时1分5秒</span>内完成支付 (逾期将被取消)</p>
		<hr>
		<div class="PayForWx">
			<div>
				<h4>微信支付</h4>
				<h5>实付金额：￥29.90</h5>
			</div>
			<div>
				<img src="" alt="">
			</div>
		</div>
	</section>
	<%@ include file='../common/footer.jsp'%>
</body>
</html>