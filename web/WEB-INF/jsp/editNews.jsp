<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/8
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑新闻</title>
</head>
<body>
<form action="/news/updateNews" method="post">
    <input type="hidden" name="newsId" value="${news.newsId}">
    <fieldset>
        <legend>编辑新闻</legend>
        <select name="category">
            <option value="体育" selected="selected">体育</option>
            <option value="娱乐">娱乐</option>
            <option value="社会">社会</option>
        </select><br>
        新闻头图 <img src="${news.newsTopUrl}"><br>
        标题<input type="text" name="title"/><br>
        作者<input type="text" name="author"/><br>
        <textarea rows="10" cols="30" name="content"></textarea><br>
        新闻图片<br>
        <c:forTokens items="${news.newsContentUrl}" delims="#" var="imgUrl">
            <img src="${imgUrl}"><br>
        </c:forTokens>
        <input type="submit" value="保存">
    </fieldset>

</form>
</body>
</html>
