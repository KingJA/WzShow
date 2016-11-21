<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>发布问题</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">${userName}</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="/account/register">退出登录</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="hero-unit">
        <form action="/question/doPublish" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>发布问题</legend>
                <input type="text" placeholder="请输入标题" class="input-xxlarge" name="title"><br>
                <textarea rows="8" placeholder="请输入具体问题" class="input-xxlarge" name="content"></textarea>
                <br>

                <input type="file" name="files" multiple="multiple">
                <br>
                <select name="tagId" >
                    <c:if test="${!empty tags}">
                        <c:forEach items="${tags}" var="tag">
                            <option value="${tag.tagId}">${tag.tagName}</option>
                        </c:forEach>
                    </c:if>
                </select><br>
                <button type="submit" class="btn btn-large btn-block btn-primary">发布</button>
                <br>
            </fieldset>
        </form>
    </div>

</div> <!-- /container -->

</body>
</html>
