<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>问题详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>


    <script type="text/javascript">

        function setCollect(obj, collectCode) {//collectCode 1收藏0取消收藏
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/question/detail/collect/",
                    data: {
                        "questionId":${question.questionId},
                        "accountId": "${sessionScope.account.accountId}",
                        "collectCode": collectCode
                    },
                    dataType: "json",
                    success: function (retult) {
                        $(obj).attr("onclick", "setCollect(this," + retult.resultInt + ")");
                        $(obj).text(retult.resultText);
                    },
                    error: function () {
                        alert("哈哈，厉害了");
                    }
                });
            }
        }
        function addPraise(answerId, obj) {

            if ("${sessionScope.account.accountId}" == "") window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/question/detail/praise/",
                    data: {
                        "answerId": answerId,
                        "accountId": "${sessionScope.account.accountId}"
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
<%--导航栏--%>
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
            </ul>

            <form class="navbar-form navbar-left" role="form" action="/home/search" method="post">
                <div class="form-group">
                    <input type="text" placeholder="请输入关键字" class="form-control" name="keyword">
                </div>
                <button class="btn btn-primary btn-success" type="submit">搜索</button>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <%-- <li><a href="#">Link</a></li>--%>
                <li class="dropdown">
                    <div class="navbar-form dropdown-toggle" data-toggle="dropdown">
                        <img src="${sessionScope.account.avatar}" width="32px" height="32px" class="img-circle">
                        <span class="caret"></span></div>
                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                        <li><a href="/personal">个人中心</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="/account/login">退出</a></li>
                    </ul>
                </li>
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">

    <!-- 问题 -->
    <div class="jumbotron">
        <div class="page-header">


            <h2>${question.title}</h2>
            <h5><span class="label label-primary">生活</span></h5>
            <p class="lead">${question.content}</p>
        </div>
        <hr>
        <c:forTokens items="${question.imgUrls}" delims="#" var="imgUrl">
            <img src="${imgUrl}"><br>
        </c:forTokens>

        <div class="row">
            <div class="pull-right">
                <p class="lead">${question.createTime}<a href="/personal/${account.accountId}">${account.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-success" onclick="setCollect(this,${collect.resultInt})"><i
                            class="icon-white icon-star"></i>
                        ${collect.resultText}</button>
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
                            <button class="btn btn-success" onclick="addPraise(${answer.answerId},this)"><i
                                    class="icon-white icon-heart"></i>
                                赞(${answer.praiseCount})
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
                    <button class="btn btn-success" ><i class="icon-white icon-heart"></i>发布</button>
                </div>
            </div>
            <input type="hidden" name="questionId" value="${question.questionId}">

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
