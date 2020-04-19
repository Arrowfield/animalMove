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
	.AllGoods{
		list-style:none;
		margin:0;
		padding:10px 0;
	}
	.AllGoods li{
		padding-bottom:10px;
	}
	.AllGoods li>span:nth-child(2){
		padding-left:5px;
	}
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section class='PayPage'>
		<p class='PayPageTitle'>4.8-5.14白付美分期享受前3期免息啦</p>
		<ul class="AllGoods"><li></li></ul>
		
		<p>请您于 <span>0时1分5秒</span>内完成支付 (逾期将被取消)</p>
		<hr>
		<div class="PayForWx">
			<div>
				<h4>微信支付</h4>
				<h5>实付金额：￥<em class="PaySum">29.90</em></h5>
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
<script>

//获取购物车的数据
$.ajax({
	url:"CartMessage",
	type:"get",
	dataType:"json",
	data:{status:1},
	success:function(res){
		console.log(res);
		
		var html = "";
		
		var sum = 0;
		
		for(var i=0;i<res.data.length;i++){
			
			var arr = res.data[i];
			
			sum += arr[5]*arr[4];

			
			html += "<li><span>"+arr[3]+"</span><span>x"+arr[4]+"</span></li>";
			
		}
		
		$(html).replaceAll(".AllGoods>li");
		
		//总价
		
		$(".PaySum").html(sum.toFixed(2));
	}
})

</script>
</body>
</html>