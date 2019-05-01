<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<style>
@import
'./static/css/user.css'
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="d-flex UserSection">
		<div class="bg-secondary" id="my_bar">
			<div class='UserAvatar'>
				<img src="img/index/my_index2.png" alt="" class="my_img1">
			</div>
			<p class="text-center mt-0">field@qq.com.cn</p>

			<hr class="w-75 m-auto">

			<!--手风琴效果的实现-->
			<ul class="UserMenu">
				<li><a href="">我的订单 ></a>
					<ul class="list-unstyled fade">
						<li><a href="">全部订单</a></li>
						<li><a href="">待付款</a></li>
						<li><a href="">待收货</a></li>
						<li><a href="">待评价</a></li>
						<li><a href="">退货退款</a></li>
						<li><a href="">订单回收站</a></li>
					</ul></li>
				<li><a href="">我的钱包 ></a>
					<ul class="list-unstyled fade">
						<li><a href="">全部订单</a></li>
						<li><a href="">待付款</a></li>
						<li><a href="">待收货</a></li>
						<li><a href="">待评价</a></li>
						<li><a href="">退货退款</a></li>
						<li><a href="">订单回收站</a></li>
					</ul></li>
				<li><a href="">优惠特权 ></a>
					<ul class="list-unstyled fade">
						<li><a href="">会员中心</a></li>
						<li><a href="">店铺优惠券</a></li>
						<li><a href="">全场优惠券</a></li>
						<li><a href="">活动优惠券</a></li>
						<li><a href="">每日日常打卡</a></li>
					</ul></li>
				<li><a href="">地址管理 ></a></li>
				<li><a href="">安全设置 ></a></li>
				<li><a href="">维权管理 ></a></li>
				<li><a href="">账号设置 ></a>
					<ul class="list-unstyled fade">
						<li><a href="">基本信息</a></li>
						<li><a href="">修改图像</a></li>
					</ul></li>
			</ul>
		</div>

		<!--div class="UserRight">
			<div>
				<input type="text" placeholder="请输入订单中的商品名称或订单编号">
				<button>搜索</button>
			</div>
			<table class="table border">
				<tr>
					<th>商品</th>
					<th>单价（元）</th>
					<th>数量</th>
					<th>售后</th>
					<th>实付款（元）</th>
					<th>交易状态</th>
					<th>操作</th>
				</tr>
			</table>
		</div-->

		<!--div class="UserRight">
			<h5>帐号设置/修改头像</h5>
			<div class="UserSendAvatar">
				<div class='avatar'><img src="" alt=""></div>
				<input onchange='handleChange()' class='InputForAva' type='file' accept="image/*">
				<button>确认更换</button>
			</div>
		</div-->

		<div class="UserDou">
			<div class='UserFirst d-flex'>
				<h5 class="mb-0">我的衣佳豆</h5>
				<a href="#">如何赚取考拉豆？</a>
			</div>
			<div>
				<div class="UserBtnRed">
					
				</div>
			</div>
		</div>

	</div>

	<%@ include file='../common/footer.jsp'%>
	<script src="./static/javascript/user.js"></script>
</body>
</html>