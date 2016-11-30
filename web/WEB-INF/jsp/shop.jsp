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
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/shop.css" rel="stylesheet">

    <script type="text/javascript">


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
                <li><a href="/shop">礼品商店</a></li>
                <li class="dropdown">
                    <div class="navbar-form dropdown-toggle" data-toggle="dropdown">
                        <img src="${sessionScope.account.avatar}" width="32px" height="32px" class="img-circle">
                        <span class="caret"></span></div>
                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                        <li><a href="/personal">个人中心</a></li>
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
            <div class="border-20">
                头部
            </div>
        </div>
    </div>
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-md-10"><%--col-md-10开始--%>
                    <div class="border-20 shopWindow">
                        <%--  //${idx.index}--%>
                        <c:if test="${!empty gitfPage.pageDatas}">

                            <c:forEach items="${gitfPage.pageDatas}" var="gift" varStatus="idx">

                                <c:choose>
                                    <c:when test="${idx.index%4== 0}">
                                        <div class="row">
                                        <div class="col-md-3 ">
                                            <div class="border-10-yellow">
                                                <p class="text-center"><img src="${gift.giftUrl}" width="80px"
                                                                            height="80px"
                                                                            class="img-rounded"></p>
                                                <p class="text-center">${gift.giftName}</p>
                                                <p class="text-center">${gift.giftCost} <a href="#"
                                                                                           class="btn btn-warning btn-xs">购买</a>
                                                </p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${(idx.index+1)%4== 0}">
                                        <div class="col-md-3">
                                            <div class="border-10-yellow">
                                                <p class="text-center"><img src="${gift.giftUrl}" width="80px"
                                                                            height="80px"
                                                                            class="img-rounded"></p>
                                                <p class="text-center">${gift.giftName}</p>
                                                <p class="text-center">${gift.giftCost} <a href="#"
                                                                                           class="btn btn-warning btn-xs">购买</a>
                                                </p>
                                            </div>
                                        </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-md-3">
                                            <div class="border-10-yellow">
                                                <p class="text-center"><img src="${gift.giftUrl}" width="80px"
                                                                            height="80px"
                                                                            class="img-rounded"></p>
                                                <p class="text-center">${gift.giftName}</p>
                                                <p class="text-center">${gift.giftCost} <a href="#"
                                                                                           class="btn btn-warning btn-xs">购买</a>
                                                </p>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                    <c:if test="${(idx.index==fn:length(gitfPage.pageDatas)-1)&&!((idx.index+1)%4== 0)}">
                                         </div>
                                    </c:if>
                            </c:forEach>
                        </c:if>


                    </div>
                <%--分页--%>
                <ul class="pagination pagination">
                    <c:if test="${gitfPage.hasPrevious}">
                        <li><a href="/shop/${gitfPage.currentPage-1}">&laquo;上一页</a></li>
                    </c:if>

                    <c:forEach var="x" begin="${gitfPage.pageStart}"
                               end="${gitfPage.pageEnd}">

                        <c:if test="${gitfPage.currentPage==x}">
                            <li class="active"><a href="javascript:return false;">${x}</a></li>
                        </c:if>
                        <c:if test="${gitfPage.currentPage!=x}">
                            <li><a href="/shop/${x}">${x}</a></li>
                        </c:if>
                    </c:forEach>


                    <c:if test="${gitfPage.hasNext}">
                        <li><a href="/shop/${gitfPage.currentPage+1}">下一页&raquo;</a></li>
                    </c:if>
                </ul>



                </div><%--col-md-10结束--%>
                <div class="col-md-2"><%--col-md-2开始--%>
                    <div class="border-20">
                        购买排行
                    </div>
                </div><%--col-md-2结束--%>


            </div>

        </div>


    </div>
</div>

</div>


</div>


<div class="text-center footer">
    Copyright &copy; 2011-2016 SegmentFault. 当前呈现版本 16.11.22<br>
    <a href="http://www.miibeian.gov.cn/" rel="nofollow">浙ICP备 15005796号-2</a> &nbsp;
    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602002000"
       rel="nofollow">浙公网安备 33010602002000号</a>
</div>

</body>
</html>
