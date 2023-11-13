<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
                                            <th style="width:10%;">조회수</th>
                                            <th style="width:30%;">등록일</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${boardList}" var="item" varStatus="index">
                                            <tr>
                                                <td>${index.count}</td>
                                                <td>${item.regNm}</td>
                                                <td>${item.boardTitle}</td>
                                                <td>${item.inqCnt}</td>
                                                <td>${item.regDt}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <button onclick="moveToWriteBoard()" class="btn btn-black w-3" style="float: right;">글쓰기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function moveToWriteBoard() {
        window.location.href = "/writeBoardView";
    }
</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>