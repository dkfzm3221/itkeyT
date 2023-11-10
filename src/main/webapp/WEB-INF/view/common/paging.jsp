<%--
  Created by IntelliJ IDEA.
  User: dkfzm
  Date: 2023-02-07
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <meta property="og:image"
          content="resources/skin/seederp/assets/images/itkey_full_white_logo.png">
    <meta property="og:title" content="사람을 위한, 사람으로 인한 기업 아이티키 입니다.">

    <link rel="icon" href="/resources/skin/seederp/assets/images/favicon.ico">

    <title>ITKey</title>
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-core.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/skin/seederp/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/skin/seederp/assets/css/font-icons/entypo/css/entypo.css">
    <link rel="stylesheet" type="text/css"
          href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-core.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-theme.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-forms.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/custom.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>
    <title>Title</title>
</head>
<body>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${pageList.isFirstPage}">
                <li class="page-item">
                    <a class="page-link" disabled="true">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" id="previous" href="dashboard?pageNum=${pageList.prePage}&type=${search.type}&keyword=${search.keyword}">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin= "${startPage}" end="${endPage}" var="idx">
            <c:choose>
                <c:when test="${pageList.pageNum == idx}">
                    <li class="page-item"><a disabled="ture" style="font-weight: bold">${idx}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="dashboard?pageNum=${idx}&type=${search.type}&keyword=${search.keyword}">${idx}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${pageList.isLastPage}">
                <li class="page-item">
                    <a class="page-link" disabled="true">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="dashboard?pageNum=${pageList.nextPage}&type=${search.type}&keyword=${search.keyword}">Next</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
</body>
</html>
