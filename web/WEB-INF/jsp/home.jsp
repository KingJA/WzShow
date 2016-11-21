<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>介么办</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">${userName}</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="/account/register">退出登录</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="jumbotron">
    <div class="container">
        <h3>欢迎来到“介么办”</h3>
        <p>“介么办”，是用户自己根据具有针对性地提出问题，通过积分奖励机制发动其他用户，来解决该问题的搜索模式。 同时，这些问题的答案又会进一步作为搜索结果，提供给其他有类似疑问的用户，达到分享知识的效果。</p>
        <p><a href="/question/publish" class="btn btn-primary btn-large">发布问题 &raquo;</a></p>
    </div>
</div>

<div class="container">
    <div class="row">
        <!-- Example row of columns -->
        <c:if test="${!empty pageInfo.datas}">
            <c:forEach items="${pageInfo.datas}" var="question">

                <div class="span10">
                    <h2>${question.title}</h2>
                    <p>${question.content}</p>
                    <p><a class="btn btn-default" href="#" role="button">详情 &raquo;</a></p>
                </div>

                <hr>
            </c:forEach>

        </c:if>
    </div>

    <ul class="pagination pagination">
        <c:if test="${pageInfo.currentPage>1}">
            <li><a href="/question/questionPage?page=${pageInfo.currentPage-1}">&laquo;上一页</a></li>
        </c:if>

        <c:forEach var="x" begin="1" end="${pageInfo.totelPages}">

            <c:if test="${pageInfo.currentPage==x}">
                <li class="disabled"><a href="#">${x}</a></li>
            </c:if>
            <c:if test="${pageInfo.currentPage!=x}">
                <li class="active"><a href="/question/questionPage?page=${x}">${x}</a></li>
            </c:if>
        </c:forEach>


        <c:if test="${pageInfo.currentPage<pageInfo.totelPages}">
            <li><a href="/question/questionPage?page=${pageInfo.currentPage+1}">下一页&raquo;</a></li>
        </c:if>

    </ul>
</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
