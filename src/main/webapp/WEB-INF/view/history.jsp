<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->

<html lang="ko-kr">
<body>
<style>
    .directions {
        margin-top: 20px;
        text-align: center;
    }

    #map {
        display: inline-block;
        text-align: left;
    }

    .directions-text {
        text-align: left;
    }
</style>

<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav.jsp"/>
    <!-- SideBar Navbar END  -->

    <div class="main-panel">
        <div class="container">
            <div class="main-content" xstyle="xwidth:1440px">
                <div class="history-content" style="margin-top: 40px;">
                    <h2 style="text-align: center;">연혁</h2>
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

        <div class="directions">
            <h2>오시는 길</h2>

            <div id="map">
                <!-- * 카카오맵 - 지도퍼가기 -->
                <!-- 1. 지도 노드 -->
                <div id="daumRoughmapContainer1701845867115" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                <!--
                    2. 설치 스크립트
                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                -->
                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                <!-- 3. 실행 스크립트 -->
                <script charset="UTF-8">
                    new daum.roughmap.Lander({
                        "timestamp" : "1701845867115",
                        "key" : "2h4vw",
                        "mapWidth" : "640",
                        "mapHeight" : "360"
                    }).render();
                </script>
            </div>
            <p>서울특별시 금천구 벚꽃로 278 SJ테크노빌 14층 1406호</p>
            <p>전화번호: 010-1234-5678</p>
        </div>
    </div>
</div>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>
