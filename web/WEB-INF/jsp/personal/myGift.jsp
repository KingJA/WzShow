<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/8
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>礼物</title>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/shop.css" rel="stylesheet">

</head>
<body>
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
                    <p class="text-center"><span>${gift.giftName}</span><span><img
                            src="/img/coin/coin.png" width="20px"
                            height="20px"
                            class="img-rounded"></span><span>${gift.giftCost}</span></p>
                    <p class="text-center">数量:<span>${gift.giftCount}</span></p>
                </div>
            </div>
        </c:when>
        <c:when test="${(idx.index+1)%4== 0}">
            <div class="col-md-3">
                <div class="border-10-yellow">
                    <p class="text-center"><img src="${gift.giftUrl}" width="80px"
                                                height="80px"
                                                class="img-rounded"></p>
                    <p class="text-center"><span>${gift.giftName}</span><span><img
                            src="/img/coin/coin.png" width="20px"
                            height="20px"
                            class="img-rounded"></span><span>${gift.giftCost}</span></p>
                    <p class="text-center">数量:<span>${gift.giftCount}</span></p>
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
                    <p class="text-center"><span>${gift.giftName}</span><span><img
                            src="/img/coin/coin.png" width="20px"
                            height="20px"
                            class="img-rounded"></span><span>${gift.giftCost}</span></p>
                    <p class="text-center">数量:<span>${gift.giftCount}</span></p>
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
            <li><a href="javascript:void(0);" onclick="myGift('${accountId}','${x}')">${x}</a></li>
        </c:if>
    </c:forEach>


    <c:if test="${gitfPage.hasNext}">
        <li><a href="/shop/${gitfPage.currentPage+1}">下一页&raquo;</a></li>
    </c:if>
</ul>
</div>
</body>
</html>
