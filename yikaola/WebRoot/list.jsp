
<!Doctype html>
<html lang='en'>
<!-- 此处不可以换行 -->
<jsp:include page="./common/head.jsp" flush="true">
	<jsp:param value="衣佳首页" name="title" /></jsp:include>
<!-- 定义变量构造数据 -->
<style>
@import
'./static/css/list.css'
</style>
<body>
	<%@ include file='../common/header.jsp'%>
	<section class='ListPageClass'>
		<div>
			
			<div class="m-auto my_small" style="width: 1090px" id="body">
				<div class="clearfix  m-auto" style="width: 1090px">
					<!--第一行-->
					<h3 class="float-left my_small my_padding1 my_bg pl-2"
						style="width: 80px; height: 51px">
						<span class="">分类</span>
					</h3>
					<div class="float-left pt-3 pl-4 border-bottom">
						<ul class="list-unstyled">
							<li><a href="#">服装鞋包</a></li>
							<li><a href="#">女装</a></li>
							<li><a href="#">裤子</a></li>
							<li><a href="#">牛仔裤</a></li>
							<li><a href="#">男装</a></li>
							<li><a href="#">裤子</a></li>
							<li><a href="#">套装/学生校服/工作制服</a></li>
							<li><a href="#">时尚套装</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix ">
					<!--第二行-->
					<h3 class="float-left my_small my_padding1 pl-2">
						<span class="">尺码</span>
					</h3>
					<div class="float-left pt-3 pl-4 border-bottom">
						<ul class="list-unstyled">
							<li><a href="#">M</a></li>
							<li><a href="#">L</a></li>
							<li><a href="#">XL</a></li>
							<li><a href="#">S</a></li>
							<li><a href="#">XXL</a></li>
							<li><a href="#">均码</a></li>
							<li><a href="#">2XL</a></li>
							<li><a href="#">3XL</a></li>
							<li><a href="#">XS</a></li>
							<li><a href="#">XXXL</a></li>
							<li><a href="#">4XL</a></li>
							<li class="float-right"><a href="">多选</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix ">
					<!--第三行-->
					<h3 class="float-left my_small my_padding1 pl-2"
						style="width: 80px; height: 51px">
						<span class="">材质</span>
					</h3>
					<div class="float-left pt-3 pl-4 border-bottom">
						<ul class="list-unstyled">
							<li><a href="#">棉</a></li>
							<li><a href="#">其他</a></li>
							<li><a href="#">化纤</a></li>
							<li><a href="#">其他材质</a></li>
							<li><a href="#">复合</a></li>
							<li><a href="#">混纺</a></li>
							<li><a href="#">聚酯纤维</a></li>
							<li><a href="#">太空棉（空气层）</a></li>
							<li><a href="#">针织</a></li>
							<li class="float-right"><a href="#">多选</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix ">
					<!--第四行-->
					<h3 class="float-left my_small my_padding1 pl-2">
						<span class="">颜色</span>
					</h3>
					<div class="float-left pt-3 pl-4 border-bottom">
						<ul class="list-unstyled">
							<li><a href="#">黑色</a></li>
							<li><a href="#">白色</a></li>
							<li><a href="#">红色</a></li>
							<li><a href="#">灰色</a></li>
							<li><a href="#">蓝色</a></li>
							<li><a href="#">黄色</a></li>
							<li><a href="#">紫色</a></li>
							<li><a href="#">绿色</a></li>
							<li class="float-right"><a href="#">多选</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix ">
					<!--第五行-->
					<h3 class="float-left my_small my_padding1 pl-2">
						<span class="">领型</span>
					</h3>
					<div class="float-left pt-3 pl-4 border-bottom">
						<ul class="list-unstyled">
							<li><a href="#">连帽</a></li>
							<li><a href="#">圆领</a></li>
							<li><a href="#">其他领型</a></li>
							<li><a href="#">立领</a></li>
							<li><a href="#">高领</a></li>
							<li><a href="#">POLO领</a></li>
							<li><a href="#">半高领</a></li>
							<li><a href="#">V领</a></li>
							<li class="float-right"><a href="">多选</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix ">
					<!--第六行-->
					<h3 class="float-left my_small my_padding1 pl-2">
						<span class="">筛选</span>
					</h3>
					<div class="float-left pt-3 pl-4">
						<ul class="list-unstyled">
							<li><a href="#">风格</a></li>
							<li><a href="#">图案</a></li>
							<li><a href="#">元素</a></li>
							<li><a href="#">袖型</a></li>
							<li><a href="#">适用身高</a></li>
							<li><a href="#">细节</a></li>
							<li><a href="#">版型</a></li>
							<li><a href="#">其他</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="my_margin d-flex my_small pt-2 pl-2  "
				style="width: 1090px;" id="body1">
				<span class="pr-3 text-muted">你可能还想搜：</span>
				<ul class="list-unstyled">
					<li><a href="#">裤子</a></li>
					<li><a href="#">套衣</a></li>
					<li><a href="#">牛仔外套</a></li>
					<li><a href="#">卫衣套装</a></li>
					<li><a href="#">短款卫衣</a></li>
					<li><a href="#">棒球服</a></li>
					<li><a href="#">长袖卫衣</a></li>
					<li><a href="#">打底裤</a></li>
					<li><a href="#">长袖女T恤</a></li>
					<li><a href="#">短袖</a></li>
				</ul>
			</div>
			<div class="my_margin d-flex my_small pt-2 pb-2 pl-4"
				style="width: 1090px;" id="body2">
				<div class="mr-3">
					<a href="#" class="border-right text-danger">综合</a> <a href="#"
						class="border-right">销量</a> <a href="#" class="border-right">新品</a>
				</div>
				<div class="d-flex text-muted mr-3">
					<p class="mb-0 border ">
						<span>￥</span><input type="text">
					</p>
					<span class="pl-2 pr-2 ">-</span>
					<p class="mb-0 border mr-3">
						<span>￥</span><input type="text">
					</p>
					<button class="bg-white ">确定</button>
				</div>
				<div>
					<button class="pl-3 pr-3 rounded-0 bg-white ">50-80</button>
					<button class="pl-3 pr-3 bg-white  rounded-0">80-90</button>
					<button class="pl-3 pr-3 rounded-0 bg-white ">90-100</button>
				</div>
			</div>
			<div class="my_margin my_small pt-2 pb-2 " style="width: 1090px;"
				id="body3">
				<ul class="ListPageUl list-unstyled d-flex justify-content-between w-100">
					<li><a href="#"> <img src="img/pro_list/1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_2.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_3.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_2.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
				</ul>
				<!--第一行结束-->
				<ul class="ListPageUl list-unstyled d-flex justify-content-between w-100">
					<li><a href="#"> <img src="img/pro_list/1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span class="h6 text-dark">¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_2.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_3.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_3.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
				</ul>
				<!--第一行结束-->
				<ul class="ListPageUl list-unstyled d-flex justify-content-between w-100">
					<li><a href="#"> <img src="img/pro_list/1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_1.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_2.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_3.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
					<li><a href="#"> <img src="img/pro_list/1_3.webp" alt=""
							class="my_img">
							<p>快手红人同款包包女网红周周夏雪同款小方包流动链条单肩斜挎包</p> <span>¥249.9</span>
					</a></li>
				</ul>
				<!--第三行结束-->
			</div>
			<div class="m-auto my_small ListPageFlex" style="width: 1090px">
				<ul class="pagination">
					<li class="page-item disabled"><a href="#" class="page-link">上一页</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">...</a></li>
					<li class="page-item"><a href="#" class="page-link">68</a></li>
					<li class="page-item"><a href="#" class="page-link">下一页</a></li>
				</ul>
			</div>
		</div>
	</section>
	<%@ include file='../common/footer.jsp'%>
	<script src="./static/javascript/list.js"></script>
</body>
</html>






