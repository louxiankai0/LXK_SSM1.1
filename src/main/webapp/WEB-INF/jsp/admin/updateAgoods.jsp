<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8");%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>addGoods.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/addupdate.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <style type="text/css">

    </style>
    <script type="text/javascript">

    </script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


</head>
<body>
<div id="header">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="javascript:history.back();">物品管理</a>
        </li>
    </ul>
</div>

<div id="content">
    <form:form action="adminGoods/addGoods?updateAct=update" method="post" modelAttribute="goods" enctype="multipart/form-data" id="form1">
        <dl>
            <dt>修改物品</dt>

            <table border=1 class="table table-bordered table-hover">
                <tr>
                    <td>名称<a style="color: red">*</a></td>
                    <td>
                        <input type="text" name="gname" value="${goods.gname}" autofocus class="form-control input-size" required/>
                        <input type="hidden" name="id" value="${goods.id}">
                    </td>
                </tr>
                <tr>
                    <td>原价<a style="color: red">*</a></td>
                    <td>
                        <input type="text" name="goprice" value="${goods.goprice}" autofocus class="form-control input-size" required/>
                    </td>
                </tr>
                <tr>
                    <td>租借价<a style="color: red">*</a></td>
                    <td>
                        <input type="text" name="grprice" value="${goods.grprice}" autofocus class="form-control input-size" required/>
                    </td>
                </tr>
                <tr>
                    <td>库存<a style="color: red">*</a></td>
                    <td>
                        <input type="text" name="gstore" value="${goods.gstore}" autofocus class="form-control input-size" required/>
                    </td>
                </tr>
                <tr>
                    <td>图片<a style="color: red">*</a></td>
                    <td>
                        <input type="file" name="logoImage" value="${goods.gpicture}"/>
                        <!-- 从数据库取出的文件名 -->
                        <c:if test="${goods.gpicture != ''}">
                            <img alt="" width="50" height="50"
                                 src="logos/${goods.gpicture}"/>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>类型<a style="color: red">*</a></td>
                    <td>
                        <form:select path="goodstype_id">
                            <form:options items="${goodsType }" itemLabel="typename" itemValue="id"/>
                        </form:select>
                    </td>
                </tr>
            </table>

            <dd class="btn-groups"><input type="submit" value="确 定" class="btn btn-primary btn-sm" />
            </dd>
        </dl>
    </form:form>
    ${msg }
</div>
</body>
</html>
