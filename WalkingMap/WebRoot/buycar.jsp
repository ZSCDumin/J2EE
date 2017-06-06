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
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>

<!-- 分界线 -->
<link rel="stylesheet" href="css/carstyle.css"/>
<script type="text/javascript" src="js/demo.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
    <div class="navbar-header pull-left"> <a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> 中山学院电商管理系统 </small> </a> 
      <!-- /.brand --> 
    </div>
    <!-- /.navbar-header -->
    
    <div class="navbar-header pull-right" role="navigation">
      <ul class="nav ace-nav">
        <li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎光临,</small> ${sessionScope.username } </span> <i class="icon-caret-down"></i> </a>
          <ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
            <li><a href="#"> <i class="icon-cog"></i> 设置 </a></li>
            <li><a href="#"> <i class="icon-user"></i> 个人资料 </a></li>
            <li class="divider"></li>
            <li><a href="UserLoginOut"> <i class="icon-off"></i> 退出 </a></li>
          </ul>
        </li>
      </ul>
      <!-- /.ace-nav --> 
    </div>
    <!-- /.navbar-header --> 
  </div>
  <!-- /.container --> 
</div>

<div class="main-container " id="main-container"> 
  <script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
			
			
		 function getTotal(){
		  location.href="GiveMoney";	
			
			
			}
		</script>
        
        <div class="row">
  <div class="main-container-inner col-lg-10 col-xs-offset-1"> <a class="" id="menu-toggler" href="#"> <span
				class="menu-text"></span> </a>
    <div class="catbox ">
      <table id="cartTable">
        <thead>
          <tr>
            <th  width="10%"><label>
                <input class="check-all check" type="checkbox"/>
                &nbsp;&nbsp;全选</label></th>
            <th width="26%">商品</th>
            <th width="23%">单价</th>
            <th width="12%">数量</th>
            <th width="12%">小计</th>
            <th width="13%">操作</th>
          </tr>
        </thead>
        <tbody>
          <form>
          <c:forEach var="map" items="${sessionScope.car }">
            <tr>
            <td class=""><input class="check-one check" type="checkbox"/></td>
            <td class="goods"><img src="upload/${map.value.image }" alt="" width="100" height="80"/><span>${map.value.goodsname }</span></td>
            <td class="price">${map.value.price }</td>
            <td class="count">
            <!-- <span class="reduce"></span> -->
            
            <input class="count-input" type="hidden" value="${map.value.price }" disabled="disabled"/>
            <input class="count-input" type="text" value="${map.value.count }" disabled="disabled"/>
            
            <!--  <span class="add">+</span> -->
            </td>
            <td class="subtotal">${map.value.price*map.value.count }</td>
            <td class="operation"><span class="delete">删除</span></td>
          </tr>
          </c:forEach>
       
        </tbody>
      </table>
      <div class="foot" id="foot">
        <label class="fl select-all">
          <input type="checkbox" class="check-all check"/>
          &nbsp;&nbsp;全选</label>
        <a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
        <div class="fr closing" onclick="getTotal()">结 算</div>
        <input type="hidden" id="cartTotalPrice" />
        <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
        <div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
        <div class="selected-view">
          <div id="selectedViewList" class="clearfix">
            <div><img src="images/1.jpg"><span>取消选择</span></div>
          </div>
          <span class="arrow">◆<span>◆</span></span> </div>
      </div>
    </div>
  </div>
  </div>
   </form>
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
          <p>办公电话:  +12 34 995 0792</p>
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
            <input type="text" value="" onFocus="this.value='';" onBlur="if (this.value == '') {this.value ='';}">
            <input type="submit" value="Sign up">
          </form>
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script> 
</div>

<!-- /.main-container --> 

<!-- basic scripts --> 

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
