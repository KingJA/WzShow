<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/9
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pagination">
    <c:if test="${pageInfo.hasPrevious}">
        <li>
            <a href="/personal/${account.accountId}/myGift?page=${pageInfo.previousPage}">&laquo;上一页</a>
        </li>
    </c:if>

    <c:forEach var="x" begin="${pageInfo.pageStart}"
               end="${pageInfo.pageEnd}">

        <c:if test="${pageInfo.currentPage==x}">
            <li class="active"><a href="javascript:return false;">${x}</a></li>
        </c:if>
        <c:if test="${pageInfo.currentPage!=x}">
            <li><a href="/personal/${account.accountId}/myGift?page=${x}">${x}</a></li>
        </c:if>
    </c:forEach>


    <c:if test="${pageInfo.hasNext}">
        <li>
            <a href="/personal/${account.accountId}/myGift?page=${pageInfo.nextPage}">下一页&raquo;</a>
        </li>
    </c:if>
</ul>