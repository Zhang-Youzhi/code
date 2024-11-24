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
    <title>导入联系人</title>
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
        导入联系人
    </div>
    <div id="kv2no1ui">
        <div id="kv2nq1xw">
            <form method="post" qw-c="operationform" action="addlianxiact.action" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="">文件</label>
                    <div class="controls">
                        <input type="file" id="excel-file" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <button type="button" id="upload-btn" class="btn btn-primary">添加</button>
                </div>
            </form>
        </div>
    </div>
    <div id="kv2jbf76">
        通讯录
    </div>
</div>


<script type="text/javascript" src="resource/xlsx.core.min.js"></script>
<script type="text/javascript">

    function convertStringToJson(str) {
        // 将字符串按'|'分割成多个部分
        var entries = str.split('|');

        // 创建一个空数组来存放结果
        var result = [];

        // 遍历分割后的数组
        entries.forEach(entry => {
            // 再次按':'分割每个部分为键和值
            const [key, value] = entry.split('：');

        // 将键和值作为一个对象添加到结果数组中
        result.push({ name: key, value: value });
    });

        // 返回结果数组
        return result;
    }


    $("#upload-btn").click(function(){
        files = $('#excel-file').prop('files');;
        var fileReader = new FileReader();
        fileReader.onload = function(ev) {
            try {
                var data = ev.target.result,
                    workbook = XLSX.read(data, {
                        type: 'binary'
                    }), // 以二进制流方式读取得到整份excel表格对象
                    persons = []; // 存储获取到的数据
            } catch (e) {
                console.log('文件类型不正确');
                alert("文件类型不正确");
                return;
            }
            // 表格的表格范围，可用于判断表头是否数量是否正确
            var fromTo = '';
            // 遍历每张表读取
            for (var sheet in workbook.Sheets) {
                if (workbook.Sheets.hasOwnProperty(sheet)) {
                    fromTo = workbook.Sheets[sheet]['!ref'];
                    persons = persons.concat(XLSX.utils.sheet_to_json(workbook.Sheets[sheet]));
                    break; // 如果只取第一张表，就取消注释这行
                }
            }
            //$('.content').text(JSON.stringify(persons));

            for (var i = 0; i < persons.length;i++) {
                //console.log(persons[i]);

                var data = {};

                data["name"] = persons[i]["名字"];

                console.log(convertStringToJson(persons[i]["信息"]))

                data["xinxi"] = JSON.stringify(convertStringToJson(persons[i]["信息"])).replace("：null","");
                data["zhongyao"] = persons[i]["重要"];
                data["user"] = "${sessionScope.mingzi}";
                data["userid"] = "${sessionScope.id}";

                console.log(data);

                $.ajax({
                    url: "addlianxiact.action",
                    type: "post",
                    data: data,
                    success: function (obj) {



                    }
                })


            }
            alert("导入成功");
            window.location.href = "userlianximanage.action";

        };
        // 以二进制方式打开文件
        fileReader.readAsBinaryString(files[0]);
    });

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


