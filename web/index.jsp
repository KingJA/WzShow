<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/8
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%
  String path = request.getContextPath();
  String servletPath = request.getServletPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
  </head>
  <body>
首页
  <%  out.println("path"+path); %>
  <%  out.println("servletPath"+servletPath); %>
  <%  out.println("basePath"+basePath); %>
<img src="/img/home.png">

  </body>
</html>

