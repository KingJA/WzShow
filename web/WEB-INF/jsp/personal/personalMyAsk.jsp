<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/25
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/personal.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/base.css" rel="stylesheet">

</head>

<body style="padding-top: 50px">
<jsp:include page="../common/nav.jsp"></jsp:include>
<%--头部导航栏--%>

<div class="personal-container">
    <div class="container">
        <div class="personal-head">
            <div class="row">
                <div class="col-md-2 ">
                    <div class="">
                        <img src="${account.avatar}" alt="..." class="img-circle" width="160px" height="160px">
                    </div>
                </div>
                <div class="col-md-5">
                    <h3>${account.name}</h3>
                    <div>
                        <span class="glyphicon glyphicon-tag"></span> <span class="">等级:</span>
                    </div>
                    <div>
                        <span class="glyphicon glyphicon-tag"></span> <span class="">金币:</span>
                    </div>
                    <div>
                        <span class="glyphicon glyphicon-tag"></span> <span class="">兴趣:</span>
                    </div>
                    <div>
                        <span class="glyphicon glyphicon-tag"></span> <span class="">擅长:</span>
                    </div>

                </div>
                <div class="col-md-5">其他</div>
            </div>

        </div>
        <%--personal-head--%>

        <div class="personal-content">
            <div class="row">
                <div class="col-md-2">
                    <div class="personal-nav">
                        <ul class="nav nav-pills nav-stacked profile__nav">
                            <li class="active"><a href="/personal/${account.accountId}/myAsk?page=1">${who}的提问</a></li>
                            <li><a href="/personal/${account.accountId}/myAnswer?page=1">${who}的回答</a></li>
                            <li><a href="/personal/${account.accountId}/myAttention?page=1">${who}的关注</a></li>
                            <li><a href="/personal/${account.accountId}/myCollect?page=1">${who}的收藏</a></li>
                            <li><a href="/personal/${account.accountId}/myGift?page=1">${who}的礼物</a></li>
                            <li><a href="/personal/${account.accountId}/myFootprint?page=1">${who}的足迹</a>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="personal-content">
                        <p class="lead" id="selectTitle">页面标题</p>
                        <div class="border-20 displayContainer">

                            <c:if test="${!empty pageInfo.pageDatas}">

                                <c:forEach items="${pageInfo.pageDatas}" var="question" varStatus="idx">
                                    <div class="selectItem row">
                                        <div class="col-md-1"><a class="btn btn-success btn-xs"><span
                                                class="glyphicon glyphicon-star"></span> 5</a></div>
                                        <div class="col-md-9">
                                            <a target="_blank" class="singleText" href="/question/detail/${question.questionId}">${question.title}</a>
                                        </div>
                                       
                                        <div class="col-md-2"><span class="">${question.createYearDay}</span></div>
                                    </div>

                                </c:forEach>
                            </c:if>
                        </div>
                        <%--displayContainer显示内容去结束--%>
                        <div class="page">
                            <ul class="pagination">
                                <c:if test="${pageInfo.hasPrevious}">
                                    <li>
                                        <a href="/personal/${account.accountId}/myAsk?page=${pageInfo.previousPage}">&laquo;上一页</a>
                                    </li>
                                </c:if>

                                <c:forEach var="x" begin="${pageInfo.pageStart}"
                                           end="${pageInfo.pageEnd}">

                                    <c:if test="${pageInfo.currentPage==x}">
                                        <li class="active"><a href="javascript:return false;">${x}</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.currentPage!=x}">
                                        <li><a href="/personal/${account.accountId}/myAsk?page=${x}">${x}</a></li>
                                    </c:if>
                                </c:forEach>


                                <c:if test="${pageInfo.hasNext}">
                                    <li><a href="/personal/${account.accountId}/myAsk?page=${pageInfo.nextPage}">下一页&raquo;</a>
                                    </li>
                                </c:if>
                            </ul>

                        </div>
                        <%--page分页结束--%>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div>
</div>
<%--personal-content--%>

</div>
<%--container--%>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
