<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/25
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script type="text/javascript">
        function myAsk(currentPage) {
            $("#selectTitle").text("我的提问");
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/personal/myAsk",
                    dataType: "json",
                    data: {
                        "accountId": ${sessionScope.account.accountId},
                        "currentPage": currentPage
                    },
                    success: function (result) {
                        $("#selectContainer").html(result.resultText);
                    },
                    error: function () {
                        alert("厉害了，myask");
                    }

                });
            }
        }
        function myAnswer(currentPage) {
            $("#selectTitle").text("我的回答");
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/personal/myAnswer",
                    dataType: "json",
                    data: {
                        "accountId": ${sessionScope.account.accountId},
                        "currentPage": currentPage
                    },
                    success: function (result) {
                        $("#selectContainer").html(result.resultText);
                    },
                    error: function () {
                        alert("厉害了，myask");
                    }

                });
            }
        }
        function myCollect(currentPage) {
            $("#selectTitle").text("我的收藏");
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/personal/myCollect",
                    dataType: "json",
                    data: {
                        "accountId": ${sessionScope.account.accountId},
                        "currentPage": currentPage
                    },
                    success: function (result) {
                        $("#selectContainer").html(result.resultText);
                    },
                    error: function () {
                        alert("厉害了，myCollect");
                    }

                });
            }
        } function myAttention(currentPage) {
            $("#selectTitle").text("我的关注");
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/personal/myAttention",
                    dataType: "json",
                    data: {
                        "accountId": ${sessionScope.account.accountId},
                        "currentPage": currentPage
                    },
                    success: function (result) {
                        $("#selectContainer").html(result.resultText);
                    },
                    error: function () {
                        alert("厉害了，myAttention");
                    }

                });
            }
        }


    </script>
</head>

<body style="padding-top: 50px">
<%--==================================导航============================================--%>
<nav class=" navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

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
                        <li><a href="/account/quit">退出</a></li>
                    </ul>
                </li>
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</nav>


<%--==============================================================================--%>
<div class="personal-root">
    <div class="head">
        <div class="container">
            <div class="row">
                <div class="col-md-2 ">
                    <div class="">
                        <img src="/img/head_3.jpg" alt="..." class="img-circle" width="160px" height="160px">
                    </div>
                </div>
                <div class="col-md-5">
                    <h3>${sessionScope.account.name}</h3>
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
    </div>
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-md-2">


                    <div>
                        <ul class="nav nav-pills nav-stacked profile__nav">
                            <li><a href="javascript:void(0);" onclick="myAsk(1)">${who}的提问</a></li>
                            <li><a href="javascript:void(0);" onclick="myAnswer(1)">${who}的回答</a></li>
                            <li><a href="javascript:void(0);" onclick="myAttention(1)">${who}的关注</a></li>
                            <li><a href="javascript:void(0);" onclick="myCollect(1)">${who}的收藏</a></li>
                            <li><a href="javascript:void(0);" onclick="myCollect(1)">${who}的礼物</a></li>
                        </ul>

                    </div>

                </div>
                <div class="col-md-10">
                    <div class="nav-content">
                        <p class="lead" id="selectTitle">页面标题</p>
                        <div class="nav-page" id="selectContainer">

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>


</div>


<%--<div class="text-center footer">
    Copyright &copy; 2011-2016 SegmentFault. 当前呈现版本 16.11.22<br>
    <a href="http://www.miibeian.gov.cn/" rel="nofollow">浙ICP备 15005796号-2</a> &nbsp;
    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602002000"
       rel="nofollow">浙公网安备 33010602002000号</a>
</div>--%>

<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
