<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/6
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册页面</title>
    <!-- 引入js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath }/upload.do" method="post" enctype="multipart/form-data">
    <table>
    <label>用户号：</label><input type="number" name="id"><br>
    <label>用户名：</label><input type="text" name="name"><br>
    <label>密码：</label><input type="password" name="pwd"><br>
    <%--<label>上传头像：</label><input type="file" name="file"><br>--%>
    <!--拼接图片回显的的URL-->
    <div class="formItem" style="float:left;margin-top:5px;">
        <div class="picture">
            <div class="layui-upload">
                <div class="layui-upload-list" id="localImag">
                    <img class="layui-upload-img" id="file" style="width:200px;height:250px">
                </div>
                <div class="btn btn-primary fileinput-button"  style="width:332px;position:absolute;">
                    <span class="uploadTxt">上传图片</span>
                    <input class="form-control layui-btn" id="entrustPicUpload" type="file" name="file" onchange="getPhoto(this)"  />
                </div>
            </div>
        </div>
    </div>
    <input type="submit" style="height: 50px;width: 170px;position: absolute;bottom: 510px;left: 20px;">
    </table>
</form>

<script>
    var imgurl = "";
    function getPhoto(node) {
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try{
                imgURL =  file.getAsDataURL();
            }catch(e){
                imgRUL = window.URL.createObjectURL(file);
            }
        }catch(e){
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        creatImg(imgRUL);//显示图片
        return imgURL;
    }
    function creatImg(imgRUL){
        document.getElementById("file").src = imgRUL;
        $('#file').viewer({
            url: 'data-original',
        });
    }
</script>
</body>
</html>
