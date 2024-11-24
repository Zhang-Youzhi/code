<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>菜单栏</title>
</head>
<body>
<c:if test="${sessionScope.identity == '管理员' }">
    <body>
    <ul qw-c="menu">

        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">个人中心</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">

                <li qw-c="menuitemselectitem"><a href="adminindex.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">个人中心</a></li>

            </ul>
        </li>

        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">管理员管理</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">

                <li qw-c="menuitemselectitem"><a href="addadmin.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">添加管理员</a></li>
                <li qw-c="menuitemselectitem"><a href="adminmanage.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">管理员管理</a></li>

            </ul>
        </li>

        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">用户管理</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">

                <li qw-c="menuitemselectitem"><a href="adduser.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">添加用户</a></li>
                <li qw-c="menuitemselectitem"><a href="usermanage.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">用户管理</a></li>

            </ul>
        </li>


        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">退出系统</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">
                <li qw-c="menuitemselectitem"><a href="exitsystem.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">退出系统</a></li>
            </ul>
        </li>

    </ul>
    </body>
</c:if><c:if test="${sessionScope.identity == '用户' }">
    <body>
    <ul qw-c="menu">


        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">个人中心</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">

                <li qw-c="menuitemselectitem"><a href="userindex.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">个人中心</a></li>

            </ul>
        </li>

        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">联系人管理</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">


                <li qw-c="menuitemselectitem"><a href="useraddlianxi.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">添加联系人</a></li>

                <li qw-c="menuitemselectitem"><a href="daorulianxi.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">导入联系人</a></li>
                <li qw-c="menuitemselectitem"><a href="userlianximanage.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">联系人管理</a></li>

                <li qw-c="menuitemselectitem"><a href="lianxiview.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">重要联系人</a></li>


            </ul>
        </li>

        <li qw-c="menuitem"><a href="#" class="menu-btn" qw-c="menuitema"> <i class="fa fa-bath"></i> <span
                qw-c="menuitematext">退出系统</span> </a>
            <ul class="menu-show" qw-c="menuitemselect">
                <li qw-c="menuitemselectitem"><a href="exitsystem.action"
                                                 qw-c="menuitemselectitema menuitemselectitematext">退出系统</a></li>
            </ul>
        </li>

    </ul>
    </body>
</c:if>
</body>
</html>


