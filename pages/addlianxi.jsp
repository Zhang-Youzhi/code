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
    <title>添加联系人</title>
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
        添加联系人
    </div>
    <div id="kv2no1ui">
        <div id="kv2nq1xw">
            <form method="post" qw-c="operationform" action="addlianxiact.action" enctype="multipart/form-data">
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">名字</label>
                    <div class="controls">
                        <!-- 定义 名字输入框 -->

                        <input name="name" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">信息</label>
                    <div class="controls">
                        <!-- 定义 信息输入框 -->

                        <input name="xinxi" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">重要</label>
                    <div class="controls">
                        <!-- 定义 重要输入框 -->

                        <input name="zhongyao" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="formselectcomponent">
                    <label qw-c="formselecttext">用户</label>
                    <div class="controls">


                        <select id='user' onchange="userchange(this)" name="user" class="form-control"
                                qw-c="formselect"> <!-- 用c标签的if表达式判断userall是否为空  -->

                            <c:if test="${ !empty userall}">

                                <!-- 用c标签的forEach循环展示 request中的userall -->

                                <c:forEach items="${ userall}" var="item">


                                    <option value="${item.name }">${item.name }</option>

                                </c:forEach>

                            </c:if>


                        </select>

                        <script>
                            function GetQueryString(name) {
                                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                                var r = decodeURIComponent(window.location.search.substr(1)).match(reg);
                                if (r != null) return (r[2]);
                                return null;
                            }

                            var user = GetQueryString("user");

                            if (user != null) {

                                $("#user").val(user);

                                $("#user option:selected").siblings().remove();
                            }

                            function userchange() {

                                // 获取页面加载时的选中option的索引
                                var selectedIndex = $("#user").get(0).selectedIndex;

                                $("#userid").val($("#userid option:eq(" + selectedIndex + ")").val());

                            }

                            $("#user").val("${lianxi.user}");                        </script>
                    </div>
                </div> <!-- 设置display为none,设置为不可见 -->

                <div style='display:none;' class="form-group" qw-c="formselectcomponent">
                    <label qw-c="formselecttext">用户id</label>
                    <!-- 设置display为none,设置为不可见 -->

                    <div style='display:none;' class="controls">


                        <select id='userid' onchange="useridchange(this)" name="userid" class="form-control"
                                qw-c="formselect"> <!-- 用c标签的if表达式判断userall是否为空  -->

                            <c:if test="${ !empty userall}">

                                <!-- 用c标签的forEach循环展示 request中的userall -->

                                <c:forEach items="${ userall}" var="item">


                                    <option value="${item.id }">${item.id }</option>

                                </c:forEach>

                            </c:if>


                        </select>

                        <script>
                            function GetQueryString(name) {
                                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                                var r = decodeURIComponent(window.location.search.substr(1)).match(reg);
                                if (r != null) return (r[2]);
                                return null;
                            }

                            var userid = GetQueryString("userid");

                            if (userid != null) {

                                $("#userid").val(userid);

                                $("#userid option:selected").siblings().remove();
                            }

                            $("#userid").val("${lianxi.userid}");                        </script>
                    </div>
                </div>


                <div class="form-group">
                    <button qw-c="operationbutton" class="btn btn-primary">添加</button>
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


