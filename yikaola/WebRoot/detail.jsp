<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<style>
@import
'./static/css/detail.css'
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section>
		<div class='DetailPageTop'>
			<!--第一行-->
			<div class="d-flex" id="header1">
				<div class="DetailPageAddOne">
					<img src="./static/img/1-1.png" alt="" class="my_img">

					<div style="width: 240px" class="ml-3">
						<a href="#" class="text-dark my_small">猫亲鱼</a>
						<ul class="list-unstyled  mb-2  clearfix">
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
						<p class="small text-muted mb-0">
							描述<span class="text-success mr-2">4.59</span> 质量<span
								class="text-success mr-2">4.61</span> 服务<span
								class="text-danger">4.73</span>
						</p>
					</div>

					<div>
						<button class="my_small text-muted bg-transparent border-1">+收藏店铺</button>
						<button class="my_small text-muted bg-transparent border-1">私聊</button>
					</div>

				</div>

				<div class='DetailPageTwo'>
					<input type="text" class="my_input_w">
					<button class="my_button_bg mr-1 rounded-right">搜全店</button>
					<button class="my_button_bg rounded">搜本站</button>
				</div>
			</div>

			<!--第二行-->
			<div class="my_bg text-center text-white pt-4 pb-5 mt-1">
				<h1>猫亲鱼</h1>
				<h4>人的一生中 至少该有那么一次 会为了某一个人忘了自己</h4>
			</div>
			<!--导航栏-->
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">首页</a></li>
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">全部商品</a></li>
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">上装</a></li>
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">下装</a></li>
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">时尚套装</a></li>
				<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">时尚外套</a></li>
			</ul>

			<!--商品详情介绍-->
			<div class="d-flex DetailPageMain">
				<div>
					<!--此处实现放大镜效果-->
					<div class="my_hidden" style="height: 500px">
						<img src="./static/img/detail01.jpg" alt="" class="my_img1">
						<div id="mask" class="position-absolute d-none"></div>
						<!--小正方形-->
						<div id="super-mask" class="position-absolute"></div>
						<!--大的正方形-->
						<div id='div-lg' class="position-absolute d-none"></div>
						<!--用来存放大图片的div-->
					</div>

					<div class="my_margin my_card mt-1" style="width: 400px">
						<!--放置两个按钮-->
						<div class="NewClass">《</div>
						<div>
							<ul id="my_magn">
								<li><img src="./static/img/detail01.jpg" alt=""
									class="my_img2" data-md='./static/img/detail01.jpg'
									data-lg='./static/img/detail01.jpg'></li>
								<li><img src="./static/img/detail02.jpg" alt=""
									class="my_img2" data-md='./static/img/detail01.jpg'
									data-lg='./static/img/detail01.jpg'></li>
							</ul>
						</div>
						<div class="NewClass">》</div>
					</div>
				</div>
				<div class="small text-muted DetailCenter">
				
					<h4 class="font-weight-bold">2018秋季新款Chic韩版休闲长款纯色T恤女短袖连衣裙
						修身显瘦百搭简约基础款圆领长裙裙子</h4>
					<div>
						<div class="my_bg1 pt-2 pb-2 mb-3 pl-2">
							<p>
								<span class="font-weight-bold">现价：￥89.00</span> <span><i>￥172.50</i></span>
							</p>
							<p>
								<span class="text-danger">2人拼团：</span> <span
									class="text-danger h3">￥78.00</span> <span class="my_margin1">
									评价： 1 累积销量： 29 </span>
							</p>
							<p>魔豆折扣：该商品可使用魔豆低扣3% 价格</p>
							<p>
								店铺优惠：
								<!--小方制作-->
								<span class="border border-danger p-1 text-danger ">
									满99立减3元 </span><a href="#"
									class=" bg-danger btn  text-white rounded-0 p-0 my_small pt-1"
									style="width: 55px; height: 27px"> 领取</a> <span
									class="border border-danger p-1 text-danger "> 满199立减15元
								</span><a href="#"
									class=" bg-danger btn  text-white rounded-0 p-0 my_small pt-1"
									style="width: 55px; height: 27px"> 领取</a>
							</p>
						</div>
						<p>
							客服：
							<button class="bg-white">联系客服</button>
						</p>
						<p>颜色：</p>
						<p>尺码：</p>
						<p>
							数量：
							<button class="my_btn">-</button>
							<input type="text" placeholder="1" class="my_input">
							<button class="my_btn">+</button>
							<span>库存127件</span>
						</p>
						<p class="mb-4">
							<a href="#" class="btn bg-danger text-white rounded-0">2人拼团购买</a>
							<a href="#"
								class="btn bg-secondary text-white mr-2 ml-2 rounded-0">现价单独购买</a>
							<a href="#" class="btn bg-danger text-white rounded-0">购物车</a>
						</p>
						<p>收藏 分享 举报</p>
						<p>服务承诺：全国包邮 七天无理由退货 72小时发货 退货补运费</p>
						<p>支付方式：微信 支付宝 微博</p>
					</div>
				</div>
				<div>
					<h5 class="text-center text-muted">热卖推荐</h5>
					<ul class="list-unstyled">
						<li><img src="./static/img/detail04.jpg" alt="" class="my_img3">
							<p class="mb-0">￥124.9</p></li>
						<li><img src="./static/img/detail04.jpg" alt="" class="my_img3">
							<p class="mb-0">￥120.9</p></li>
						<li><img src="./static/img/detail04.jpg" alt="" class="my_img3">
							<p class="mb-0">￥122.9</p></li>
					</ul>
				</div>
			</div>

			<!--商品详情介绍完毕-->
			<div class="DetailInvite">
				<p class='d-flex align-items-center justify-content-between'>
					<span class="text-primary"> <span class="text-danger">蘑菇</span>拼团
						<span class="small">小伙伴发起的拼团:</span>
					</span> <span class="my_small"> 开团后邀请好友参团，人数不足自动退款。<a href=""
						class="my_small text-muted">详细规则</a>
					</span>
				</p>

				<hr>

				<div class="DetailTime d-flex my_bg2 small align-items-center">
					<div>
						<img src="./static/img/1-1.png" alt="" class="rounded-circle">
						<span class="ml-2 mr-5">朴素的小市民</span>
					</div>

					<div>
						<p class="text-danger mb-0">还差一个人成团</p>
						<span class="text-muted">还剩47:40:25</span>
					</div>

					<div class="DetailGo my_bg3">
						<a href="#" class="text-danger">去参团</a>
					</div>
				</div>
			</div>


			<!--累计评价-->
			<div class="d-flex DetailComment">
				<!--左边的内容-->
				<div>
					<div id="my_xiaoshou" style="width: 198px" class="small text-muted">
						<p
							class="text-center bg-secondary text-dark pt-3 pb-3 font-weight-bold my_fixed">
							小手温柔衣橱欢迎您！</p>
						<ul class="list-unstyled clearfix pl-3 ">
							<li class="border-right mr-2 pr-2">
								<p>描述</p> <span class="text-success">4.41</span>
							</li>
							<li class="border-right mr-2 pr-2">
								<p>质量</p> <span class="text-success">4.41</span>
							</li>
							<li class="border-right mr-2 pr-2">
								<p>服务</p> <span class="text-success">4.41</span>
							</li>
						</ul>
						<div class="text-center mb-4">
							<button>收藏店铺</button>
							<button>进入店铺</button>
						</div>
						<div class="ml-3">
							<input type="text" style="width: 92px">
							<button>店内搜索</button>
						</div>

						<!--第一次出现空格-->
						<div class="mt-3 small">
							<p
								class="text-center bg-secondary text-dark pt-3 pb-3 font-weight-bold">本店分类</p>
							<ul class="DetailNoFloat clearfix list-unstyled text-center">
								<li class='DetailLeft'><a href="javascript:"> <img
										src="img/pro_detail/1-13.jpg" alt=""> <span
										class="text-muted">套装<i>￥45.00</i></span>
								</a></li>
							</ul>
						</div>

						<div class="mt-3 small">
							<p
								class="text-center bg-secondary text-dark pt-3 pb-3 font-weight-bold">看了有看</p>

							<ul class="DetailNoFloat clearfix list-unstyled text-center">

							</ul>
						</div>
					</div>
				</div>

				<!--中间的内容-->

				<div class="AddNewClass01">

					<div class="AddBtn">
						<button data-toggle='tab' data-target='#my_button1'>商品详情
						</button>

						<button data-toggle='tab' data-target='#my_button2'>
							累计评价（50）</button>

						<button data-toggle='tab' data-target='#my_button3'>
							本地同类商品</button>
					</div>

					<div id="my_button">
						<div id="my_button1">
							<h5>商品描述</h5>
							<h5>产品参数</h5>
							<table class="teble table-bordered">
								<tr>
									<td>薄厚：普通</td>
									<td>颜色：黑衣，半身裙，黑衣+半身裙</td>
									<td>季节：秋季</td>
								</tr>
								<tr>
									<td>材质：针织</td>
									<td>领形：圆领</td>
									<td>袖长：长袖</td>
								</tr>
								<tr>
									<td>款式：衣裙套装</td>
									<td>风格：原创</td>
									<td>尺码：S,L,M</td>
								</tr>
								<tr>
									<td>衣长：常规款（51-65cm）</td>
								</tr>
							</table>
							<h5>穿着效果</h5>
							<div class="text-center">
								<div>
									<img src="img/pro_detail/2-5.jpg" alt="">
								</div>
								<div>
									<img src="img/pro_detail/2-6.jpg" alt="" class="d-block">
								</div>
								<div>
									<img src="img/pro_detail/2-7.jpg" alt="">
								</div>
							</div>
							<h5>尺码说明</h5>
							<table class="table border">
								<tr class="bg-secondary">
									<th>尺码</th>
									<th>胸围</th>
									<th>腰围</th>
									<th>裙长</th>
									<th>袖长</th>
									<th>肩宽</th>
									<th>衣长</th>
								</tr>
								<tr>
									<td>S</td>
									<td>100</td>
									<td>64</td>
									<td>40</td>
									<td>53</td>
									<td>50</td>
									<td>56</td>
								</tr>
								<tr>
									<td>M</td>
									<td>104</td>
									<td>68</td>
									<td>41</td>
									<td>54</td>
									<td>51</td>
									<td>56</td>
								</tr>
								<tr>
									<td>L</td>
									<td>108</td>
									<td>72</td>
									<td>42</td>
									<td>55</td>
									<td>52</td>
									<td>57</td>
								</tr>
							</table>
							<h5>本地同类商品</h5>
						</div>
						<div id="my_button2"></div>
						<div id="my_button3"></div>
					</div>
				</div>
				<!--右边的内容-->

				<div class='DetailRight'>
					<button>手机扫码/下单二维码</button>
					<ul class="">
						<li><a href="#">商品描述</a></li>
						<li><a href="#">产品参数</a></li>
						<li><a href="#">穿着效果</a></li>
						<li><a href="#">尺码说明</a></li>
						<li><a href="#">商品推荐</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<%@ include file='../common/footer.jsp'%>
	<script src="./static/javascript/detail.js"></script>
</body>
</html>