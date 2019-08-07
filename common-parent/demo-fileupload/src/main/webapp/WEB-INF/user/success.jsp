<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/6
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
<c:forEach items="${userList}" var="userList" >
    用户名：${userList.name}<br>
    密码：${userList.pwd }<br>
    <!--拼接图片回显的的URL-->
    <img  src="http://114.67.73.152/${userList.image}"><br>
</c:forEach>
</body>
</html>
