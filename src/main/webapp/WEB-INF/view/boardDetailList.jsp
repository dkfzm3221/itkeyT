<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<style>
    .boardTable {
        border-collapse: collapse;
    }
    .boardTable th, .boardTable td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .boardTable tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .boardTable th {
        background-color: #1572E8;
        color: white;
    }
</style>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">전체 게시글</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round">
                                </div>
                            </div>

                            <div class="col-6">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">

                                <div class="card-header mb-4 pb-2" style="padding: 0;">
                                    <div class="card-title">
                                    </div>
                                </div>
                                <div id="boardList">
                                    <table class="text-center boardTable">
                                        <colgroup>
                                            <col style="width:70px;">
                                            <col style="width:auto">
                                            <col span="4" style="width:120px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="width:10%;">No.</th>
                                            <th style="width:10%;">작성자</th>
                                            <th style="width:40%;">제목</th>
                                            <th style="width:10%;">공개/비공개</th>
                                            <th style="width:10%;">조회수</th>
                                            <th style="width:30%;">등록일</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${boardDetailList}" var="item" varStatus="index">
                                            <tr>
                                                <td style="text-align:center;">${index.index + 1}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${item.boardSecretYn == 'N'}">비공개</c:when>
                                                        <c:otherwise>${item.regNm}</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${item.boardSecretYn == 'N'}"><a onclick="checkPassword('${item.boardSeq}')">비공개글입니다.</a></c:when>
                                                        <c:otherwise><a href="/boardDetail?boardSeq=${item.boardSeq}">${item.boardTitle}</a></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${item.boardSecretYn == 'Y' ? '공개' : '비공개'}</td>
                                                <td>${item.inqCnt}</td>
                                                <td>${item.regDt}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:forEach begin="${pageInfo.startPageGroup}" end="${pageInfo.endPageGroup}" var="pageNumber">
                                        <c:choose>
                                            <c:when test="${pageNumber == pageInfo.currentPage}">
                                                <li class="page-item active">
                                                    <span class="page-link">${pageNumber}</span>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="/?pageNum=${pageNumber}">${pageNumber}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                        <button onclick="moveToWriteBoard()" class="btn btn-black w-3" style="float: right;">글쓰기</button>
                    </div>
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