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
    <title>联系人管理</title>
    <!--<link rel="stylesheet" href="resource/houtai/css/bootstrap.min.css">-->
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
        联系人管理
    </div>
    <div id="kv2no1ui">
        <div id="kv2nq1xw">
            <style>
                .form-control {
                    width: 200px;
                    float: left;
                    margin-left: 10px;
                }

                .btn-primary {
                    background: #1976d2;
                }

                .left {
                    float: left;
                    line-height: 40px;
                    margin-left: 30px;
                }
            </style>
            <form id="searchform" qw-c="searchform" style="text-align: left;width:90%;margin-bottom: 30px;"
                  method="post" action="">
                <div class="row">
                    <span class="left"></span>
                    <input class="form-control" id="search">
                    <button class="btn btn-primary" style="float: left;margin-left: 30px;" type="button"
                            onclick="goPage(1,10)">搜索
                    </button>
                </div>
            </form>
            <table class="table" qw-c="table" style="margin-top: 80px;">
                <thead>
                <tr>
                    <td>名字

                    </td>
                    <td>信息

                    </td>
                    <td>重要

                    </td>
                    <td>用户

                    </td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>


                <c:if test="${ !empty lianxiall}">

                    <c:forEach items="${ lianxiall}" var="item">


                        <tr>
                            <td> ${item.name }

                            </td>
                            <td> ${item.xinxi }

                            </td>
                            <td> ${item.zhongyao }

                            </td>
                            <td> ${item.user }

                            </td>
                            <td>

                                <!--  定义修改联系人按钮和删除联系人按钮，修改提交地址为updatelianxi.action?id=${item.id}，删除提交地址为 deletelianxi.action?id=${item.id}-->

                                <a href="updatelianxi.action?id=${item.id}">修改</a> <a
                                    href="deletelianxi.action?id=${item.id}">删除</a>

                            </td>
                        </tr>

                    </c:forEach>

                </c:if>

                </tbody>
            </table>
            <div id="tempStr1" style="text-align: center;margin-top: 30px;"></div>
            <div id="tempStr2" style="text-align: center"></div>
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
    var tablesave = "";
    var search = "";

    function tablechushihua() {
        $("tbody").attr("id", "allitems");
        $("tr").attr("class", "oneitem");
        tablesave = $("#allitems").html();
        tablesave = "<tbody id='allitems'>" + tablesave + "</tbody>";
    }

    tablechushihua();

    function goPage(pno, psize) {
        search = $("#search").val();
        $("#allitems").replaceWith(tablesave);

        console.log(tablesave);

        var num = $("#allitems .oneitem").length;

        var scindex = [];
        for (var i = 1; i < (num + 1); i++) {
            if ($("#allitems .oneitem")[i - 1].innerText.indexOf(search) == -1 && search) {
                scindex.push(i - 1);
            }
        }

        for (var i = scindex.length - 1; i >= 0; i--) {
            $("#allitems .oneitem")[scindex[i]].remove();
        }

        num = $("#allitems .oneitem").length;

        var totalPage = 0;//总页数
        var pageSize = psize;//每页显示行数
        //总共分几页
        if (num / pageSize > parseInt(num / pageSize)) {
            totalPage = parseInt(num / pageSize) + 1;
        } else {
            totalPage = parseInt(num / pageSize);
        }
        var currentPage = pno;//当前页数
        var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行 31
        var endRow = currentPage * pageSize;//结束显示的行  40
        endRow = (endRow > num) ? num : endRow;  //40
        //遍历显示数据实现分页
        for (var i = 1; i < (num + 1); i++) {
            if (i >= startRow && i <= endRow) {
                $("#allitems .oneitem")[i - 1].style.display = "table-row";
            } else {
                $("#allitems .oneitem")[i - 1].style.display = "none";
            }
        }
        var tempStr1 = "共" + num + "条记录 分" + totalPage + "页 当前第" + currentPage + "页";

        var tempStr2 = "";


        if (currentPage > 1) {
            //第一页按钮
            tempStr2 += "<button onClick=\"goPage(" + (1) + "," + psize + ")\" class=\"btn btn-primary\"><<</button> ";
            //上一页按钮
            tempStr2 += "<button onClick=\"goPage(" + ((currentPage - 1)) + "," + psize + ")\" class=\"btn btn-primary\"><</button> ";
            //当前页
            tempStr2 += "<button class=\"btn btn-primary\">" + currentPage + "</button> ";
        } else {
            //第一页按钮
            tempStr2 += "<button class=\"btn btn-primary\"><<</button> ";
            //上一页按钮
            tempStr2 += "<button class=\"btn btn-primary\"><</button> ";
            //当前页
            tempStr2 += "<button class=\"btn btn-primary\">" + currentPage + "</button> ";
        }
        if (currentPage < totalPage) {
            //下一页
            tempStr2 += "<button onClick=\"goPage(" + (currentPage + 1) + "," + psize + ")\" class=\"btn btn-primary\">></button> ";
            //最后页
            tempStr2 += "<button onClick=\"goPage(" + (totalPage) + "," + psize + ")\" class=\"btn btn-primary\">>></button> ";
        } else {
            //下一页
            tempStr2 += "<button class=\"btn btn-primary\">></button> ";
            //最后页
            tempStr2 += "<button class=\"btn btn-primary\">>></button> ";
        }
        document.getElementById("tempStr1").innerHTML = tempStr1;
        document.getElementById("tempStr2").innerHTML = tempStr2;
    }

    goPage(1, 10)
</script>
<script>
    if ("${message}") {
        alert("${message}");
    }
</script>
</body>
</html>


