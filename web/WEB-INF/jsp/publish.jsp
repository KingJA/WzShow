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
<jsp:include page="common/nav.jsp"></jsp:include>


<div class="container">
    <!-- Main hero unit for a primary marketing message or call to action -->

    <div class="jumbotron">
        <h3>轻松发布</h3>
        <p class="lead">话题越精准，越容易让相关领域专业人士看到你的问题</p>
        <form action="/question/doPublish" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control"  placeholder="请输入标题" name="title">
            </div>
            <div class="form-group">
                <textarea class="form-control" rows="5" placeholder="请输入内容" name="content"></textarea>
            </div>
            <div class="form-group">
                <input type="file" id="exampleInputFile">
            </div>

            <div class="form-group">
                <select name="tagId" class="form-control">
                    <c:if test="${!empty tags}">
                        <c:forEach items="${tags}" var="tag">
                            <option value="${tag.tagId}">${tag.tagName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <p> <button type="submit" class="btn btn-lg btn-success">Submit</button></p>
        </form>
    </div>


</div>

<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
