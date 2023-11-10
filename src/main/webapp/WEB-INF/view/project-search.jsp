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
                <div class="page-header"><h4 class="page-title">프로젝트 관리 - 검색</h4></div>
                <div class="card">
                    <div class="card-body">
                        <div class="col-md-8" style="margin-bottom: 20px; padding: 0;">
                            <form class="form-inline">
                                <select class="form-control" style="padding: 0.744rem 1rem;">
                                    <option value="">--- 전체 ---</option>
                                    <option value="name">이름</option>
                                </select>
                                <div class="input-group m-search">
                                    <input type="text" name="search_word" class="form-control" style="border-radius: 4px;" placeholder="검색어 입력">
                                    <button type="button" class="btn btn-primary" style="margin-left: 4px;">검색</button>
                                </div>
                            </form>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#searchsupportModal">구인중</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#searchsupportModal">구인중</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-secondary" disabled>완료</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#searchsupportModal">구인중</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-secondary" disabled>완료</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-secondary" disabled>완료</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-secondary" disabled>완료</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#searchsupportModal">구인중</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>프로젝트명</th>
                                            <td>oo은행 유지보수</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>시작일</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>종료예정일</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="mt-3 text-center">
                                        <button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#searchsupportModal">구인중</button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="ml-auto mr-auto" style="margin-top: 20px;">
                                <ul class="pagination">
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 구인중 Modal -->
<div class="modal fade" id="searchsupportModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">프로젝트 지원</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
                    <div class="card-title">프로젝트 정보</div>
                    <table class="text-center">
                        <tr>
                            <th>프로젝트명</th>
                            <td>프로젝트</td>
                        </tr>

                        <tr>
                            <th>시작일</th>
                            <td>2022-10</td>
                        </tr>

                        <tr>
                            <th>종료일</th>
                            <td>2023-10</td>
                        </tr>

                        <tr>
                            <th>등급</th>
                            <td>초급: 1 / 중급: 2 / 고급: 1</td>
                        </tr>

                        <tr>
                            <th>필요기술</th>
                            <td>JAVA, JSP, JS</td>
                        </tr>

                        <tr>
                            <th>위치</th>
                            <td>가산동</td>
                        </tr>

                        <tr>
                            <th>메모(요구사항)</th>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div class="manpower mb-3">
                    <table class="scrolltable scrolltable1">
                        <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>이름</th>
                            <th>지역</th>
                            <th>인터뷰 가능일</th>
                            <th>투입 가능일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>홍길동</td>
                            <td>인천</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>임꺽정</td>
                            <td>서울</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>고길동</td>
                            <td>인천</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>미나리</td>
                            <td>서울</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>고구마</td>
                            <td>인천</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>호랑이</td>
                            <td>인천</td>
                            <td>2022-07-31</td>
                            <td>2022-08-01</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="text-right mt-3">
                        <button type="button" class="btn btn-primary" style="padding: 6px 30px">지원</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>