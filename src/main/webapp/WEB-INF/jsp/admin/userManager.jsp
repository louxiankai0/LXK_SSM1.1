<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/list.css">
    <style type="text/css">

    </style>
    <script type="text/javascript">
        function checkDel(id) {
            if (window.confirm("是否删除该用户？")) {
                window.location.href = "/ssm/adminUser/deleteuserManager?id=" + id;
            }
        }
    </script>
</head>
<body>
<div id="header">
    <ul class="nav nav-tabs">
        <li class="active"><a href="adminUser/userInfo">用户管理</a></li>
    </ul>

</div>
<div id="content">
    <form id="form2" action="#" name="deleteForm">
        <table class="table table-bordered table-hover">
            <tr>
                <th width="200px">用户ID</th>
                <th width="200px">用户E-mail</th>
                <th width="200px">用户密码</th>
                <th width="250px">删除</th>
            </tr>
            <c:forEach var="n" items="${userList}">
                <tr>
                    <td>${n.id}</td>
                    <td>${n.bemail}</td>
                    <td>${n.bpwd}</td>
                    <td>
                        <a href="javaScript:checkDel('${n.id}')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="4">${msg }</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>