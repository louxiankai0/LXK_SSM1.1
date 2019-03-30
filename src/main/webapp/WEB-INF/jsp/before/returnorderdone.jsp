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
<title>订单完成</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			//确定按钮
			function gogo(){
				document.returnForm.submit();
			}
		</script>
  </head>
  <body>
  	<div class="blank"></div>
	<div class="block clearfix"><!--当前位置-->
	<div class="location ared">当前位置：<a href="">首页</a> > 归还流程 > 生成订单</div>
	<div class="blank"></div>
	<div class="nFlowBox">
    <h2 style="text-align:center; height:30px; line-height:30px;">感谢您的归还！归还成功</h2><br/>
    </div>
    </div>
  </body>
</html>
