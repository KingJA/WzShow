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
    <title>添加新闻</title>
</head>
<body>
<img src="/img/home.png">
<form action="/news/saveNews" method="post">
    <fieldset>
        <legend>添加新闻</legend>
        <select name="category">
            <option value="体育" selected="selected">体育</option>
            <option value="娱乐">娱乐</option>
            <option value="社会">社会</option>
        </select>
        标题<input type="text" name="title"/><br>
        作者<input type="text" name="author"/><br>
        <textarea rows="10" cols="30" name="content">
新闻内容
</textarea>
        <input type="submit" value="提交">
    </fieldset>

</form>
</body>
</html>
