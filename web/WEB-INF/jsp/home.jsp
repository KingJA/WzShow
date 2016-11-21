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
        <h3>欢迎来到“介么办”</h3>
        <p>“介么办”，是用户自己根据具有针对性地提出问题，通过积分奖励机制发动其他用户，来解决该问题的搜索模式。 同时，这些问题的答案又会进一步作为搜索结果，提供给其他有类似疑问的用户，达到分享知识的效果。</p>
        <p><a href="/question/publish" class="btn btn-primary btn-large">发布问题 &raquo;</a></p>
    </div>

    <!-- Example row of columns -->
    <c:if test="${!empty pageInfo.datas}">
        <c:forEach items="${pageInfo.datas}" var="question">
            <div class="row">
                <div class="span10">
                    <h2>${question.title}</h2>
                    <p>${question.content}</p>
                    <p><a class="btn" href="#">详情 &raquo;</a></p>
                </div>
            </div>
            <hr>
        </c:forEach>

    </c:if>

    <c:if test="${pageInfo.currentPage>1}">
        <a href="/question/questionPage?page=${pageInfo.currentPage-1}">上一页</a>
    </c:if>

    <c:forEach var="x" begin="1" end="${pageInfo.totelPages}">

        <c:if test="${pageInfo.currentPage==x}">
            <span>${x}</span>
        </c:if>
        <c:if test="${pageInfo.currentPage!=x}">
            <a href="/question/questionPage?page=${x}">${x}</a>
        </c:if>
    </c:forEach>


    <c:if test="${pageInfo.currentPage<pageInfo.totelPages}">
        <a href="/question/questionPage?page=${pageInfo.currentPage+1}">下一页</a>
    </c:if>

</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
