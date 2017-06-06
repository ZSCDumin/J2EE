<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />



<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />



<script src="assets/js/ace-extra.min.js"></script>

</head>

<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
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

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">


					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎光临,</small>
								${sessionScope.username }
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#"> <i class="icon-cog"></i> 设置
							</a></li>

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

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">

					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active"><a href="#"> <i class="icon-dashboard"></i>
							<span class="menu-text"> 管理 </span>
					</a></li>


					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-desktop"></i> <span class="menu-text"> <c:choose>
									<c:when test="${sessionScope.user.rowid  eq 1 }">
 超级管理员
    	                        </c:when>
									<c:when test="${sessionScope.user.rowid  eq 3 }">
                                   卖家
    	                        </c:when>

								</c:choose>
						</span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><c:choose>
									<c:when test="${sessionScope.user.rowid  eq 1 }">
										<a href="addUser.jsp?rowid=1"> <i
											class="icon-double-angle-right"></i> ${functionlist.get(0) }
										</a>
									</c:when>
									<c:when test="${sessionScope.user.rowid  eq 3 }">
										<a href="addGoods.jsp?rowid=1"> <i
											class="icon-double-angle-right"></i>${functionlist.get(0) }
										</a>
									</c:when>

								</c:choose></li>

							<li><c:choose>
									<c:when test="${sessionScope.user.rowid  eq 1 }">
										<a href="deleteUser.jsp?rowid=1"> <i
											class="icon-double-angle-right"></i> ${functionlist.get(2) }

										</a>
									</c:when>
									<c:when test="${sessionScope.user.rowid  eq 3 }">
										<a href="deleteGoods.jsp"> <i> <class="icon-double-angle-right"></i>
											${functionlist.get(1) }
										</a>
									</c:when>
								</c:choose></li>

							<li><c:choose>
									<c:when test="${sessionScope.user.rowid  eq 1 }">
										<a href="findAllUser"> <i class="icon-double-angle-right"></i>
											${functionlist.get(1) }

										</a>
									</c:when>
									<c:when test="${sessionScope.user.rowid  eq 3 }">
										<a href="LocateGoods.jsp"> <i> <class="icon-double-angle-right"></i>
											${functionlist.get(2) }

										</a>
									</c:when>
								</c:choose></li>

							<li><c:choose>
									<c:when test="${sessionScope.user.rowid  eq 1 }">
										<a href="locateUser.jsp"> <i
											class="icon-double-angle-right"></i> ${functionlist.get(3) }

										</a>
									</c:when>
									<c:when test="${sessionScope.user.rowid  eq 3 }">
										<a href="LocateGoods.jsp"> <i> <class="icon-double-angle-right"></i>
											${functionlist.get(3) }
										</a>
									</c:when>
								</c:choose></li>



							<ul class="submenu">
								<li><a href="#"> <i class="icon-plus"></i> 添加产品
								</a></li>

								<li><a href="#"> <i class="icon-eye-open"></i> 查看商品
								</a></li>
							</ul></li>
				</ul>
				</li>
				</ul>
				</li>



				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
						<li class="active">管理</li>
					</ul>
					<!-- .breadcrumb -->

				</div>

				<div class="page-content">
					<div class="page-header">
						<h1>
							管理 <small> <i class="icon-double-angle-right"></i> 查看
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>

								<i class="icon-ok green"></i> 欢迎使用 <strong class="green">
								中山学院电商管理系统 <small>(v1.2)</small>
								</strong>
							</div>

							<br> <br>


							<table class="table table-striped" align="left"
								style="font-size:17px">
								<tr class="container-flow"
									style="font-size:16px;font-family:微软雅黑; text-align:center">
									<td class="col-lg-2">用户名</td>
									<td class="col-lg-2">密码</td>
									<td class="col-lg-2">邮箱</td>
									<td class="col-lg-2">身份</td>
									<td class="col-lg-2">操作</td>

								</tr>
								<c:forEach var="user" items="${list}">
									<tr style="text-align: center;">
										<td class="col-lg-2">${user.username}</td>
										<td class="col-lg-2">${user.password}</td>
										<td class="col-lg-2">${user.email}</td>
										<td class="col-lg-2"><c:choose>
												<c:when test="${user.rowid eq 1}">
													<p style="color: red;">管理人员</p>
												</c:when>
												<c:when test="${user.rowid eq 2}">
    								买家
    					</c:when>
												<c:otherwise>
    						卖家
    					</c:otherwise>
											</c:choose></td>
										<td class="col-lg-2"><a
											href="modifyUser?userid=${user.id }">修改</a></td>

									</tr>

								</c:forEach>


							</table>
							

							<ul class="pagination">
								<li class="disabled"><a href="findAllUser?page=${param.page-1 }"> <i
										class="icon-double-angle-left"></i>
								</a></li>

								<li ><a href="findAllUser?page=1">1</a></li>
								<c:forEach var="i" begin="2" end="${page }">

									<li ><a href="findAllUser?page=${i }">${i }</a></li>
								</c:forEach>

								<li ><a href="findAllUser?page=${param.page+1 }"> <i class="icon-double-angle-right"></i>
								</a></li>
							</ul>


							<div class="ace-settings-container" id="ace-settings-container">
								<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
									id="ace-settings-btn">
									<i class="icon-cog bigger-150"></i>
								</div>

								<div class="ace-settings-box" id="ace-settings-box">
									<div>
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="default" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; 选择皮肤</span>
									</div>

									<div>
										<input type="checkbox" class="ace ace-checkbox-2"
											id="ace-settings-navbar" /> <label class="lbl"
											for="ace-settings-navbar"> 固定导航条</label>
									</div>

									<div>
										<input type="checkbox" class="ace ace-checkbox-2"
											id="ace-settings-sidebar" /> <label class="lbl"
											for="ace-settings-sidebar"> 固定滑动条</label>
									</div>

									<div>
										<input type="checkbox" class="ace ace-checkbox-2"
											id="ace-settings-breadcrumbs" /> <label class="lbl"
											for="ace-settings-breadcrumbs">固定面包屑</label>
									</div>

									<div>
										<input type="checkbox" class="ace ace-checkbox-2"
											id="ace-settings-rtl" /> <label class="lbl"
											for="ace-settings-rtl">切换到左边</label>
									</div>

									<div>
										<input type="checkbox" class="ace ace-checkbox-2"
											id="ace-settings-add-container" /> <label class="lbl"
											for="ace-settings-add-container"> 切换窄屏 <b></b>
										</label>
									</div>
								</div>
							</div>
							<!-- /#ace-settings-container -->
						</div>
						<!-- /.main-container-inner -->


					</div>
					<!-- /.main-container -->

					<!-- basic scripts -->


					<!--[if !IE]> -->

					<script type="text/javascript">
						window.jQuery
								|| document
										.write("<script src='assets/js/jquery-2.0.3.min.js'>"
												+ "<"+"script>");
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
											+ "<"+"script>");
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
												var $box = $(this).closest(
														'.infobox');
												var barColor = $(this).data(
														'color')
														|| (!$box
																.hasClass('infobox-dark') ? $box
																.css('color')
																: 'rgba(255,255,255,0.95)');
												var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
														: '#E2E2E2';
												var size = parseInt($(this)
														.data('size')) || 50;
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

							$('.sparkline')
									.each(
											function() {
												var $box = $(this).closest(
														'.infobox');
												var barColor = !$box
														.hasClass('infobox-dark') ? $box
														.css('color')
														: '#FFF';
												$(this)
														.sparkline(
																'html',
																{
																	tagValuesAttribute : 'data-values',
																	type : 'bar',
																	barColor : barColor,
																	chartRangeMin : $(
																			this)
																			.data(
																					'min') || 0
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

							placeholder.on('plothover', function(event, pos,
									item) {
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
							if ("ontouchstart" in document
									&& /applewebkit/.test(agent)
									&& /android/.test(agent))
								$('#tasks').on(
										'touchstart',
										function(e) {
											var li = $(e.target).closest(
													'#tasks li');
											if (li.length == 0)
												return;
											var label = li.find('label.inline')
													.get(0);
											if (label == e.target
													|| $.contains(label,
															e.target))
												e.stopImmediatePropagation();
										});

							$('#tasks').sortable({
								opacity : 0.8,
								revert : true,
								forceHelperSize : true,
								placeholder : 'draggable-placeholder',
								forcePlaceholderSize : true,
								tolerance : 'pointer',
								stop : function(event, ui) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
									$(ui.item).css('z-index', 'auto');
								}
							});
							$('#tasks').disableSelection();
							$('#tasks input:checkbox')
									.removeAttr('checked')
									.on(
											'click',
											function() {
												if (this.checked)
													$(this).closest('li')
															.addClass(
																	'selected');
												else
													$(this).closest('li')
															.removeClass(
																	'selected');
											});

						})
					</script>
</body>
</html>

