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
				<img src="./static/img/avatar.png" alt="" class="my_img1">
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

		<div id="UserRight">

			<div class="UserRight">
				<div class="mt-5">
					<input id="input" type="text" placeholder="请输入订单中的商品名称或订单编号">
					<button onclick="handleSearch()">搜索</button>
				</div>
				<table class="table border">
					<thead>
						<tr>
							<th>商品</th>
							<th>单价（元）</th>
							<th>数量</th>
							<th>售后</th>
							<th>实付款（元）</th>
							<th>交易状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr></tr>
					</tbody>
				</table>
				<p class="add text-center">无相关的订单</p>
				<div class="OrderList">
					<img src="./static/img/empty.png" alt="">
					<div>
						<h4>哎呀，此状态下没有对应的订单</h4>
						<p>
							去<a href="./index.jsp">商城</a>看看大家喜欢的商品
						</p>
						<p>
							去<a href="./index.jsp">快抢</a>看看大家正在折扣的商品
						</p>
					</div>
				</div>
			</div>

			<div class="UserRight">
				<h5>帐号设置/修改头像</h5>
				<div class="UserSendAvatar">
					<div class='avatar'>
						<img src="./static/img/avatar.png" alt="">
					</div>
					<input onchange='handleChange()' class='InputForAva' type='file'
						accept="image/*">
					<button onclick="handleAvatar()">确认更换</button>
				</div>
			</div>

			<div class="UserDou UserRight">
				<div class='UserFirst d-flex'>
					<h5 class="mb-0 bg-white">我的衣佳豆</h5>
					<a href="#">如何赚取考拉豆？</a>
				</div>

				<div class="d-flex">
					<div class="UserBtnRed">
						<div class="UserRedAvatar">
							<img src="./static/img/avatar.png" alt="">

							<div>
								<span id="UserNum">0</span>
								<p>
									<a href="javscript:">衣佳豆明细></a>
								</p>
							</div>
						</div>
						<button onclick="handleClick()">签到领取</button>
						<p>
							今日签到可领<i>衣佳豆大礼包</i>
						</p>
					</div>
					<div>
						<img class="UserWidth" src="./static/img/bg01.jpg" alt="">
					</div>
				</div>

				<h4 class="mt-3">兑换特权</h4>
				<ul class="UserMemeber">
					<li class="d-flex">
						<div>
							<img src="./static/img/bg02.jpg" alt="">
						</div>
						<div class="UserRedDetail">
							<p>华住会酒店</p>
							<p>华住会酒店权益</p>
							<span>20<i>衣佳豆</i></span>
							<p>原价： ￥299</p>
							<button>立即兑换</button>
						</div>
					</li>
					<li class="d-flex">
						<div>
							<img src="./static/img/bg02.jpg" alt="">
						</div>
						<div class="UserRedDetail">
							<p>华住会酒店</p>
							<p>华住会酒店权益</p>
							<span>20<i>衣佳豆</i></span>
							<p>原价： ￥299</p>
							<button>立即兑换</button>
						</div>
					</li>
				</ul>
			</div>

		</div>
	</div>

	<%@ include file='../common/footer.jsp'%>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<div class='MyModalBody'>
						<img src="./static/img/index/02.webp" alt="">
						<p class="name">2018春秋新款韩版纯色毛衣外套中长款宽松显瘦连帽女针织开衫</p>
						<em class="d-none DelId"></em>
						<div class='CartBtn'>
							<button onclick="handleRelDel()">确认删除</button>
							<button onclick="$('#myModal').click()">取消</button>
						</div>
						<p class="id d-none"></p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="./static/javascript/user.js"></script>
</body>
</html>