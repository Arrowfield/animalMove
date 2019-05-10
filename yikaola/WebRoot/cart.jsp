<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<style>
@import
'./static/css/cart.css'
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section>

		<header>
			<div class="d-flex my_bg CartPageAddClass">

				<div class="my_padding">
					<img src="./static/img/index/copy.png" alt="">
				</div>

				<ul class='CartPageAddUl'>

					<li>
						<div class="text-center">
							<p class='my_circle'>1</p>
							<p class="small mt-1 ">购物车</p>
						</div>

					</li>



					<li>
						<div class="text-center">
							<p class='my_circle'>2</p>
							<p class="small mt-1 ">确认订单</p>
						</div>

					</li>
					<li>
						<div class="text-center">
							<p class='my_circle'>3</p>
							<p class="small mt-1 ">支付</p>
						</div>

					</li>
					<li>
						<div class="text-center">
							<p class='my_circle'>4</p>
							<p class="small mt-1 ">完成</p>
						</div>

					</li>
				</ul>
			</div>
		</header>


		<!--中部-->
		<div class="container-fluid pl-0 pr-0">
			<div id="section">
				<ul class="CartAddClassSort">
					<li><a href="#">全部商品 2</a></li>
					<li><a href="#">优惠 2</a></li>
					<li><a href="#">库存紧张 0</a></li>
				</ul>


				<table class="table CartTableClass">
					<tr>
						<th><input type="checkbox" class="my_input"></th>
						<th colspan="2">商品信息</th>
						<th>单价（元）</th>
						<th>数量</th>
						<th>小计（元）</th>
						<th>操作</th>
					</tr>
					<tr>
						
						<td colspan="6"><span class="text-dark font-weight-bold">浓妆公主</span>
							<span>满88元减3</span> <span><a href="#">优惠券</a></span> <span>去店铺凑单
								></span></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="my_input"></td>
						<td>
							<div class="CartAddFlex">
								<div>
									<img src="./static/img/index/02.webp" alt="" class="my_img">
									<p>减价5.81元</p>
								</div>
								<p class='ml-2'>2018春秋新款韩版纯色毛衣外套中长款宽松显瘦连帽女针织开衫</p>
							</div>
						</td>
						<td><span>颜色：灰色</span>
							<p>尺码：L</p></td>
						<td><i class="CartLine">58.16</i>
							<p class="mb-1 text-muted">34.90</p>
							<p class="text-danger mt-0">拼团价</p></td>
						<td>
						<div class='d-flex align-items-center'>
							<button class="my_btn">-</button> <input type="text"
							class="my_input1" value="1">
							<button class="my_btn">+</button>
							</div>
						</td>
						<td class="text-danger h5">34.90</td>
						<td>删除</td>
					</tr>

					<tr>
						<td><input type="checkbox" class="my_input"></td>

						<td>
							<div class="CartAddFlex">
								<div class="float-left mr-2">
									<img src="./static/img/index/02.webp" alt="" class="my_img">
									<p class="text-center small text-danger">减价5.81元</p>
								</div>
								<p class="small">2018春秋新款韩版纯色毛衣外套中长款宽松显瘦连帽女针织开衫</p>
							</div>
						</td>
						<td><span>颜色：灰色</span>
							<p>尺码：L</p></td>
						<td><i class="CartLine">58.16</i>
							<p class="mb-1 text-muted">25.90</p>
							<p class="text-danger mt-0">拼团价</p></td>
						<td>
						<div class='d-flex align-items-center'>
							<button class="my_btn">-</button> <input type="text"
							class="my_input1" value="1">
							<button class="my_btn">+</button>
							</div>
						</td>
						<td class="text-danger h5">25.90</td>
						<td><a data-toggle="modal" data-target="#myModal" href='javascritp:'>删除</a></td>
					</tr>
				</table>
				<div id="my_money" class="CartFooter">
				<div>
					<input type="checkbox" class="my_input"> <span>全选</span>
				</div>
					 <span>删除</span> <span>清空失效商品</span>
					<span>移入收藏夹</span> <span>共有 <b class="text-danger">2</b> 件商品
					</span>
					<button class="my_btn1" onclick='goToPage()'>去支付 ></button>
				</div>
			</div>
		</div>
	</section>
	<%@ include file='../common/footer.jsp'%>
	<!--弹窗-->
<div>

 <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
        	<div class='MyModalBody'>
        		<img src="./static/img/index/02.webp" alt="">
        		<p>2018春秋新款韩版纯色毛衣外套中长款宽松显瘦连帽女针织开衫</p>
        		<div class='CartBtn'>
        			<button>确认删除</button>
        			<button>取消</button>
        		</div>
        	</div>
        </div> 
      </div>
    </div>
  </div>
  
</div>

	<script src="./static/javascript/cart.js"></script>
	<script>
		function goToPage(){
			window.location.href = './pay.jsp';
		}
	</script>
</body>
</html>