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
    <title>注册</title>
    <link rel="stylesheet" href="resource/houtai/css/style.css">
</head>
<body style="background: url(resource/houtai/img/bg.jpg);background-size: cover">
<div id="kv2jbf78">
    <form qw-c="form" action="registact.action" method="post">
        <span id="kv2jbf79" qw-c="operationname">注册</span>
        <div class="form-group">
            <input class="form-control" placeholder="请输入用户名" name="username" qw-c="username" type="text">
        </div>

        <div class="form-group" qw-c="passwordcomponent">
            <input class="form-control" placeholder="请输入密码" name="password" type="password" qw-c="password">
        </div>
        <div class="form-group" qw-c="passwordcomponent"><input class="form-control" placeholder="请确认密码"
                                                                name="repassword" type="password" qw-c="password"></div>


        <div class="form-group">
            <select class="form-control" qw-c="identity" name="identity">
                <option>用户</option>
            </select>
        </div>
        <div class="form-group">
            <button qw-c="operationbutton" class="btn btn-primary">注册</button>
        </div>
        <div qw-c="infotext">
            已有账号，点击<a href="login.action">登录</a>
        </div>
    </form>
</div>
<style>

    .btn-primary {
        background: #1976d2;
        width: 100%;
        height: 50px;
    }

    .form-group {
        margin-top: 10px;
    }

    #kv2jbf79 {
        font-size: 22px;
    }

    #kv2jbf78 {
        width: 400px;
        margin: auto;
        margin-top: 150px;
        min-height: 100px;
        background: white;
        border-radius: 5px;
        padding: 30px;
    }
</style>
<script>
    if ("${message}") {
        alert("${message}");
    }
</script>
</body>
</html>


