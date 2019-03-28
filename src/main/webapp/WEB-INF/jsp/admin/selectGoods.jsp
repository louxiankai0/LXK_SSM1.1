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
    <title>selectGoods.jsp</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	  <script src="js/jquery-3.3.1.min.js"></script>
	  <link rel="stylesheet" type="text/css" href="css/list.css">
	  <style type="text/css">

	  </style>
	  <script type="text/javascript">
		  /**
		   * 添加
		   */
		  function add() {
			  location.href = "adminGoods/toAddGoods";
		  }

		  /**
		   * 全选或反选
		   * @param {Object} current  触发事件的元素对象
		   */
		  function checkAll(current) {
			  $("input[name=ids]").prop("checked", current.checked);
		  }


		  function confirmDelete(){
			  var n = document.deleteForm.ids.length;
			  var count = 0;//统计没有选中的个数
			  for(var i = 0; i < n; i++){
				  if(!document.deleteForm.ids[i].checked){
					  count++;
				  }else{
					  break;
				  }
			  }
			  if(n > 1){
				  if(count == n){
					  alert("请选择被删除的商品！");
					  count = 0;
					  return false;
				  }
			  }else{
				  if(!document.deleteForm.ids.checked){
					  alert("请选择被删除的商品！");
					  return false;
				  }
			  }

			  if(window.confirm("真的删除吗？really?")){
				  document.deleteForm.submit();
				  return true;
			  }
			  return false;

		  }
	  </script>
	  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</head>
<body>
<div id="header">
	<ul class="nav nav-tabs">
		<li class="active"><a href="adminGoods/selectGoods">商品管理</a></li>
	</ul>

</div>

<div id="content">
	<form id="form1" method="post" action="adminGoods/selectGoods" class="form-inline">
		<input type="text" name="gname" placeholder="按事项名称搜索!" autofocus class="form-control input-sm" />
		<input type="submit" value="搜 索" class="btn btn-warning btn-sm" />
	</form>
	<form id="form2" action="adminGoods/deleteGoods" name="deleteForm">
	<table class="table table-bordered table-hover">
		<tr>
			<th><input type="checkbox" onclick="checkAll(this);" /></th>
			<th>ID</th>
			<th>名称</th>
			<th>原价</th>
			<th>现价</th>
			<th>库存</th>
			<th>详情</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${allGoods }" var="goods">
		<tr>
			<td><input type="checkbox" name="ids" value="${goods.id }"/></td>
			<td>${goods.id }</td>
			<td>${goods.gname }</td>
			<td>${goods.goprice }</td>
			<td>${goods.grprice }</td>
			<td>${goods.gstore }</td>
			<td><a href="adminGoods/selectAGoods?id=${goods.id }" target="_blank">详情</a></td>
			<td><a href="adminGoods/selectAGoods?id=${goods.id }&act=updateAgoods" target="center" >修改</a></td>
		</tr>
		</c:forEach>

		<tr>
			<td colspan="8" align="right">
				&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;共${totalPage}页&nbsp;&nbsp;
				第${pageCur}页&nbsp;&nbsp;
				<c:url var="url_pre" value="adminGoods/selectGoods">
					<c:param name="pageCur" value="${pageCur - 1 }"/>
				</c:url>
				<c:url var="url_next" value="adminGoods/selectGoods">
					<c:param name="pageCur" value="${pageCur + 1 }"/>
				</c:url>
				<!-- 第一页没有上一页 -->
				<c:if test="${pageCur != 1 }">
					<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<!-- 最后一页，没有下一页 -->
				<c:if test="${pageCur != totalPage && totalPage != 0}">
					<a href="${url_next}">下一页</a>
				</c:if>
			</td>
		</tr>

	</table>
		${msg}
	</form>
	<div id="btn-group">
		<input type="button" value="添加" class="btn btn-primary btn-sm" onclick="add()"/>
		<input type="button" value="删除" class="btn btn-danger btn-sm" onclick="confirmDelete()"/>
	</div>
</div>
</body>
</html>