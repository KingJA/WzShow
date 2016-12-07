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
                        "accountId": ${account.accountId},
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
                        "accountId": ${account.accountId},
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
                        "accountId": ${account.accountId},
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
        }
        function myAttention(currentPage) {
            $("#selectTitle").text("我的关注");
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/personal/myAttention",
                    dataType: "json",
                    data: {
                        "accountId": ${account.accountId},
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
        function myGift() {
            alert("ddd");
                $("#selectContainer").load("/account/login");
        }

    </script>
</head>

<body style="padding-top: 50px">
<jsp:include page="common/nav.jsp"></jsp:include>
<%--头部导航栏--%>

<div class="personal-container">
    <div class="container">
        <div class="personal-head">
            <div class="row">
                <div class="col-md-2 ">
                    <div class="">
                        <img src="/img/head_3.jpg" alt="..." class="img-circle" width="160px" height="160px">
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
                    <div>
                        <ul class="nav nav-pills nav-stacked profile__nav">
                            <li><a href="javascript:void(0);" onclick="myAsk(1)">${who}的提问</a></li>
                            <li><a href="javascript:void(0);" onclick="myAnswer(1)">${who}的回答</a></li>
                            <li><a href="javascript:void(0);" onclick="myAttention(1)">${who}的关注</a></li>
                            <li><a href="javascript:void(0);" onclick="myCollect(1)">${who}的收藏</a></li>
                            <li><a href="javascript:void(0);" onclick="myGift()">${who}的礼物</a></li>
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
        <%--personal-content--%>

    </div>
    <%--container--%>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
