<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改用户个人信息</title>
    <link rel="stylesheet" href="resource/houtai/css/style.css">
    <script src="resource/houtai/js/jquery.min.js"></script>
</head>
<body>
<div id="kv2jbf74">
    <div id="kv2j7gst">
        通讯录
    </div>
</div>
<div id="kv2jg5wg">

    <c:import url="htmenu.jsp"></c:import>

</div>
<div id="kv2jg8jy">
    <div id="kv2jbf75" qw-c="operationname">
        修改用户个人信息
    </div>
    <div id="kv2no1ui">
        <div id="kv2nq1xw">
            <form method="post" qw-c="operationform" action="userupdategerenxinxiact.action"
                  enctype="multipart/form-data">

                <input type='text' name='id' style='display:none;' value="${sessionScope.userinfo.id}">

                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">名字</label>
                    <div class="controls">
                        <!--  定义name输入框，并从session中取值  -->

                        <input value="${sessionScope.userinfo.name}" name="name" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">账号</label>
                    <div class="controls">
                        <!--  定义usernameinput，将session中的账号赋值给input  -->

                        <input readonly value="${sessionScope.userinfo.username}" id="username" name="username"
                               class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">密码</label>
                    <div class="controls">
                        <!--  定义password输入框，并从session中取值  -->

                        <input value="${sessionScope.userinfo.password}" name="password" class="form-control"
                               qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">性别</label>
                    <div class="controls">
                        <!--  定义sex输入框，并从session中取值  -->

                        <input value="${sessionScope.userinfo.sex}" name="sex" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">年龄</label>
                    <div class="controls">
                        <!--  定义age输入框，并从session中取值  -->

                        <input value="${sessionScope.userinfo.age}" name="age" class="form-control" qw-c="forminput">
                    </div>
                </div>


                <div class="form-group">
                    <button qw-c="operationbutton" class="btn btn-primary">修改</button>
                </div>
            </form>
        </div>
    </div>
    <div id="kv2jbf76">
        通讯录
    </div>
</div>
<script>
    $(".menu-btn").click(function () {
        $(this).toggleClass("active");
        $(this).next().slideToggle(10);
    });
</script>
<script>
    if ("${message}") {
        alert("${message}");
    }
</script>
</body>
</html>


