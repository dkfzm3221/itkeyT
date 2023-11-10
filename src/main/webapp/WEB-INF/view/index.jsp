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

<!-- Calendar info Modal -->
<div class="modal fade" id="cld-info-Modal">
    <div class="modal-xl modal-dialog2 modal-dialog2-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><strong>홍길동</strong> 님 프로젝트 이력사항</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="img-profile"></div>

                <div class="project-info">
                    <table class="text-center">
                        <tr>
                            <th>프로젝트</th>
                            <td>영등포 한국전력 프로젝트</td>
                        </tr>

                        <tr>
                            <th>연차</th>
                            <td>2년 3개월</td>
                        </tr>

                        <tr>
                            <th>지역</th>
                            <td>인천</td>
                        </tr>

                        <tr>
                            <th>기간</th>
                            <td>21-12-31 ~ 22-12-31</td>
                        </tr>

                        <tr>
                            <th>단가</th>
                            <td>8,000,000</td>
                        </tr>
                    </table>
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