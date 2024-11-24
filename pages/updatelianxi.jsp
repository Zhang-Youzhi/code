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
    <title>修改联系人</title>
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
        修改联系人
    </div>
    <div id="kv2no1ui">
        <div id="kv2nq1xw">
            <form method="post" qw-c="operationform" action="updatelianxiact.action" enctype="multipart/form-data">
                <input name='id' style='display:none;' value="${lianxi.id}">
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">名字</label>
                    <div class="controls">
                        <!-- 定义名字input输入框，并从request中取值lianxi.name赋值  -->

                        <input name="name" value="${lianxi.name}" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">信息</label>
                    <div class="controls">
                        <!-- 定义信息input输入框，并从request中取值lianxi.xinxi赋值  -->

                        <input name="xinxi" value="${lianxi.xinxi}" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">重要</label>
                    <div class="controls">
                        <!-- 定义重要input输入框，并从request中取值lianxi.zhongyao赋值  -->

                        <input name="zhongyao" value="${lianxi.zhongyao}" class="form-control" qw-c="forminput">
                    </div>
                </div>
                <div class="form-group" qw-c="formselectcomponent">
                    <label qw-c="formselecttext">用户</label>
                    <div class="controls">
                        <!-- 定义用户下拉框 -->

                        <select id='user' onchange="userchange(this)" name="user" class="form-control"
                                qw-c="formselect"> <!-- 使用c标签的if表达式判断userall是否为空 -->

                            <c:if test="${ !empty userall}">

                                <!-- 使用c标签的forEach表达式循环输出userall -->

                                <c:forEach items="${ userall}" var="item">


                                    <option value="${item.name }">${item.name }</option>

                                </c:forEach>

                            </c:if>


                        </select>

                        <script>


                            function userchange(select) {

                                /* 获取传入的select的选中项的项数， 将id为userid的选中项改变为与其一致  */

                                $("#userid").val($("#userid option:eq(" + select.selectedIndex + ")").val());
                            }

                        </script>
                        <script>
                            /* 设置id为user的值为request中的lianxi.user  */

                            $("#user").val("${lianxi.user}")</script>

                    </div>
                </div>
                <div style='display:none;' class="form-group" qw-c="formselectcomponent">
                    <label qw-c="formselecttext">用户id</label>
                    <div style='display:none;' class="controls">
                        <!-- 定义用户id下拉框 -->

                        <select id='userid' onchange="useridchange(this)" name="userid" class="form-control"
                                qw-c="formselect"> <!-- 使用c标签的if表达式判断userall是否为空 -->

                            <c:if test="${ !empty userall}">

                                <!-- 使用c标签的forEach表达式循环输出userall -->

                                <c:forEach items="${ userall}" var="item">


                                    <option value="${item.id }">${item.id }</option>

                                </c:forEach>

                            </c:if>


                        </select>

                        <script>


                            function useridchange(select) {

                                /* 获取传入的select的选中项的项数， 将id为useridid的选中项改变为与其一致  */

                                $("#useridid").val($("#useridid option:eq(" + select.selectedIndex + ")").val());
                            }

                        </script>
                        <script>
                            /* 设置id为userid的值为request中的lianxi.userid  */

                            $("#userid").val("${lianxi.userid}")</script>

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


