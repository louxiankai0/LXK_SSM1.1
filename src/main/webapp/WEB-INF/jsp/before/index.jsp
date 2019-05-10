<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		function openNotice(url){
			window.open (url, '站内公告', 'height=400, width=400, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');
		}
</script>
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<!--租借排行-->
			<div class="box">
				<div class="box_2">
					<div class="top10Tit">
						<span>租借排行</span>
					</div>
					<div class="top10List clearfix">
						<!-- varStatus用来表示迭代的状态，可以访问到迭代自身的信息,index当前迭代从0开始 -->
						<c:forEach items="${salelist }" var="sg" varStatus="status">
							<ul class="clearfix">
								<img class="iteration" src="images/before/top_${status.index+1 }.gif" />
								<li class="topimg">
								<a href="goodsDetail?id=${sg.id }"> 
									<img class="samllimg" alt="" src="logos/${sg.gpicture}" /></a></li>
								<li class="iteration1">
								<a href="goodsDetail?id=${sg.id }">${sg.gname }</a><br />
								 租借价：<a class="f1">￥${sg.grprice }元/次</a><br /></li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--租借排行 end -->
			<!--人气排行-->
			<div class="blank5"></div>
			<div class="box">
				<div class="box_2">
					<div class="top10Tit">
						<span>人气排行</span>
					</div>
					<div class="top10List clearfix">
					<c:forEach items="${focuslist }" var="sg" varStatus="status">
						<ul class="clearfix">
							<img class="iteration" src="images/before/top_${status.index+1 }.gif" />
							<li class="topimg">
							<a href="goodsDetail?id=${sg.id }"> 
								<img class="samllimg" alt="" src="logos/${sg.gpicture}" /></a></li>
							<li class="iteration1">
							<a href="goodsDetail?id=${sg.id }">${sg.gname }</a><br />
							 租借价：<a class="f1">￥${sg.grprice }元/次</a><br /></li>
						</ul>
					</c:forEach>
					</div>
				</div>
			</div>
			<!--人气排行 end -->
		</div>
		<div class="AreaR">
			<div class="AreaR">
				<div class="AreaM clearfix">
					<div id="focus">
						<img src="images/before/share.jpg" />
					</div>
				</div>
				<div class="AreaRR clearfix">
					<!--公告栏-->
					<div class="box">
						<div class="box_1">
							<div class="title_bt">
								<h3>公告栏</h3>
							</div>
							<div class="post_list ared">
								<ul>
								<c:forEach items="${noticelist}" var="nt">
									<li><a href="javascript:openNotice('/ssm/selectANotice?id=${nt.id }');">${nt.ntitle }</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--公告栏 end-->
				</div>
			</div>
			<div class="AreaR">
				<!--最新物品列表-->
				<div class="blank5"></div>
				<div class="box">
					<div class="box_color ared">
						<div class="title_bt">
							<span><a href="moreDetail">更多</a></span>
							<h3>最新物品</h3>
						</div>
						<div class="itemgood_nr clearfix">
							<ul>
								<c:forEach items="${lastedlist }" var="sg">
									<li>
										<div>
											<p class="pic">
												<a href="goodsDetail?id=${sg.id }">
												<img src="logos/${sg.gpicture}" /></a>
											</p>
											<p class="wz">
												<!-- strong加粗 -->
												<strong><a href="goodsDetail?id=${sg.id }">${sg.gname }</a></strong>
												<em>租借价:<span>￥${sg.grprice}/次</span></em>
											</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!--最新物品列表end-->
			</div>
		</div>
	</div>
</body>
</html>
