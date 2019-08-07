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
</head>
<body>
<form action="${pageContext.request.contextPath }/upload.do" method="post" enctype="multipart/form-data">
    <label>用户号：</label><input type="number" name="id"><br>
    <label>用户名：</label><input type="text" name="name"><br>
    <label>密码：</label><input type="password" name="pwd"><br>
    <label>上传头像：</label><input type="file" name="file"><br>
    <input type="submit">
</form>
</body>
</html>
