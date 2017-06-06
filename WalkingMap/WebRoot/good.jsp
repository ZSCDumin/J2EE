<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>中山学院电商系统</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>

<!-- 分界线 -->
<link rel="stylesheet" href="css/carstyle.css" />
<script type="text/javascript" src="js/demo.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />


<script src="assets/js/ace-extra.min.js"></script>

</head>

<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {}
		</script>
		<script type="text/javascript">
			function login(s) {
				if (s == "") {
					location.href = "login.jsp";
				} else {
					alert("你已经登录");
				}
			}
			function car(s) {
				if (s == "") {
					alert("请登录后再购买商品");
					location.href = "login.jsp";
					return false;
				} else {
					location.href = "buycar.jsp";
					return true;
				}
			}
		
			function check(s) {
				var a = document.getElementById("count");
				if (a.value == 0) {
					alert("不买你添加个毛的购物车啊");
					a.value = 1;
				} else {
					if (a.value > s) {
						alert("你的数量比库存还多,禁止");
						a.value = 0;
					}
				}
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> 中山学院电商管理系统
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<div class="header-left">
				<div class="cart box_1">
					<a href="javascript:void(0)"
						onclick="car('${sessionScope.username }')">
						<h3>
							<img src="images/cart.png" alt="" />
						</h3>
					</a>
					<p>
						<a>购物车</a>
					</p>
				</div>
			</div>
			<div class="navbar-header pull-right" role="navigation"
				style="margin-left:350px">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎光临,</small> <c:choose>
									<c:when test="${empty sessionScope.username }">
							 游客
							 </c:when>
									<c:otherwise>
							${sessionScope.username } 
							</c:otherwise>
								</c:choose>

						</span> <i class="icon-caret-down"></i>
					</a>
						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="javascript:void(0)"
								onclick="login('${sessionScope.username }')"><i
									class="icon-cog"></i>登录 </a></li>
							<li><a href="#"> <i class="icon-user"></i> 个人资料
							</a></li>
							<li class="divider"></li>
							<li><a href="UserLoginOut"> <i class="icon-off"></i> 退出
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container container-flow" id="main-container"
		style="padding:0px; margin:0px">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {}
		</script>

		<div class="main-container-inner" style="padding:0px; margin:0px">



			<!-- #sidebar-shortcuts -->






			<div class="page-content" style="padding:0px; margin:0px">

				<!-- /.page-header -->

				<div class="row" style="padding:0px; margin:0px">
					<div class="container-flow" style="padding:0px; margin:0px">
						<!-- PAGE CONTENT BEGINS -->
						<div class="container-flow"
							style="background-image:url(assets/css/images/dianpu2.jpg);height:170px; background-position:0px,10px; background-repeat:no-repeat;">
							<br> <br> <br>
							<div
								style="color:#ffffff;font-family:仿宋;font-size:30px;text-align:center">
								${requestScope.good.users.username  }</div>
							<div class="row">
								<div class="col-lg-3 col-lg-offset-1">
									<span style="color:#FF1493;font-family:微软雅黑">搜索店内宝贝&nbsp;</span><input
										type="text">
								</div>
								<div class="col-lg-4"
									style="color:#EE7600;font-family:微软雅黑;font-size: 20px">&nbsp;欢迎来到我们的商店,我们将实时为您更新产品信息.</div>

								<script type="text/javascript">
									$(function() {
										$("#shoucang").toggle(); //点击收藏，变成实心
								
									});
								</script>
								<div class="col-lg-2 col-lg-offset-2">
									<div style="color:#ffffff;font-family:微软雅黑;font-size:14px">
										<i class="icon-heart-empty " id="shoucang"
											style="font-weight:800">&nbsp;收藏本店</i>
									</div>
								</div>
							</div>
							<br>

						</div>

						<div style="margin-top:38px">
							<div class="col-lg-10" style="border-right:#eeeeee solid 1px;"">
								<div class="row">
									<!-- 左边图片部分 -->
									<div class="col-md-4 col-md-offset-1">
										<a href="upload/${requestScope.good.image }" title="点击查看原图"
											data-rel="colorbox" class="cboxElement"> <img
											alt="图片加载失败" src="upload/${requestScope.good.image }"
											width="100%"></a>

									</div>
									<!-- 中间部分 -->
									<div class="col-lg-6" style="padding-left:35px">
										<p align=left
											style="color:#000000; font-family:微软雅黑;font-size:19px;font-weight:600">${requestScope.good.goodsname }</p>
										<span align=left
											style="color:#999; font-family:黑体;font-size:18px;margin-top:10px;">促销价</span>
										&nbsp; <span
											style="color:#ec2b2b;font-family:黑体;font-size:26px;font-weight:600">${requestScope.good.price }</span>

										<br> <br>
										<div align=left
											style="color:#999; font-family:黑体;font-size:16px">
											运费&nbsp;&nbsp;</span><span
												style="color:#000;font-family:黑体;font-size:16px;">北京海淀区</span><span
												style="color:#000;font-family:黑体;font-size:16px;">&nbsp;至&nbsp;</span><span
												style="color:#000;font-family:黑体;font-size:16px;">&nbsp;长沙&nbsp;</span>
											<span style="color:#000;font-family:黑体;font-size:15px;">快递
												0:00</span>
										</div>
										<br>
										<div>
											<script type="text/javascript">
												$(function() {
													alert("123");
												});
											</script>
											<form action="CarItem" method="post">
												<input type="hidden" value="${requestScope.good.id }"
													name="id"> <input type="hidden"
													value="${requestScope.good.price }" name="price"> <input
													type="hidden" value="${requestScope.good.image }"
													name="image"> <input type="hidden"
													value="${requestScope.good.goodsname }" name="goodsname">


												<span style="color:#999; font-family:黑体;font-size:16px">尺码&nbsp;</sapn>
													<span
													style="border:#eeeeee solid 1px;padding:3px;color:#000000">&nbsp;L&nbsp;</span>
													&nbsp;<span
													style="border:#eeeeee solid 1px;padding:3px;color:#000000">&nbsp;M&nbsp;</span>
													&nbsp;<span
													style="border:#eeeeee solid 1px;padding:3px;color:#000000">&nbsp;S&nbsp;</span>
										</div>
										<div>
											<br> <span align=left
												style="color:#999; font-family:黑体;font-size:16px">颜色分类</span>
											<span style="padding:4px;border:#eeeeee solid 1px;color:blue">&nbsp;图片色&nbsp;</span>
										</div>
										<div>
											<br> <span align=left
												style="color:#999; font-family:黑体;font-size:16px">数量&nbsp;&nbsp;</span>
											<span
												style="padding:4px;border:#eeeeee solid 1px;color:#000000">
												<input type="text" style="width:40px" name="count" value="1"
												onblur="check(${requestScope.good.count })" id="count">
											</span><span style="color:#999;font-family:黑体;font-size:15px">&nbsp;件&nbsp;&nbsp;</span>
											<span style="color:#999;font-family:黑体;font-size:14px">库存：</span>${requestScope.good.count }<span
												style="color:#999;font-family:黑体;font-size:14px">&nbsp;件</span>
										</div>
										<div>
											<br> <br>

											<button type="submit" class="btn btn-warning btn-lg"
												style="color:#ffffff;font-family:微软雅黑;font-size:18px;width:180px;text-align:center"
												onclick="return car('${sessionScope.username }')">立即购买</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




											<button type="submit" class="btn btn-warning btn-lg"
												style="color:#ffffff;font-family:微软雅黑;font-size:18px;width:180px;text-align:centers"
												onclick="return car('${sessionScope.username }')">
												<i class="icon-shopping-cart"></i>加入购物车
											</button>
											</form>
										</div>
										<!-- 中间部分      结束-->


									</div>
									<div class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div>
								<br>
								<hr color:#eeeeee>
								<br>
								<div class="row">
									<div class="col-lg-2 col-lg-offset-1"
										style="color:#000000;font-size:18px;font-family:微软雅黑">宝贝描述
										&gt;</div>

									<div class="col-lg-9">${requestScope.good.comment }</div>
								</div>
								<br> <br>



							</div>
						</div>
						<!-- 最右边别的宝贝    ----------   开始 -->
						<div class="col-md-2"
							style="color:2e0e0e; font-family:微软雅黑;font-size:16px;margin-lefht:0px">
							<p align=center style="color:#abcdef">— 看了又看 —</p>
							<br> <a href=""><img
								src="upload/${requestScope.good.image }" width="100%"></a> <br>
							<br> <br> <a href=""><img
								src="upload/${requestScope.good.image }" width="100%"></a> <br>
							<br> <br> <br> <br>
						</div>



					</div>
					<!-- /.col -->

				</div>
				<!-- /.row -->

			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
		<!-- 下面蓝色部分 -->
		<br> <br>
		<div class="footer" style="float: none">
			<div class="container">
				<div class="footer-top-at">
					<div class="col-md-4 amet-sed">
						<h4>更多</h4>
						<ul class="nav-bottom">
							<li><a href="#">购物流程</a></li>
							<li><a href="#">订单查询</a></li>
							<li><a href="contact.html">您的建议</a></li>
							<li><a href="#">物流查询</a></li>
							<li><a href="#">会员制度</a></li>
						</ul>
					</div>
					<div class="col-md-4 amet-sed ">
						<h4>联系我们</h4>
						<p>标准模块</p>
						<p>办公电话: +12 34 995 0792</p>
						<ul class="social">
							<li><a href="#"><i> </i></a></li>
							<li><a href="#"><i class="twitter"> </i></a></li>
							<li><a href="#"><i class="rss"> </i></a></li>
							<li><a href="#"><i class="gmail"> </i></a></li>
						</ul>
					</div>
					<div class="col-md-4 amet-sed">
						<h4>通讯方式</h4>
						<p>请在这里提交您的各种建议</p>
						<form>
							<input type="text" value="" onfocus="this.value='';"
								onblur="if (this.value == '') {this.value ='';}"> <input
								type="submit" value="Sign up">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->


	<!--[if !IE]> -->

	<script type="text/javascript">
		window.jQuery
		|| document
			.write("<script src='assets/js/jquery-2.0.3.min.js'>"
				+ "<" + "script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
				.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
					+ "<" + "script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/jquery.slimscroll.min.js"></script>
	<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
	<script src="assets/js/jquery.sparkline.min.js"></script>
	<script src="assets/js/flot/jquery.flot.min.js"></script>
	<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
	<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {
			$('.easy-pie-chart.percentage')
				.each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = $(this).data('color')
						|| (!$box.hasClass('infobox-dark') ? $box
							.css('color')
							: 'rgba(255,255,255,0.95)');
						var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
							: '#E2E2E2';
						var size = parseInt($(this).data('size')) || 50;
						$(this)
							.easyPieChart(
								{
									barColor : barColor,
									trackColor : trackColor,
									scaleColor : false,
									lineCap : 'butt',
									lineWidth : parseInt(size / 10),
									animate : /msie\s*(8|7|6)/
										.test(navigator.userAgent
											.toLowerCase()) ? false
										: 1000,
									size : size
								});
					})
	
			$('.sparkline').each(
				function() {
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box
						.css('color') : '#FFF';
					$(this).sparkline('html', {
						tagValuesAttribute : 'data-values',
						type : 'bar',
						barColor : barColor,
						chartRangeMin : $(this).data('min') || 0
					});
				});
	
			var placeholder = $('#piechart-placeholder').css({
				'width' : '90%',
				'min-height' : '150px'
			});
			var data = [ {
				label : "social networks",
				data : 38.7,
				color : "#68BC31"
			}, {
				label : "search engines",
				data : 24.5,
				color : "#2091CF"
			}, {
				label : "ad campaigns",
				data : 8.2,
				color : "#AF4E96"
			}, {
				label : "direct traffic",
				data : 18.6,
				color : "#DA5430"
			}, {
				label : "other",
				data : 10,
				color : "#FEE074"
			} ]
			function drawPieChart(placeholder, data, position) {
				$.plot(placeholder, data, {
					series : {
						pie : {
							show : true,
							tilt : 0.8,
							highlight : {
								opacity : 0.25
							},
							stroke : {
								color : '#fff',
								width : 2
							},
							startAngle : 2
						}
					},
					legend : {
						show : true,
						position : position || "ne",
						labelBoxBorderColor : null,
						margin : [ -30, 15 ]
					},
					grid : {
						hoverable : true,
						clickable : true
					}
				})
			}
			drawPieChart(placeholder, data);
	
			/**
			we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			so that's not needed actually.
			 */
			placeholder.data('chart', data);
			placeholder.data('draw', drawPieChart);
	
			var $tooltip = $(
				"<div class='tooltip top in'><div class='tooltip-inner'></div></div>")
				.hide().appendTo('body');
			var previousPoint = null;
	
			placeholder.on('plothover', function(event, pos, item) {
				if (item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : "
							+ item.series['percent'] + '%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({
						top : pos.pageY + 10,
						left : pos.pageX + 10
					});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
	
			});
	
			var d1 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d1.push([ i, Math.sin(i) ]);
			}
	
			var d2 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d2.push([ i, Math.cos(i) ]);
			}
	
			var d3 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.2) {
				d3.push([ i, Math.tan(i) ]);
			}
	
			var sales_charts = $('#sales-charts').css({
				'width' : '100%',
				'height' : '220px'
			});
			$.plot("#sales-charts", [ {
				label : "Domains",
				data : d1
			}, {
				label : "Hosting",
				data : d2
			}, {
				label : "Services",
				data : d3
			} ], {
				hoverable : true,
				shadowSize : 0,
				series : {
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				xaxis : {
					tickLength : 0
				},
				yaxis : {
					ticks : 10,
					min : -2,
					max : 2,
					tickDecimals : 3
				},
				grid : {
					backgroundColor : {
						colors : [ "#fff", "#fff" ]
					},
					borderWidth : 1,
					borderColor : '#555'
				}
			});
	
			$('#recent-box [data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('.tab-content')
				var off1 = $parent.offset();
				var w1 = $parent.width();
	
				var off2 = $source.offset();
				var w2 = $source.width();
	
				if (parseInt(off2.left) < parseInt(off1.left)
					+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
	
			$('.dialogs,.comments').slimScroll({
				height : '300px'
			});
	
			//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
			//so disable dragging when clicking on label
			var agent = navigator.userAgent.toLowerCase();
			if ("ontouchstart" in document && /applewebkit/.test(agent)
				&& /android/.test(agent))
				$('#tasks').on('touchstart', function(e) {
					var li = $(e.target).closest('#tasks li');
					if (li.length == 0)
						return;
					var label = li.find('label.inline').get(0);
					if (label == e.target || $.contains(label, e.target))
						e.stopImmediatePropagation();
				});
	
			$('#tasks').sortable({
				opacity : 0.8,
				revert : true,
				forceHelperSize : true,
				placeholder : 'draggable-placeholder',
				forcePlaceholderSize : true,
				tolerance : 'pointer',
				stop : function(event, ui) { //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
					$(ui.item).css('z-index', 'auto');
				}
			});
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click',
				function() {
					if (this.checked)
						$(this).closest('li').addClass('selected');
					else
						$(this).closest('li').removeClass('selected');
				});
	
		})
	</script>
</body>
</html>

