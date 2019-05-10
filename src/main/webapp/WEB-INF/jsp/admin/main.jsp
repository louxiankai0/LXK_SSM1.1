<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<style type="text/css">
		#header {
			position: fixed;
			width: 100%;
			height: 100px;
			top: 0px;
			left: 0px;
			background-color: #6495ED;
		}

		#header .logotext {
			position: absolute;
			top: 20px;
			left: 40px;
			font-size: 300%;
			font-family: "YouYuan";
			color: #FFFFFF;
			font-weight: bold;
		}

		#header .userInfo {
			margin-top: 60px;
			bottom: 0px;
			text-align: center;
		}

		.time {
			position: absolute;
			bottom: 0px;
			color: #fff;
			margin-left: 35%;
			font-size: 15px;
			font-family: "仿宋";
		}
		#header .navi{
			height: 100px;
			position: absolute;
			top:20px;
			bottom: 5px;
			right: 10%;

		}
		#header ul{
			font-size: 15px;
			text-align: center;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: rgba(100,190,255,0.4);

		}
		#header li{
			float: left;
			border-right: 1px solid #6495ED;
		}
		#header ul li a{
			text-decoration: none;
			display: block;
			color: #FFFFFF;
			text-align: center;
			padding:20px;
			text-decoration: none;
		}
		#header ul li a:hover {
			color: #000000;
			text-decoration: none;
			background-color:rgba(255,255,255,0.8);

		}
		#header .userInfo {
			position: absolute;
			width: 180px;
			right: 30px;
			bottom: 20px;
			text-align: right;
		}

		#header .logout {
			position: absolute;
			top: 20px;
			right: 60px;
			font-size: 30px;
			color: #F5F5F5;
			cursor: pointer;
		}

		#header .logout:hover {
			border-radius: 5px;
			box-shadow: #F5F5F5 0px 0px 5px 5px;
		}
		#content{
			position: fixed;
			top:100px;
			right: 20px;
			bottom: 10px;
			left: 210px;
		}
		#footer {
			position: fixed;
			width: 100%;
			height: 20px;
			bottom: 0px;
			left: 0px;
			background-color: #6495ED;
		}
		#sideBar {
			position: fixed;
			width: 200px;
			top: 100px;
			bottom: 10px;
			left: 0px;
			background-color: #7EC0EE;
		}

		#sideBar ul {
			width: 190px;
			margin: 5px auto 0px;
			background-color: #F5F5F5;
			border-radius: 5px;
		}

		#sideBar ul li a {
			text-align: center;
		}
		#main {
			position: fixed;
			top: 100px;
			right: 0px;
			bottom: 10px;
			left: 200px;
		}
	</style>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function openOrCloseMenu(nodeId) {
			// 获取所有自己菜单节点
			var subNodes = $("#sideBar ul li[parentId=" + nodeId + "]");
			// 判断菜单是否关闭
			if (subNodes.css("display") == "none") { //关闭
				// 展开菜单，即显示子菜单节点
				subNodes.slideDown();
			} else { //展开
				subNodes.slideUp();
			}
		}
		function SupendButtonClick(obj) {
			//清空其它同类按钮选中颜色
			$('a[id^="SupendButton-"]').css("background-color", "#F5F5F5");//按钮原来颜色
			//点击后变色
			$(obj).css("background-color", "#BBBBBB");
		}
	</script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div id="header">
	<span class="logotext">共享服务平台</span>
	<span class="glyphicon glyphicon-log-out logout" onclick="location.href='exit'" title="退出"></span>
	<span class="userInfo">欢迎您:${auser.aname}!</span>

</div>
<div id="sideBar">
	<ul class="nav nav-pills nav-stacked">
		<li id="1" class="active" onclick="openOrCloseMenu(1)"><a>个人中心</a></li>
		<li parentId="1"><a href="adminGoods/selectGoods" target="center" id="SupendButton-one" onclick=SupendButtonClick(this);><span class="glyphicon glyphicon-list-alt"></span> 物品管理</a></li>
		<li parentId="1"><a href="adminType/selectType" target="center" id="SupendButton-two" onclick=SupendButtonClick(this);><span class="glyphicon glyphicon-tags"></span> 类型管理</a></li>
		<li parentId="1"><a href="adminUser/userInfo" target="center" id="SupendButton-three" onclick=SupendButtonClick(this);><span class="glyphicon glyphicon-user"></span> 用户管理</a></li>
		<li parentId="1"><a href="adminOrder/orderInfo" target="center" id="SupendButton-four" onclick=SupendButtonClick(this);><span class="glyphicon glyphicon-shopping-cart"></span> 订单管理</a></li>
		<li parentId="1"><a href="adminNotice/deleteNoticeSelect" target="center" id="SupendButton-five" onclick=SupendButtonClick(this);><span class="glyphicon glyphicon-comment"></span> 公告管理</a></li>
	</ul>
</div>
	<div id="main">
		<iframe src="adminGoods/selectGoods"  name="center" width="100%" height="100%" frameborder="no"></iframe>
	</div>
	<div id="footer">Copyright ©LXK毕业设计</div>
</body>
</html>


