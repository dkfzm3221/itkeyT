<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.29.1/moment-with-locales.min.js"></script>
<!-- Header END -->
<html lang="ko-kr">
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col">
                        <div class="card-body">
                            <div class="card-title">
                                차트
                            </div>
                            <div class="card-header mb-4 pb-2" style="padding: 0;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <canvas id="mostVisitURL"></canvas>
                                    </div>
                                    <div class="col-md-6">
                                        <canvas id="mostVisitIP"></canvas>
                                    </div>
                                    <div class="col-md-6">
                                        <canvas id="visitDate"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
<script>
    let mostVisitURL = document.getElementById('mostVisitURL').getContext('2d');
    let mostVisitURLLabels = [<c:forEach var="row" items="${mostVisitURL}">'${row.visitRefer}',</c:forEach>];
    let mostVisitURLData = [<c:forEach var="row" items="${mostVisitURL}">${row.urlCount},</c:forEach>];
    let mostVisitURLChart = new Chart(mostVisitURL, {
        type: 'bar',
        data: {
            labels: mostVisitURLLabels,
            datasets: [{
                label: '사용자 선호 페이지',
                data: mostVisitURLData,
                backgroundColor: [
                    'rgba(102, 255, 102, 0.2)',
                    'rgba(255, 102, 102, 0.2)',
                    'rgba(102, 102, 255, 0.2)',
                    'rgba(255, 255, 102, 0.2)',
                    'rgba(102, 255, 255, 0.2)',
                    'rgba(255, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgba(102, 255, 102, 1)',
                    'rgba(255, 102, 102, 1)',
                    'rgba(102, 102, 255, 1)',
                    'rgba(255, 255, 102, 1)',
                    'rgba(102, 255, 255, 1)',
                    'rgba(255, 102, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    let mostVisitIP = document.getElementById('mostVisitIP').getContext('2d');
    let mostVisitIPLabels = [<c:forEach var="row" items="${mostVisitIP}">'${row.visitIp}',</c:forEach>];
    let mostVisitIPData = [<c:forEach var="row" items="${mostVisitIP}">${row.IPCount},</c:forEach>];
    let mostVisitIPChart = new Chart(mostVisitIP, {
        type: 'bar',
        data: {
            labels: mostVisitIPLabels,
            datasets: [{
                label: '많이 방문한 IP',
                data: mostVisitIPData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    })


    let mostVisitDate = document.getElementById('visitDate').getContext('2d');
    let mostVisitDateLabels = [<c:forEach var="row" items="${mostVisitDate}">'${row.visitTimeToDate}',</c:forEach>];
    let mostVisitDateData = [<c:forEach var="row" items="${mostVisitDate}">${row.visitDateCount},</c:forEach>];
    let mostVisitDateChart = new Chart(mostVisitDate, {
        type: 'bar',
        data: {
            labels: mostVisitDateLabels,
            datasets: [{
                label: '날짜별 추이',
                data: mostVisitDateData,
                backgroundColor: [
                    'rgba(102, 255, 102, 0.2)',
                    'rgba(255, 102, 102, 0.2)',
                    'rgba(102, 102, 255, 0.2)',
                    'rgba(255, 255, 102, 0.2)',
                    'rgba(102, 255, 255, 0.2)',
                    'rgba(255, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgba(102, 255, 102, 1)',
                    'rgba(255, 102, 102, 1)',
                    'rgba(102, 102, 255, 1)',
                    'rgba(255, 255, 102, 1)',
                    'rgba(102, 255, 255, 1)',
                    'rgba(255, 102, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    })

</script>
</body>
</html>