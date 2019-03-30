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
<title>订单详情</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">
			订单详情
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>购买数量</th>
						<th>操作</th>
						<th>归还日期</th>
					</tr>
					<tr>
						<td colspan="7" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mf" items="${myOrderDetail}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.id}</td>
							<td bgcolor="#ffffff"  align="center">${mf.gname}</td>
							<td align="center" bgcolor="#ffffff" height="60px">
								<img style="width: 50px; height: 50px;" src="logos/${mf.gpicture}" border="0" title="${mf.gname}"/>
							</td>
							<td align="center" bgcolor="#ffffff">${mf.grprice}</td>
							<td align="center" bgcolor="#ffffff">${mf.shoppingnum}</td>
							<td align="center" bgcolor="#ffffff">
								<c:if test="${mf.status == 0}" >
									未归还&nbsp;&nbsp;
									<a style="text-decoration: none;" class="f6" href="order/returnSubmit?oid=${mf.oid}&gid=${mf.id}&shoppingnum=${mf.shoppingnum}">去归还</a>
								</c:if>
								<c:if test="${mf.status == 1}" >
									已归还
								</c:if>
							</td>
							<td bgcolor="#ffffff"  align="center">
								<c:if test="${mf.status == 1}" >
									${mf.returndate}
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>