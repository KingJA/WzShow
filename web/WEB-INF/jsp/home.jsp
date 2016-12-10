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
    <link rel="shortcut icon" href="/img/head_default.jpg">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>

<body style="padding-top: 50px">
<jsp:include page="common/nav.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <!-- Example row of columns -->
            <c:if test="${!empty pageInfo.pageDatas}">
                <c:forEach items="${pageInfo.pageDatas}" var="question">
                    <div class="question_border">
                        <h3 class="singleText">${question.title}</h3>
                        <p>${question.content}</p>
                        <p><a  class="btn btn-default" href="/question/detail/${question.questionId}"
                              role="button">详情 &raquo;</a></p>
                    </div>
                </c:forEach>

            </c:if>

            <ul class="pagination pagination">
                <c:if test="${pageInfo.hasPrevious}">
                    <li><a href="/question/questionPage?page=${pageInfo.currentPage-1}">&laquo;上一页</a></li>
                </c:if>

                <c:forEach var="x" begin="${pageInfo.currentPage>5?pageInfo.currentPage-2:1}" end="${pageInfo.currentPage>5?pageInfo.currentPage+2:(pageInfo.totelPages>=5?5:pageInfo.totelPages)}">

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

        </div>

        <%--===========================================右=======================================================--%>
        <div class="col-md-3">
            <div class="jumbotron">
                <h3>${sessionScope.account.name},欢迎来到“介么办”，马上体验问答的快乐</h3>
                <a href="/question/publish" class="btn btn-lg btn-success">发布问题 &raquo;</a>
            </div>
        </div>
    </div>



</div> <!-- /container -->
<jsp:include page="common/footer.jsp"></jsp:include>
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
