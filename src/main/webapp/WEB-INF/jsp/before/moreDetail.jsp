<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页</title>
    <link href="css/before/daohang.css" rel="stylesheet" type="text/css"/>
    <link href="css/before/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/before/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="blank"></div>
<div class="block clearfix">
    <!--最新物品列表-->
    <div class="blank5"></div>
    <div class="box">
        <div class="box_color ared">
            <div class="title_bt">
                <h3>所有物品</h3>
            </div>
            <div class="itemgood_nr clearfix">
                <ul>
                    <c:forEach items="${lastedlist }" var="sg">
                        <li>
                            <div>
                                <p class="pic">
                                    <a href="goodsDetail?id=${sg.id }">
                                        <img src="logos/${sg.gpicture}"/></a>
                                </p>
                                <p class="wz">
                                    <strong><a href="goodsDetail?id=${sg.id }">${sg.gname }</a></strong>
                                    <em>租借价:<span>￥${sg.grprice}/次</span></em>
                                </p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!--最新物品列表end-->
</div>

</body>
</html>
