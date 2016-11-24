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
<div class="container">
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
                    <li><a href="/account/login">退出登录</a></li>
                </ul>
                <form class="navbar-form navbar-right" role="form" action="/home/search" method="post">
                    <div class="form-group">
                        <input type="text" placeholder="请输入关键字" class="form-control" name="keyword">
                    </div>
                    <button class="btn btn-primary btn-success" type="submit">搜索</button>
                </form>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h3>${sessionScope.account.name},欢迎来到“介么办”，马上体验问答的快乐</h3>
        <a href="/question/publish" class="btn btn-lg btn-success">发布问题 &raquo;</a>
    </div>


    <div class="row">
        <!-- Example row of columns -->
        <c:if test="${!empty pageInfo.pageDatas}">
            <c:forEach items="${pageInfo.pageDatas}" var="question">
                <div class="thumbnail">
                    <div class="span8">
                        <h2>${question.title}</h2>
                        <p>${question.content}</p>
                        <p><a class="btn btn-default" href="/question/detail/${question.questionId}"
                              role="button">详情 &raquo;</a></p>
                    </div>
                </div>
            </c:forEach>

        </c:if>
    </div>

    <ul class="pagination pagination">
        <c:if test="${pageInfo.hasPrevious}">
            <li><a href="/question/questionPage?page=${pageInfo.currentPage-1}">&laquo;上一页</a></li>
        </c:if>

        <c:forEach var="x" begin="1" end="${pageInfo.totelPages}">

            <c:if test="${pageInfo.currentPage==x}">
                <li class="active"><a href="javascript:return false;">${x}</a></li>
            </c:if>
            <c:if test="${pageInfo.currentPage!=x}">
                <li><a href="/question/questionPage?page=${x}">${x}</a></li>
            </c:if>
        </c:forEach>


        <c:if test="${pageInfo.hasNext}">
            <li><a href="/question/questionPage?page=${pageInfo.currentPage+1}">下一页&raquo;</a></li>
        </c:if>


    </ul>


    <!-- Site footer -->
    <footer class="footer">
        <p>&copy; 2016 Company, Inc.</p>
    </footer>


</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
