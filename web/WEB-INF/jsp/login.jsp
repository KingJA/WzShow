<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/15
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>

<form action="/account/doLogin" method="post">
    账号<input type="text" name="name"><br>
    密码<input type="text" name="password"><br>
    <input type="submit" name="登录"><br>


</form>


</body>
</html>
