<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <jsp:include page="common/sidebarNav.jsp"/>
    <jsp:include page="common/popup.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
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
                    <c:forEach items="${boardTypeList}" var="boardType">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-header mb-4 pb-2" style="padding: 0;">
                                        <div class="card-title">
                                            <a href="/boardDetailList?menuBoardType=${boardType.boardType}">${boardType.menuName}</a>
                                        </div>
                                    </div>
                                    <div id="boardList_${boardType}">
                                        <table class="text-center boardTable">
                                            <colgroup>
                                                <col style="width:70px;">
                                                <col style="width:auto">
                                                <col span="4" style="width:120px">
                                            </colgroup>
                                            <thead>
                                            <c:set var="section" value="${pageContext.request.getAttribute('section_'.concat(boardType))}" />
                                            <c:set var="notice" value="${pageContext.request.getAttribute('section__'.concat(boardType))}" />
                                            <!--3번 디자인 영역-->
                                            <c:forEach items="${designList}" var="design" varStatus="index">
                                                <c:if test="${design.designSeq eq 3}">
                                                    ${design.content}
                                                </c:if>
                                            </c:forEach>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${notice}" var="notice">
                                                <tr style="background-color: #FFC600; color: #000000;">
                                                    <td id="noticeSeq">
                                                        <span>공지</span>
                                                    </td>
                                                    <td>${notice.regId}</td>
                                                    <td>
                                                        <a href="/notice/noticeList?noticeSeq=${notice.noticeSeq}">${notice.noticeTitle}</a>
                                                    </td>
                                                    <td>test</td>
                                                    <td>${notice.inqCnt}</td>
                                                    <td>${notice.regDate}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tbody>

                                            <c:if test="${empty section}">
                                            <tr>
                                                <td colspan="6">게시글이 없습니다.</td>
                                            </tr>
                                            </c:if>
                                            <c:if test="${not empty section}">
                                                <c:forEach items="${section}" var="board">
                                                    <tr>
                                                        <td id="boardSeq">
                                                            <c:choose>
                                                                <c:when test="${empty board}">
                                                                    빈 게시글입니다.
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${board.boardSeq}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${board.regNm}</td>
                                                        <td>
                                                            <c:if test="${board.boardSecretYn == 'N'}">
                                                                <a onclick="checkPassword('${board.boardSeq}')">비공개글입니다.</a>
                                                            </c:if>
                                                            <c:if test="${board.boardSecretYn == 'Y'}">
                                                                <a href="/boardDetail?boardSeq=${board.boardSeq}">${board.boardTitle}</a>
                                                            </c:if>
                                                        </td>
                                                        <td>${board.boardSecretYn == 'Y' ? '공개' : '비공개'}</td>
                                                        <td>${board.inqCnt}</td>
                                                        <td>${board.regDt}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                <%--    <button onclick="moveToWriteBoard()" class="btn btn-black w-3" style="float: right;">글쓰기</button>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 게시글 등록화면 이동
       *
       **/--%>
    function moveToWriteBoard() {
        window.location.href = "/writeBoardView";
    }

   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 비밀글 비밀번호 체크
       *
       **/--%>
    function checkPassword(seq){

        let password = prompt("비밀번호를 입력하세요.");

        let boardSeq = seq

        $.ajax({
            type:"POST",
            url: "/boardPassword",
            data: {
                boardSeq : boardSeq
            },
            success: function (data) {
                if(password === data.password) {
                    window.location.href = "/boardDetail?boardSeq=" + seq;
                } else if(password === null) {
                    alert("취소되었습니다.");
                    return false;
                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                }
            }
        });

    }
</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>