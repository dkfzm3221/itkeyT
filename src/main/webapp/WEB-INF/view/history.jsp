<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->

<html lang="ko-kr">
<body>
<style>
    #map {
        height: 400px;
        width: 80%;
        margin: 0 auto;
    }

    .directions {
        margin-top: 20px;
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
                    <h2>연혁</h2>
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

            <div id="map"></div>

            <p>서울특별시 금천구 가산동 벚꽃로 298 대륭포스트타워 6차 1311호</p>
            <p>전화번호: 010-1234-5678</p>
        </div>
    </div>
</div>

<%-- KakaoMap --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491fe7793b5a1aec24a7088f10092894&libraries=services,clusterer,drawing"></script>

<script>
    var companyAddr = '서울특별시 금천구 벚꽃로 298';

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.481146, 126.883929), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
    function setMapType(maptype) {
        var skyviewControl = document.getElementById('btnSkyview');
        if (maptype === 'roadmap') {
            map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
            skyviewControl.className = 'btn';
        } else {
            map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
            skyviewControl.className = 'selected_btn';
        }
    }

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(companyAddr, function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;cursor:pointer;" ' +
                    'onclick="openSearchPage(companyAddr)">' + companyAddr + '</div>'
            });

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            infowindow.open(map, marker);

            // 인포윈도우에 클릭 이벤트를 등록합니다
            kakao.maps.event.addListener(infowindow, 'click', function() {
                // 해당 URL로 이동
                window.location.href = 'https://map.kakao.com/?urlX=474490.0&urlY=1105586.0&name=%EC%84%9C%EC%9A%B8%20%EA%B8%88%EC%B2%9C%EA%B5%AC%20%EB%B2%9A%EA%BD%83%EB%A1%9C%20278&map_type=TYPE_MAP&from=roughmap';
            });

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });

    // 검색
    function openSearchPage(companyAddr) {
        window.open('https://map.kakao.com/?urlX=474490.0&urlY=1105586.0&name=' + companyAddr + '&map_type=TYPE_MAP&from=roughmap', '_blank');
    }
</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>
