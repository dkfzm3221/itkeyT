<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
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
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">이번달dddd 현황(23-02-011 ~ 23-02-28)</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body text-center" onclick="show_cnt_list('전체진행');">
                                        <div class="numbers">
                                            <h4 class="card-title">프로젝트 진행</h4>
                                            <div class="num icon-big" style="color: #1572E8; font-weight: 600;" data-start="0" data-end="0" data-postfix="" data-duration="1500" data-delay="1200">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body text-center" onclick="show_cnt_list('철수');">
                                        <div class="numbers">
                                            <h4 class="card-title">철수</h4>
                                            <div class="num icon-big" style="color: #f56954; font-weight: 600;" data-start="0" data-end="0" data-postfix="" data-duration="1500" data-delay="600">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">전체 현황</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round" style="background: #657686;">
                                    <div class="card-body text-center">
                                        <div class="numbers">
                                            <h4 class="card-title" style="color: #fff;">프로젝트 등록</h4>
                                            <div class="num icon-big" style="font-weight: 600; color: #fff;">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="card card-stats card-round" style="background: #657686;">
                                    <div class="card-body text-center">
                                        <div class="numbers">
                                            <h4 class="card-title" style="color: #fff;">이력 요청</h4>
                                            <div class="num icon-big" style="font-weight: 600; color: #fff;">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-header mb-4 pb-2" style="padding: 0;">
                                    <div class="card-title">이달 총 매출 : 1,000,000,000 원</div>
                                </div>

                                <div id="calendar"></div>
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