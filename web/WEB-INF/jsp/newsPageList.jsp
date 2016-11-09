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
<table cellpadding="4" cellspacing="0" border="1px">
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
共${totelNews}条数据&emsp;
共${totelPages}页
<c:if test="${currentPage>1}">
    <a href="/news/getNewsByPage?page=${currentPage-1}">上一页</a>
</c:if>

<c:forEach var="x" begin="1" end="${totelPages}">

    <c:if test="${currentPage==x}">
        <span>${x}</span>
    </c:if>
    <c:if test="${currentPage!=x}">
        <a href="/news/getNewsByPage?page=${x}">${x}</a>
    </c:if>
</c:forEach>


<c:if test="${currentPage<totelPages}">
    <a href="/news/getNewsByPage?page=${currentPage+1}">下一页</a>
</c:if>
</body>
</html>
