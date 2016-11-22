<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a href="/account/login">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">


    <!-- 问题 -->
    <div class="jumbotron">
        <div class="page-header">
            <h2>蛋炒饭做法</h2>
            <h5><span class="label label-primary">生活</span></h5>
            <p class="lead">有一首歌 歌里说 最简单也最困难 饭要粒粒分开 还要沾着蛋最简单也最困难 中国五千年 火的艺术 就在这一盘饭要粒粒分开 还要沾着蛋 怎么做 火的 艺术是指火候吗 该用什么火 蛋
                要结的吗 放蛋是直接破壳然后放还是 先放在一碗里不停的搅?说的好在加分.</p>
        </div>
        <hr>
        <img src="/img/default_img.png"><br>
        <img src="/img/default_img.png"><br>
        <img src="/img/default_img.png">

        <div class="row">
            <div class="pull-right">
                <p class="lead"> 2016-10-18 10:25:22 <a href="#">Mark</a></p>
            </div>
        </div>

    </div>
    <!-- 留言 -->
    <p class="lead">共有<a>5</a>条留言</p>
    <div class="jumbotron">

        <div class="row">

           <img src="/img/head.png" width="48px" height="48px"><a href="#">Mark</a>

            <div class="pull-right">
                <p class="lead">2016-10-18 10:25:22 </p>
            </div>
        </div>


        <p class="lead"> 你好，可以直接用剩饭:把鸡蛋放在油锅里面捣散不让他一大块一大块的（火不要太大怕烧焦）炒好鸡蛋先撩起来放在容器里备用，
            然后在炒点蔬菜通常是胡萝卜丁等一些味道不是很有味道的，最后就把饭碾散开，加入炒好的蛋加点油开中火炒干水分即可。</p>

        <div class="row">
            <div class="pull-right">
                <img src="/img/praise.png" width="24px" height="24px"> 5&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="/img/favorite.png" width="24px" height="24px"> 10
            </div>
        </div>

        <hr>
        <div class="row">

            <img src="/img/head.png" width="48px" height="48px"><a href="#">Mark</a>

            <div class="pull-right">
                <p class="lead">2016-10-18 10:25:22 </p>
            </div>
        </div>


        <p class="lead"> 你好，可以直接用剩饭:把鸡蛋放在油锅里面捣散不让他一大块一大块的（火不要太大怕烧焦）炒好鸡蛋先撩起来放在容器里备用，
            然后在炒点蔬菜通常是胡萝卜丁等一些味道不是很有味道的，最后就把饭碾散开，加入炒好的蛋加点油开中火炒干水分即可。</p>

        <div class="row">
            <div class="pull-right">
                <img src="/img/praise.png" width="24px" height="24px"> 5&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="/img/favorite.png" width="24px" height="24px"> 10
            </div>
        </div>

        <hr>

    </div>


    <!-- Site footer -->
    <div class="blog-footer">
        <p>
            <a href="#">Back to top</a>
        </p>
    </div>
</div>
</body>
</html>
