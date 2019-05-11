<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<%
	
%>
<body>
	<%@ include file='../common/header.jsp'%>
	<div class="my-container Page IndexPage">
		<div class="my-input">
			<img class="my-img" src="./static/img/index/copy.png">
			<div class="input-container">
				<i class="icon iconfont icon-sousuo"></i> <input class="rel-input"
					placeholder="夏季衬衫" type="text">
				<div class="search">
					<i class="icon iconfont icon-sousuo"></i>
				</div>
			</div>
			<div class="my-cart">
				<a href="./cart.jsp">
					<i class="icon iconfont icon-shangcheng"></i> 
					<span class="cart">购物车</span>
				</a>
			</div>
		</div>
		<div class="my-navbar d-flex">
			<div class="left-nav d-flex">
				<i class="icon iconfont icon-caidan1"></i> <span>所有分类</span>
				<ul class="hover-show">
					<li><i class="icon iconfont icon-xiangshuicaizhuang"></i> <span>美容彩妆</span>
						<div class="meizhuang"></div></li>
					<li><i class="icon iconfont icon-muying"></i> <span>母婴儿童</span>
					</li>
				</ul>
			</div>
			<ul class="right-nav">
				<li><a href="./static/login.html?uid=1">首页</a></li>
				<li><a href="./list.jsp">男装</a></li>
				<li>女装</li>
				<li>儿童装</li>
				<li>夏季优惠服饰</li>
			</ul>
		</div>

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="./static/img/index/bg01.webp"
						alt="">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="./static/img/index/03.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="./static/img/index/04.jpg"
						alt="">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="./static/img/index/05.jpg"
						alt="">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>


		<div class="my-list">
			<a class="my-list-href" href="#"></a> <a class="my-list-href"
				href="#"></a> <a class="my-list-href" href="#"></a> <a
				class="my-list-href" href="#"></a>
		</div>

		<div class="my-intro">★口碑爆款★</div>

		<div class="my-section-p">
			<ul class="my-section">
				<li>
					<div class="show-border">
						<img src="./static/img/index/02.webp">
						<div class="change-color">
							<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
									5片/盒</a>
							</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
								class="my-first-span price"> <em> <i
									class="new-price">￥</i>69<i class="old">￥128</i>
							</em>
								<button class="my-buy">立即购买</button>
							</span>
						</div>
					</div>
				</li>
				<li><img src="./static/img/index/03.webp">
					<div class="change-color">
						<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
								5片/盒</a>
						</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
							class="my-first-span price"> <em> <i
								class="new-price">￥</i>69<i class="old">￥128</i>
						</em>
							<button class="my-buy">立即购买</button>
						</span>
					</div></li>
			</ul>
		</div>

		<div class="my-intro IndexPageBg">★正在热售★</div>
		<ul class="my-section">
			<li>
				<div class="show-border">
					<img src="./static/img/index/02.webp">
					<div class="change-color">
						<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
								5片/盒</a>
						</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
							class="my-first-span price"> <em> <i
								class="new-price">￥</i>69<i class="old">￥128</i>
						</em>
							<button class="my-buy">立即购买</button>
						</span>
					</div>
				</div>
			</li>
			<li><img src="./static/img/index/03.webp">
				<div class="change-color">
					<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
							5片/盒</a>
					</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
						class="my-first-span price"> <em> <i class="new-price">￥</i>69<i
							class="old">￥128</i>
					</em>
						<button class="my-buy">立即购买</button>
					</span>
				</div></li>
		</ul>
		<div class="my-intro">★猜你喜欢★</div>
		<ul class="my-section YouLike">
		</ul>
		<div class="my-intro IndexPageBg">★商家推荐★</div>
		<ul class="my-section">
			<li>
				<div class="show-border">
					<img src="./static/img/index/02.webp">
					<div class="change-color">
						<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
								5片/盒</a>
						</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
							class="my-first-span price"> <em> <i
								class="new-price">￥</i>69<i class="old">￥128</i>
						</em>
							<button class="my-buy">立即购买</button>
						</span>
					</div>
				</div>
			</li>
			<li><img src="./static/img/index/03.webp">
				<div class="change-color">
					<span class="my-first-span title"> <a href="#">Dr.Jart+宛若新生水漾保湿急救面膜
							5片/盒</a>
					</span> <span class="my-first-span sub-title">肌肤重现水润健康</span> <span
						class="my-first-span price"> <em> <i class="new-price">￥</i>69<i
							class="old">￥128</i>
					</em>
						<button class="my-buy">立即购买</button>
					</span>
				</div></li>
		</ul>
		<div class="toast"></div>
	</div>
	<%@ include file='../common/footer.jsp'%>
	<script src="./static/javascript/index.js"></script>
</body>
</html>
