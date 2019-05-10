<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%>
 <%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
	<link href="css/before/common.css" rel="stylesheet" type="text/css" />
	<link href="css/before/style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.loginform.submit();
	}
	//取消按钮
	function cancel(){
		document.loginform.action="";
	}
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	</script>
  </head>
  <body>
  <div class="clearfix">
	  <div class="blank20"></div>
	  <div class="box4">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				  <td width="100%" valign="bottom">
					  <h2>普通会员登录</h2>
				  </td>
			  </tr>
		  </table>
	  </div>
	  <div class="blank10"></div>
	  <div class="box4">
		  <div class="case_ll clearfix">
			  <div class="regist">
				  <form:form action="user/login" method="post" modelAttribute="buser"  name = "loginform">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0"
							 class="ttbb2">
						  <tr>
							  <td width="16%" align="right"><span class="cl_f30">*</span>
								  E-mail：</td>
							  <td width="59%"><input type="text" name="bemail"
													 id="textfield" class="my_txt_350" value="${buser.bemail}" /></td>
							  <td width="25%">${msg }</td>
						  </tr>
						  <tr>
							  <td align="right">&nbsp;</td>
							  <td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
								  （请输入正确的邮箱）</td>
						  </tr>
						  <tr>
							  <td align="right"><span class="cl_f30">*</span> 密码：</td>
							  <td><input type="password" name="bpwd" id="textfield2"
										 class="my_txt_350" /></td>
							  <td>&nbsp;</td>
						  </tr>
						  <tr>
							  <td align="right">&nbsp;</td>
							  <td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
								  （请输入正确的密码）</td>
						  </tr>
						  <tr>
							  <td align="right"><span class="cl_f30">*</span> 验证码：</td>
							  <td class="ared"><input type="text" name="code"
													  id="textfield5" class="my_txt_120" />
								  <img id="code" src="validateCode" />
								  <a href="javascript:refreshCode();"><span style="color: blue">看不清，换一个！</span></a>
							  </td>
							  <td>${codeError}</td>
						  </tr>
						  <tr>
							  <td align="right">&nbsp;</td>
							  <td colspan="2" class="cl_f30" style="font-size: 12px; padding-bottom: 25px;"></td>
						  </tr>
						  <tr>
							  <td align="right">&nbsp;</td>
							  <td height="50"><input type="button" name="button" id="button" onclick="gogo()" value="登录" class="my_ann1" /></td>
							  <td>&nbsp;</td>
						  </tr>
					  </table>
				  </form:form>
				  <div class="blank20"></div>
			  </div>
		  </div>
	  </div>
	  <div class="blank10"></div>
  </div>
  </body>
</html>
