<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->

<html lang="ko-kr">
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav.jsp"/>
    <!-- SideBar Navbar END  -->

    <div class="main-panel">
        <div class="container">
            <div class="main-content" xstyle="xwidth:1440px">
                <div class="history-content" style="margin-top: 40px;">
                    <c:if test="${empty historyList}">
                        <p>현재까지 작성된 연혁이 없습니다.</p>
                    </c:if>
                    <c:if test="${not empty historyList}">
                        <c:forEach items="${historyList}" var="history" varStatus="status">
                            <c:if test="${(status.index eq 0) or (history.year ne historyList[status.index - 1].year)}">
                                <h2>${history.year}년</h2>
                                <div class="table-responsive">
                                    <table class="table">
                                        <colgroup>
                                            <col width="60">
                                        </colgroup>
                                        <tbody>
                                        <tr class="active">
                                            <th>월</th>
                                            <th>주요내용</th>
                                        </tr>
                                        </tbody>
                                        <c:set var="currentYear" value="${history.year}"/>
                                        <c:forEach items="${historyList}" var="item" varStatus="innerStatus">
                                            <c:if test="${item.year eq currentYear}">
                                                <tr>
                                                    <th class="en">${item.month}</th>
                                                    <td>${item.content}</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>
