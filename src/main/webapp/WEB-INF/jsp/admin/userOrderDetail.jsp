<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>详细订单管理</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	  <script src="js/jquery-3.3.1.min.js"></script>
	  <link rel="stylesheet" type="text/css" href="css/list.css">
	  <style type="text/css">

	  </style>
	  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


  </head>
  <body>
  <div id="header">
	  <ul class="nav nav-tabs">
		  <li class="active"><a href="adminOrder/orderInfo">订单管理</a></li>
	  </ul>

  </div>

  <div id="content">

	  <form id="form2" action="#" name="deleteForm">
		  <table class="table table-bordered table-hover">
			  <tr>
				  <th>商品编号</th>
				  <th>商品名称</th>
				  <th>商品价格</th>
				  <th>购买数量</th>
				  <th>是否归还</th>
				  <th>归还日期</th>
			  </tr>
			  <c:forEach items="${myOrderDetail }" var="ord">
				  <tr>
					  <td>${ord.id}</td>
					  <td>${ord.gname}</td>
					  <td>${ord.grprice}</td>
					  <td>${ord.shoppingnum}</td>
					  <td><c:if test="${ord.status == 0}" ><a style="color: red">未归还</a></c:if><c:if test="${ord.status == 1}" >已归还</c:if></td>
					  <td>
						  <c:if test="${ord.status == 0}" >
							  <a style="color: red">
							  无归还日期
							  </a>
						  </c:if>
						  <c:if test="${ord.status == 1}">
							 ${ord.returndate}
						  </c:if>
						  &nbsp;
					  </td>
				  </tr>
			  </c:forEach>

		  </table>
		  ${msg}
	  </form>
  </div>
  </body>
</html>
	<%--<link href="css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className="bgcolor";
		}
		function changeColor1(obj){
			obj.className="";
		}
		function checkDel(id){
  			if(window.confirm("是否删除该订单？")){
  				window.location.href="/ssm/adminOrder/deleteorderManager?id="+id;
  			}
  		}
	</script>
</head>
<body>
	<br>
	<table border="1" bordercolor="PaleGreen">
		<tr>
			<th width="150px">订单编号</th>
			<th width="150px">用户E-mail</th>
			<th width="100px">订单金额</th>
			<th width="100px">订单状态</th>
			<th width="150px">订单日期</th>
			<th width="100px">操作</th>
		</tr>
		<c:forEach var="n" items="${orderList}">
		<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
			<td>${n.id}</td>
			<td>${n.bemail}</td>
			<td>${n.amount}</td>
			<td><c:if test="${n.status == 0}" >未付款</c:if><c:if test="${n.status == 1}" >已付款</c:if></td>
			<td>${n.orderdate}</td>
			<td>
				<c:if test="${n.status == 0}" >
					<a href="javaScript:checkDel('${n.id}')">删除</a>
				</c:if>
				&nbsp;
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>--%>