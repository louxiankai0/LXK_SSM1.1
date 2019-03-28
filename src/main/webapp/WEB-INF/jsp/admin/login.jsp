<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
  <base href="<%=basePath%>">
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台登录</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}

		html,
		body {
			width: 100%;
			height: 100%;
			display: flex;
			align-items: center;
			font-size: 16px;
			background-color: #6485ED;
		}

		.login {
			width: 300px;
			height: 300px;
			margin: auto;
			background: #ccf0f1;
		}

		.login:before {
			display: block;
			content: '';
			width: 100%;
			height: 6px;
			background-image: -webkit-linear-gradient(left, #27ae60 0%, #27ae60 20%, #8e44ad 20%, #8e44ad 40%, blue 40%,
			blue 60%, #abc 60%, #abc 80%, #8a12ad 80%, #8a12ad 100%);
			border-radius: 6px 6px 0 0;
		}

		h2 {
			text-align: center;
			font-size: 2rem;
			color: #368;
			line-height: 80px;
		}

		.loginContent {
			display: flex;
			flex-direction: column;
			justify-content: space-around;
			align-items: center;
			width: 100%;
			height: 200px;
			background-color: #ccc;
		}

		.loginContent input {
			width: 80%;
			height: 40px;
			border: 1px solid #bbb;
			font-size: 1.2rem;
			border-radius: 6px;
			outline: 0;
			text-indent: 1rem;
		}

		.loginContent input[type='submit'] {
			text-indent: 0;
			background: #e74c3c;
			color: #fff;
			cursor: pointer;
		}
		.loginContent input[type='reset'] {
			text-indent: 0;
			background: #e74c3c;
			color: #fff;
			cursor: pointer;
		}
	</style>
	  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript">
	//确定按钮 0表示当前页面第一个表单
	function gogo(){
		document.forms[0].submit();
	}
	</script>
  </head>
  <body>

  <div class="login">
	  <h2>Login</h2>
	  <form action="admin/login" class="loginContent" method="post">
		  <input type="text" name="aname" placeholder="请输入用户名">
		  <input type="password" name="apwd" placeholder="请输入密码">
		  <input type="submit" value="登录" onclick="gogo()">
	  </form>
      ${msg}
  </div>
  </body>
</html>
