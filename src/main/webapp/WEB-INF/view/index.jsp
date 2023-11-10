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
                                    <div class="card-title"></div>
                                </div>

                                <div id="boardList">
                                    <table class="text-center boardTable">
                                        <tr>
                                            <th>No.</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                        </tr>

                                        <tr>
                                            <td>04</td>
                                            <td>2년 3개월</td>
                                            <td>연차</td>
                                            <td>2023-11-10</td>
                                        </tr>

                                        <tr>
                                            <td>03</td>
                                            <td>2년 3개월</td>
                                            <td>연차</td>
                                            <td>2023-11-10</td>
                                        </tr>

                                        <tr>
                                            <td>02</td>
                                            <td>2년 3개월</td>
                                            <td>연차</td>
                                            <td>2023-11-10</td>
                                        </tr>

                                        <tr>
                                            <td>01</td>
                                            <td>2년 3개월</td>
                                            <td>연차</td>
                                            <td>2023-11-10</td>
                                        </tr>
                                    </table>
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
</body>
</html>