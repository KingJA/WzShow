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
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="/js/jquery-3.1.1.min.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<img src="../img/home.png">
<form action="/news/saveNews" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend>添加新闻</legend>
        <select name="category">
            <option value="体育" selected="selected">体育</option>
            <option value="娱乐">娱乐</option>
            <option value="社会">社会</option>
        </select><br>
        新闻头图<input type="file" name="newsTopImg"/><br>
        标题<input type="text" name="title"/><br>
        作者<input type="text" name="author"/><br>
        <textarea rows="10" cols="30" name="content">
新闻内容
</textarea><br>
        新闻图片<input type="file" name="newsContentImgs" multiple="multiple"/><br>
        <input type="submit" value="提交" class="btn btn-default">
    </fieldset>

</form>
</body>
</html>
