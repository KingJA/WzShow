<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>问题详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/img/head_default.jpg">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function addCollect(accountId, accountBId, name, questionId,  obj) {
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({

                    type: "POST",
                    url: "/question/detail/collect/",
                    data: {
                        questionId: questionId,
                        title: title,
                        accountId: accountId,
                        accountBId: accountBId,
                        title:"${question.title}",
                        name: name
                    },
                    dataType: "json",
                    success: function (retult) {
                        $(obj).text("已收藏");
                        $(obj).attr('disabled', "true");
                    },
                    error: function () {
                        alert("哈哈，厉害了");
                    }
                });
            }
        }

        function addPraise(answerId, accountBId, name, questionId, accountId, title, obj) {
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/question/detail/praise/",
                    data: {
                        answerId: answerId,
                        accountBId: accountBId,
                        name: name,
                        questionId: questionId,
                        accountId: accountId,
                        title: title
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result.resultCode == 0) {
                            $(obj).text("赞(" + result.resultData.resultInt + ")");
                        } else {
                            $('#myModal').modal('show');//已经收藏过
                        }
                    },
                    error: function () {
                        alert("哈哈，厉害了");
                    }
                });
            }
        }


    </script>

</head>

<body>
<jsp:include page="common/nav.jsp"/>

<div class="container">

    <!-- 问题 -->
    <div class="jumbotron">
        <div class="page-header">


            <h2>${question.title}</h2>
            <h5><span class="label label-primary">生活</span></h5>
            <p class="lead">${question.content}</p>
        </div>
        <hr>
        <c:if test="${!empty question.imgUrls}">
            <c:forTokens items="${question.imgUrls}" delims="#" var="imgUrl">
                <img src="${imgUrl}"><br>
            </c:forTokens>
        </c:if>
        <div class="row">
            <div class="pull-right">
                <p class="lead">${question.createTime}<a href="/personal/${account.accountId}">${account.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${account.accountId!=sessionScope.accountId}">
                        <c:if test="${collect.resultInt>0}">
                            <button class="btn btn-success" disabled="disabled">${collect.resultText}</button>
                        </c:if>
                        <c:if test="${collect.resultInt==0}">
                            <button class="btn btn-success"
                                    onclick="addCollect('${sessionScope.account.accountId}','${account.accountId}','${account.name}','${question.questionId}',this)">${collect.resultText}</button>
                        </c:if>
                        <%--accountId,accountBId,name,questionId,title--%>
                    </c:if>

                </p>
            </div>
        </div>

    </div>
    <!-- 留言 -->
    <p class="lead">共有<a>${fn:length(answerResults)}</a>个回答</p>
    <div class="jumbotron">

        <%--回答开始--%>
        <c:if test="${!empty answerResults}">
            <c:forEach items="${answerResults}" var="answer">
                <div class="answer">
                    <div class="row">
                        <img src="${answer.avatar}" width="48px" height="48px" class="img-circle">&nbsp;&nbsp;&nbsp;&nbsp;<a
                            href="#">${answer.name}</a>
                        <div class="pull-right">
                            <p class="lead">${answer.createTime}</p>
                        </div>
                    </div>

                    <p class="lead">${answer.content}</p>

                    <div class="row">
                        <div class="pull-right">
                            <button class="btn btn-success"
                                    onclick="addPraise('${answer.answerId}','${answer.accountId}','${answer.name}','${question.questionId}','${sessionScope.account.accountId}','${question.title}',this)">
                                <i class="icon-white icon-heart"></i>赞(${answer.praiseCount})
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>

        </c:if>
        <%--回答结束--%>
    </div>

    <%--我来回答--%>
    <p class="lead">我来回答</p>
    <div class="jumbotron">
        <form role="form" enctype="multipart/form-data" action="/question/detail/answer" method="post">
            <div class="form-group">
                <textarea class="form-control" rows="5" placeholder="请输入内容" name="content"></textarea>
            </div>
            <div class="form-group">

                <input type="file" id="exampleInputFile" name="files">
                <div class="pull-right">
                    <button class="btn btn-success"><i class="icon-white icon-heart"></i>发布</button>
                </div>
            </div>
            <input type="hidden" name="questionId" value="${question.questionId}">
            <input type="hidden" name="title" value="${question.title}">

        </form>
    </div>
    <div style="height: 50px;"></div>


    <!-- Site footer -->
    <div class="blog-footer">
        <p>
            <a href="#">Back to top</a>
        </p>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                您已经点过赞啦
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">好的</button>
            </div>
        </div>
    </div>
</div>
</body>

</html>
