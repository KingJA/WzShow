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
    <link rel="shortcut icon" href="/img/head_default.jpg">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/shop.css" rel="stylesheet">

    <script type="text/javascript">
        function showBuyModal(giftId, giftName, giftCost, giftUrl) {
            $("#giftName").text(giftName)
            $("#giftCost").text(giftCost)
            $("#giftUrl").attr("src", giftUrl);
            $("#giftId").text(giftId)
            $("#giftCount").val("1")

            $('#buyModal').modal('show')
        }
        function buyGift() {
            if (false) window.location.href = "/account/login";
            else {
                $.ajax({
                    type: "POST",
                    url: "/shop/buy",
                    data: {
                        "accountId": "${sessionScope.account.accountId}",
                        "giftId": $("#giftId").text(),
                        "giftCost": $("#giftCost").text(),
                        "giftCount": $("#giftCount").val()
                    },
                    dataType: "json",
                    success: function (retult) {
                        alert(retult.resultText);
                        if(retult.resultInt!=-1) {
                            $("#coinCount").text(retult.resultInt);
                        }
                    },
                    error: function () {
                        alert("哈哈，buyGift");
                    }
                });
            }
        }

    </script>
</head>

<body style="padding-top: 50px">
<jsp:include page="common/nav.jsp"></jsp:include>


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
                <div class="col-md-10">

                    <div>
                        <p>我的金币:<span>
                            <img src="/img/coin/coin.png" width="20px" height="20px" class="img-rounded">
                        </span><span id="coinCount">${account.coin}</span></p>
                    </div>
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
                                        <p class="text-center"><a
                                                onclick="showBuyModal('${gift.giftId}','${gift.giftName}','${gift.giftCost}','${gift.giftUrl}')"
                                                class="btn btn-warning btn-xs">购买</a></p>
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
                                        <p class="text-center"><a
                                                onclick="showBuyModal('${gift.giftId}','${gift.giftName}','${gift.giftCost}','${gift.giftUrl}')"
                                                class="btn btn-warning btn-xs">购买</a></p>
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
                                        <p class="text-center"><a
                                                onclick="showBuyModal('${gift.giftId}','${gift.giftName}','${gift.giftCost}','${gift.giftUrl}')"
                                                class="btn btn-warning btn-xs">购买</a></p>
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


            </div>
            <%--col-md-10结束--%>
            <div class="col-md-2"><%--col-md-2开始--%>
                <div class="border-20">
                    购买排行
                </div>
            </div>
            <%--col-md-2结束--%>


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


<%--................................................隐藏内容........................................................--%>

<!-- Modal -->
<div class="modal fade" id="buyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div>
                   <span>
                       <img id="giftUrl" width="24px" height="24px" class="img-rounded">
                   </span>
                    <span id="giftName">名称</span>
                    <span id="giftCost">价格</span>
                    <span class="pull-right"> <span>数量:</span><input id="giftCount" type="number" min="1" max="999"
                                                                     maxlength="3"
                                                                     style="width: 50px;text-align: center">
                    </span>
                    <span id="giftId" hidden></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="buyGift();">购买</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
