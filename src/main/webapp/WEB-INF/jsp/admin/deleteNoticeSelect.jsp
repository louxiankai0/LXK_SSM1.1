<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8");%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>selectGoods.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/list.css">

    <script type="text/javascript">
        /**
         * 添加
         */
        function add() {
            location.href = "adminNotice/toAddNotice";
        }
        function checkDel(id) {
            if (window.confirm("是否删除该公告？")) {
                window.location.href = "/ssm/adminNotice/deleteNotice?id=" + id;
            }
        }
    </script>
</head>
<body>
<div id="header">
    <ul class="nav nav-tabs">
        <li class="active"><a href="adminNotice/deleteNoticeSelect">公告管理</a></li>
    </ul>

</div>
<div id="content">
    <form id="form1" method="post" action="" class="form-inline">
        <input type="text" name="gname" placeholder="按事项名称搜索!" autofocus class="form-control input-sm"/>
        <input type="submit" value="搜 索" class="btn btn-warning btn-sm"/>
    </form>
    <form id="form2" action="#" name="deleteForm">
        <table class="table table-bordered table-hover">
            <tr>
                <th width="200px">ID</th>
                <th width="200px">标题</th>
                <th width="200px">时间</th>
                <th width="100px">详情</th>
                <th width="100px">操作</th>
            </tr>
            <c:forEach items="${allNotices }" var="notice">
                <td>${notice.id }</td>
                <td>${notice.ntitle }</td>
                <td>${notice.ntime }</td>
                <td><a href="adminNotice/selectANotice?id=${notice.id }" target="_blank">详情</a></td>
                <td>
                    <a href="javascript:checkDel('${notice.id }')">删除</a>
                </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div id="btn-group">
        <input type="button" value="添加" class="btn btn-primary btn-sm" onclick="add()"/>
    </div>
</div>
</body>
</html>