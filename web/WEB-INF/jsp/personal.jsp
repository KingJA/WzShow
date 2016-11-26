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
    <script type="text/javascript">
        function setSelectTitle(obj) {
            $("#selectTitle").text($(obj).text());
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type:"GET",
                    url:"/personal/"+$(obj).attr("id"),
                    dataType:"json",
                    success:function (result) {
                        $("#selectContainer").html(result.resultText);
                    },
                    error:function () {
                        alert("厉害了，哈哈");
                    }

                });
            }
        }

        function getQuestions(url) {

        }


    </script>
</head>

<body style="padding-top: 50px >
<%--==================================导航============================================--%>
        <nav class=" navbar navbar-inverse navbar-fixed-top
">
<div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="brand" href="#">${sessionScope.account.name}</a>
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


<%--==============================================================================--%>
<div class="personal-root">
    <div class="head">
        <div class="container">
            <div class="row">
                <div class="col-md-2 ">
                    <div class="head_icon">
                        <img src="/img/head_3.jpg" alt="..." class="img-circle" width="160px" height="160px">

                    </div>

                </div>
                <div class="col-md-10">简洁</div>
            </div>

        </div>
    </div>
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-md-2 ">
                    <div>
                        <ul class="nav nav-pills nav-stacked profile__nav">
                            <li><a href="javascript:void(0);" onclick="setSelectTitle(this)" id="myAsk">我的提问</a></li>
                            <li><a href="javascript:void(0);" onclick="setSelectTitle(this)" id="myAnswer">我的回答</a></li>
                            <li><a href="javascript:void(0);" onclick="setSelectTitle(this)">我的关注</a></li>
                            <li><a href="javascript:void(0);" onclick="setSelectTitle(this)">我的收藏</a></li>
                        </ul>

                    </div>

                </div>
                <div class="col-md-10">
                    <div class="nav-content">
                        <p class="lead" id="selectTitle">页面标题</p>
                        <hr>
                        <div class="nav-page" style="background: #6feed2;height: 70%" id="selectContainer">
                            <div class="selectItem">
                                <h3 class="selectTitle">怎么提高支付宝芝麻分</h3>
                                <p class="selectContent">
                                    多使用支付宝信用卡还款功能并及时还。及时还信用卡可以证明你的偿还能力没问题。关联的信用卡越多，信用额度越高，芝麻分越有可能提升。</p>
                            </div>
                            <div class="selectItem">
                                <h3 class="selectTitle">怎么提高支付宝芝麻分</h3>
                                <p class="selectContent">
                                    多使用支付宝信用卡还款功能并及时还。及时还信用卡可以证明你的偿还能力没问题。关联的信用卡越多，信用额度越高，芝麻分越有可能提升。</p>

                            </div>
                            <div class="selectItem">
                                <h3 class="selectTitle">怎么提高支付宝芝麻分</h3>
                                <p class="selectContent">
                                    多使用支付宝信用卡还款功能并及时还。及时还信用卡可以证明你的偿还能力没问题。关联的信用卡越多，信用额度越高，芝麻分越有可能提升。</p>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>


</div>


<div class="copyright text-center">
    Copyright &copy; 2011-2016 SegmentFault. 当前呈现版本 16.11.22<br>
    <a href="http://www.miibeian.gov.cn/" rel="nofollow">浙ICP备 15005796号-2</a> &nbsp;
    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602002000"
       rel="nofollow">浙公网安备 33010602002000号</a>
</div>

</body>
</html>
