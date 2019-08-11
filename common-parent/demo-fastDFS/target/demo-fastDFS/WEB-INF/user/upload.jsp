<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">
    <!-- 引入js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<body>

<div id="enteringInfor">

    <form id="uploadForm" >

        <div class="formItem" style="float:left">
            <div class="itemBlock">
                <div style="display:inline-block;float:left" class="selectContainer">
                    <span class="txtBox">姓名</span>
                    <input type="text" class="select"  name="realName" id="realName"  placeholder="请输入姓名" style="width:200px;">
                </div>
            </div>
            <div class="itemBlock">
                <div style="display:inline-block;float:left" class="selectContainer">
                    <span class="txtBox">性别</span>
                    <select class="select" name="gender" id="gender" >
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="formItem" style="float:right;margin-top:50px;">
            <div class="picture">
                <div class="layui-upload">
                    <div class="layui-upload-list" id="localImag">
                        <img class="layui-upload-img" id="userPic" style="width:330px;height:410px">
                        <p id="demoText"></p>
                    </div>
                    <div class="btn btn-primary fileinput-button"  style="width:332px;position:absolute;bottom:0px">
                        <span class="uploadTxt">上传图片</span>
                        <input class="form-control layui-btn" id="entrustPicUpload" type="file" name="entImg" onchange="getPhoto(this)"  />
                    </div>
                </div>
            </div>
        </div>

    </form>

    <div class="modelEditorBottom" style="padding-left:24px;text-align:center;height:70px;line-height:70px;border:none;width:100%;overflow:hidden;zoom:1">
        <button class="buttons adminButton" onclick="saveUser()">保存</button>
    </div>

    <input type="hidden" name="userId" id="userId"/>
</div>
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
        document.getElementById("userPic").src = imgRUL;
        $('#userPic').viewer({
            url: 'data-original',
        });
    }

    //保存
    function saveUser(){
        //数据判断
        var realName=$("#realName").val();
        if(realName==null||realName==''){
            layer.msg('用户名不能为空!',{icon : 7,time:1000});
            return ;
        }
        var imgSrc = $("#userPic").attr("src");
        if(imgSrc == "" || imgSrc==null){
            layer.msg('请上传图片!',{icon : 7,time:1000});
            return ;
        }
        var formData = new FormData($("#uploadForm")[0]);
        $.ajax({
            url : "../addUser",
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success : function(data) {
                var obj =  JSON.parse(data);
                layer.msg('保存成功!', {icon : 6,time : 2000});
            },
            error : function(data) {
                layer.msg('保存失败!', {icon : 5,time : 2000});
            }
        });
    }
</script>
</body>

</html>