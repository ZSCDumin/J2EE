<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>行走的地图首页</title>

<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="shortcut icon"
	href="http://tympanus.net/Development/favicon.ico" />
<link rel="stylesheet" type="text/css" href="./css/normalize.css" />
<link rel="stylesheet" type="text/css" href="./css/vicons-font.css" />
<link rel="stylesheet" type="text/css" href="./css/base.css" />
<link rel="stylesheet" type="text/css" href="./css/buttons.css" />
<link rel="stylesheet" type="text/css" href="./css/demoadpacks.css" />
</head>

<body>

	<iframe name="header" width=100% height=100% marginwidth=0
		marginheight=0 frameborder="no" border="0"
		src="commonPages/header.html"> </iframe>
	<div class="bodyCon07">
		<div class="teacher">
			<div class="teacherPic">
				<div class="content" id="sirendingzhi1">
					<div class="txt">
						<h3>新疆</h3>
						<h4>草场丰腴、林木葱郁，有着“塞外江南”的美称</h4>
						<p>
							发团日期：7-10月<br /> 参考价格：5280元<br /> 摄影器材: 单反 广角 中长焦 三脚架等
						</p>
					</div>
				</div>
				<div class="content" id="sirendingzhi2">
					<div class="txt">
						<h3>云南</h3>
						<h4>东川红土地的炫彩、高原明珠——抚仙湖的柔美</h4>
						<p>
							发团日期：7-11月<br /> 参考价格：2780元<br /> 摄影器材: 单反 广角 中长焦 三脚架等
						</p>
					</div>
				</div>
				<div class="content" id="sirendingzhi3">
					<div class="txt">
						<a href="#">
							<h3>贵州</h3>
						</a>
						<h4>西江千户苗寨 以美丽回答一切</h4>
						<p>
							发团日期：7-12月<br /> 参考价格：2680元<br /> 摄影器材: 单反 广角 中长焦 三脚架等
						</p>
					</div>
				</div>
				<div class="content" id="sirendingzhi4">
					<div class="txt">
						<h3>色达</h3>
						<h4>地球上最后的一片净土，心灵净化之旅</h4>
						<p>
							发团日期：7-10月<br /> 参考价格：3900元<br /> 摄影器材: 单反 广角 中长焦 三脚架等
						</p>
					</div>
				</div>
				<div class="content" id="sirendingzhi5">
					<div class="txt">
						<h3>斯里兰卡</h3>
						<h4>印度洋上的一滴眼泪！</h4>
						<p>
							发团日期：6-12月<br /> 参考价格：1250美金<br /> 摄影器材: 单反 广角 中长焦 三脚架等
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(".content").hover(function() {
			$(this).children(".txt").stop().animate({
				height : "360px"
			}, 200);
			$(this).parent(".teacherPic").css({
				"background" : "url(images/" + ($(this).attr('id')) + ".jpg) no-repeat",
				"-webkit-transition" : "all 0.8s ease 0.2s",
				"transition" : "all 0.8s ease 0.2s"
			});
			/*			$(this) .parent(".teacherPic") .css("background","url(images/"+($(this).attr('id'))+".jpg) no-repeat");*/
			$(this).find(".txt h3").stop().animate({
				paddingTop : "130"
			}, 550);
			$(this).find(".txt p").stop().show();
		}, function() {
			$(this).children(".txt").stop().animate({
				height : "100px"
			}, 200);
			$(this).find(".txt h3").stop().animate({
				paddingTop : "0px"
			}, 550);
			$(this).find(".txt p").stop().hide();
		})
	</script>
	<div id="flashsale" class="main-flashsale">
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/jiangsu.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">苏州+南京+扬州3日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥5180</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="details.jsp" target=""> <img
				class="main-img" src="./images/guangdong.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="details.jsp" target="">广州+深圳+珠海2日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥6254</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/jiangxi.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">南昌+宜春+婺源4日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥4499</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/sichuan.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">成都+九寨沟5日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥4231</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>

	</div>
	<div id="flashsale" class="main-flashsale">
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/fujian.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">霞浦+鼓浪屿1日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥4796</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/heilongjiang.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">哈尔滨冰雪世界1日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥5136</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/jilin.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="#">长春1日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥2564</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
		<div>
			<a class="imgarea" href="" target=""> <img class="main-img"
				src="./images/liaoning.jpg" />
			</a>
			<div class="main-content">
				<a class="main-title" title="" href="" target="">沈阳+大连2日游</a>
				<div class="main-pricearea">
					<div class="main-pricearea-price">￥3368</div>
					<div class="main-pricearea-dw">元起</div>
				</div>
			</div>
		</div>
	</div>

	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)"
		width="75%" color=#987cb9 SIZE=10>

	<iframe name="footer" width=100% height=100% marginwidth=0
		marginheight=0 frameborder="no" border="0"
		src="commonPages/footer.html"> </iframe>
</body>

</html>
