<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/7
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li class=""><a href="/">Other</a></li>
            </ul>

            <form class="navbar-form navbar-left" role="form" action="/home/search" method="post">
                <div class="form-group">
                    <input type="text" placeholder="请输入关键字" class="form-control" name="keyword">
                </div>
                <button class="btn btn-primary btn-success" type="submit">搜索</button>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <div class="navbar-form dropdown-toggle" data-toggle="dropdown">
                        <img src="${sessionScope.account.avatar}" width="32px" height="32px" class="img-circle">
                        <span class="caret"></span></div>
                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                        <li><a href="/personal/${sessionScope.account.accountId}">个人中心</a></li>
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
