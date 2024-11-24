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

    <link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        #kv2jg8jy{
            width: 100%;
        }
    </style>

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
            <form method="post" qw-c="operationform" action="userupdatelianxiact.action" enctype="multipart/form-data" onsubmit="return tableToJson()">
                <input name='id' style='display:none;' value="${lianxi.id}">
                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">名字</label>
                    <div class="controls">
                        <!-- 定义名字输入框并赋值 -->

                        <input name="name" value="${lianxi.name}" class="form-control" qw-c="forminput">
                    </div>
                </div>

                <input name="xinxi" id="xinxi" type="hidden">

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-bottom: 20px;">
                    添加联系属性
                </button>

                <table class="table">
                    <thead>
                    <tr>
                        <th>属性</th>
                        <th>内容</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="contactsList">
                    <!-- 联系人列表将在这里填充 -->
                    </tbody>
                </table>

                <div class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">重要</label>
                    <div class="controls">
                        <!-- 定义重要输入框并赋值 -->

                        <select name="zhongyao" id="zhongyao" class="form-control">
                            <option>普通</option>
                            <option>重要</option>
                        </select>
                    </div>
                </div>

                <script>

                    $("#zhongyao").val("${lianxi.zhongyao}");

                </script>


                <!-- 设置div display属性为none，将其隐藏 -->

                <div style='display:none;' class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">用户</label>
                    <!-- 设置div display属性为none，将其隐藏 -->

                    <div style='display:none;' class="controls">
                        <input value="${sessionScope.userinfo.name}" name="user" class="form-control" qw-c="forminput">
                    </div>
                </div> <!-- 设置div display属性为none，将其隐藏 -->

                <div style='display:none;' class="form-group" qw-c="forminputcomponent">
                    <label qw-c="forminputtext">用户id</label>
                    <!-- 设置div display属性为none，将其隐藏 -->

                    <div style='display:none;' class="controls">
                        <input value="${sessionScope.userinfo.id}" name="userid" class="form-control" qw-c="forminput">
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

<!-- 模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">添加联系属性</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="contactForm">
                    <div class="form-group">
                        <label for="name">属性:</label>
                        <input type="text" class="form-control" id="name" required>
                    </div>
                    <div class="form-group">
                        <label for="value">内容:</label>
                        <input type="text" class="form-control" id="value" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="addContact">添加</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    // JavaScript代码
    document.getElementById('addContact').addEventListener('click', function() {
        var name = document.getElementById('name').value;
        var value = document.getElementById('value').value;

        if(!name || !value){
            alert("请输入属性和内容");
            return;
        }

        if(name && value) { // 确保属性和内容不为空
            // 创建删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.className = 'btn btn-danger btn-sm';
            deleteBtn.textContent = '删除';
            deleteBtn.onclick = function() {
                this.parentNode.parentNode.remove(); // 删除按钮的父元素的父元素，即<tr>
            };

            // 创建表格行和单元格
            var tbody = document.getElementById('contactsList');
            var tr = document.createElement('tr');
            var tdName = document.createElement('td');
            var tdValue = document.createElement('td');
            var tdAction = document.createElement('td');

            // 设置单元格内容
            tdName.textContent = name;
            tdValue.textContent = value;
            tdAction.appendChild(deleteBtn);

            // 将单元格添加到行中
            tr.appendChild(tdName);
            tr.appendChild(tdValue);
            tr.appendChild(tdAction);

            // 将行添加到表格中
            tbody.appendChild(tr);

            // 清空输入框
            document.getElementById('name').value = "";
            document.getElementById('value').value = "";

            // 关闭模态框
            $('#myModal').modal('hide');
        }
    });


    // 函数：将表格转换为JSON
    function tableToJson() {
        var table = document.getElementById('contactsList');
        var rows = table.rows;
        var jsonData = [];

        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var cellName = row.cells[0].textContent;
            var cellValue = row.cells[1].textContent;
            jsonData.push({name: cellName, value: cellValue});
        }

        console.log(jsonData)
        $("#xinxi").val(JSON.stringify(jsonData))

        return jsonData;
    }

    // 函数：将JSON转换为表格
    function jsonToTable(jsonData) {
        var table = document.getElementById('contactsList');
        table.innerHTML = ''; // 清空现有表格内容

        jsonData.forEach(function (item) {
            var row = table.insertRow(-1); // 在表格末尾添加一行
            var cellName = row.insertCell(0);
            var cellValue = row.insertCell(1);
            var cellAction = row.insertCell(2);

            cellName.textContent = item.name;
            cellValue.textContent = item.value;

            // 创建删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.className = 'btn btn-danger btn-sm';
            deleteBtn.textContent = '删除';
            deleteBtn.onclick = function () {
                this.parentNode.parentNode.remove(); // 删除按钮的父元素的父元素，即<tr>
            };
            cellAction.appendChild(deleteBtn);
        });
    }

    console.log(${lianxi.xinxi})
    jsonToTable(${lianxi.xinxi});

</script>

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


