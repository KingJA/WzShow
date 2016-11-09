<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/8
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>新闻列表</title>
</head>
<body>
<a href="/news/addNews">添加新闻</a>
<table cellpadding="0" cellspacing="0" border="1">
    <th>id</th>
    <th>标题</th>
    <th>内容</th>
    <th>类别</th>
    <th>作者</th>
    <th>创建时间</th>
    <th>修改时间</th>
    <th>编辑</th>
    <c:if test="${!empty newsList}">
        <c:forEach items="${newsList}" var="news">
            <tr>
                <td>${news.newsId}</td>
                <td>${news.title}</td>
                <td>${news.content}</td>
                <td>${news.category}</td>
                <td>${news.author}</td>
                <td>${news.createTime}</td>
                <td>${news.modifyTime}</td>
                <td>
                    <a href="/news/editNews/${news.newsId}">编辑</a>
                    <a href="/news/deleteNews/${news.newsId}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>>
</table>
</body>
</html>
