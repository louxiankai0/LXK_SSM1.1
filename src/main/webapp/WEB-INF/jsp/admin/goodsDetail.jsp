<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 style="border-collapse: collapse">
		<caption>
			<a size=4 face=华文新魏>物品详情</a>
		</caption>
		<tr>
			<td>名称</td>
			<td>
				${goods.gname }
			</td>
		</tr>
		<tr>
			<td>原价</td>
			<td>
				${goods.goprice }
			</td>
		</tr>
		<tr>
			<td>租借价</td>
			<td>
				${goods.grprice }
			</td>
		</tr>
		<tr>
			<td>库存</td>
			<td>
				${goods.gstore }
			</td>
		</tr>
		<tr>
			<td>图片</td>
			<td>
				<c:if test="${goods.gpicture != '' }">
					<img alt="" width="250" height="250"
					src="logos/${goods.gpicture}"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>类型</td>
			<td>
				${goods.typename }
			</td>
		</tr>
	</table>
</body>
</html>