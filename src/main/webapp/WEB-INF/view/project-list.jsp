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
                <div class="page-header"><h4 class="page-title">프로젝트 관리 - 목록</h4></div>
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
                                    <table data-toggle="modal" data-target="#AllModal" style="cursor: pointer">
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
                                        <button class="btn btn-rounded btn-outline-warning col-5 mr-2" data-toggle="modal" data-target="#listrequestModal">요청</button>
                                        <button class="btn btn-rounded btn-outline-info col-5" data-toggle="modal" data-target="#listsupportModal">지원</button>
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
                                        <button class="btn btn-rounded btn-outline-warning col-5 mr-2" data-toggle="modal" data-target="#listrequestModal" disabled>요청</button>
                                        <button class="btn btn-rounded btn-outline-info col-5" data-toggle="modal" data-target="#listsupportModal" disabled>지원</button>
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
                                        <button class="col-5 btn btn-rounded btn-outline-secondary" data-toggle="modal" data-target="#temporaryModal">임시저장</button>
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
                                        <button class="btn btn-rounded btn-outline-warning col-5 mr-2" data-toggle="modal" data-target="#listrequestModal">요청</button>
                                        <button class="btn btn-rounded btn-outline-info col-5" data-toggle="modal" data-target="#listsupportModal">지원</button>
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
                                        <button class="btn btn-rounded btn-outline-warning col-5 mr-2" data-toggle="modal" data-target="#listrequestModal">요청</button>
                                        <button class="btn btn-rounded btn-outline-info col-5" data-toggle="modal" data-target="#listsupportModal">지원</button>
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
                                        <button class="btn btn-rounded btn-outline-warning col-5 mr-2" data-toggle="modal" data-target="#listrequestModal">요청</button>
                                        <button class="btn btn-rounded btn-outline-info col-5" data-toggle="modal" data-target="#listsupportModal">지원</button>
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

<!-- 요청 Modal -->
<div class="modal fade" id="listrequestModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">가용인력</h4>
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
                        <button type="button" class="btn btn-primary" style="padding: 6px 30px">요청</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 지원 Modal -->
<div class="modal fade" id="listsupportModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">프로젝트 지원 상세</h4>
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
                    <table class="scrolltable scrolltable2">
                        <thead>
                        <tr>
                            <th>이름</th>
                            <th>지역</th>
                            <th>인터뷰 가능일</th>
                            <th>투입 가능일</th>
                            <th>열람</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>홍길동</td>
                            <td>인천</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>임꺽정</td>
                            <td>서울</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>고길동</td>
                            <td>인천</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>미나리</td>
                            <td>서울</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>고구마</td>
                            <td>인천</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>호랑이</td>
                            <td>인천</td>
                            <td>22-07-31</td>
                            <td>22-08-01</td>
                            <td>
                                <button class="btn btn-round mr-1"><i class="fas fa-download"></i></button>
                                <button class="btn btn-round"><i class="fas fa-envelope"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 정보 상세 Modal -->
<div class="modal fade" id="AllModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">프로젝트 정보 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
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

                <div class="mt-4 mb-2 text-center">
                    <a href="#" class="btn btn-black btn-rounded" data-toggle="modal" data-target="#ReProjectModal">수정</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 임시저장 Modal -->
<div class="modal fade" id="temporaryModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">프로젝트 정보</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
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

                <div class="mt-4 mb-2 text-center">
                    <a href="#" class="btn btn-success btn-rounded mr-2" style="padding: 0.65rem 1.7rem;">승인</a>
                    <a href="#" class="btn btn-black btn-rounded">재요청</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 임시저장 Modal -->
<div class="modal fade" id="ReProjectModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">프로젝트 정보 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="height: 60vh; overflow-y: auto;">
                <div class="login-form">
                    <div class="form-group">
                        <label class="form-label">프로젝트명</label>
                        <input type="text" class="form-control">
                    </div>

                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">시작일</label>
                            <div class="w-100">
                                <input type="date" class="form-control" required>
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="form-label">종료일</label>
                            <div class="w-100">
                                <input type="date" class="form-control" required>
                            </div>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">근무지역</label>
                            <div class="selectgroup w-100">
                                <select class="form-control">
                                    <option>지역1</option>
                                    <option>지역2</option>
                                </select>

                                <select class="form-control ml-2">
                                    <option>지역1</option>
                                    <option>지역2</option>
                                </select>
                            </div>
                        </div>


                        <div class="col-6">
                            <label class="form-label">소속이관</label>
                            <div class="selectgroup w-100">
                                <label class="selectgroup-item">
                                    <input type="radio" name="transfer" class="selectgroup-input" checked="">
                                    <span class="selectgroup-button">가능</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="transfer" class="selectgroup-input">
                                    <span class="selectgroup-button">불가능</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="row form-group" style="padding:0 10px;">
                        <div class="col-6">
                            <label class="form-label">성별</label>
                            <div class="selectgroup w-100">
                                <label class="selectgroup-item">
                                    <input type="radio" name="gender" class="selectgroup-input" checked="">
                                    <span class="selectgroup-button">남</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="gender" class="selectgroup-input">
                                    <span class="selectgroup-button">여</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="gender" class="selectgroup-input">
                                    <span class="selectgroup-button">무관</span>
                                </label>
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="form-label">기사</label>
                            <div class="selectgroup w-100">
                                <label class="selectgroup-item">
                                    <input type="radio" class="selectgroup-input" name="have">
                                    <span class="selectgroup-button">있음</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="have" class="selectgroup-input">
                                    <span class="selectgroup-button">없음</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">학력</label>
                        <div class="selectgroup w-100">
                            <label class="selectgroup-item">
                                <input type="radio" class="selectgroup-input" name="education">
                                <span class="selectgroup-button">고졸 이상</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="radio" class="selectgroup-input" name="education">
                                <span class="selectgroup-button">전문학사 이상</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="radio" class="selectgroup-input" name="education">
                                <span class="selectgroup-button">학사 이상</span>
                            </label>
                        </div>
                    </div>

                    <div class="row form-group" style="padding: 0 25px;">
                        <label class="form-label">등급/연차</label>
                        <div class="selectgroup w-100">
                            <select class="form-control">
                                <option>초급</option>
                                <option>중급</option>
                                <option>고급</option>
                            </select>

                            <select class="form-control ml-2">
                                <option>2년 이상</option>
                                <option>3년 이상</option>
                                <option>4년 이상</option>
                                <option>5년 이상</option>
                            </select>

                            <button class="btn btn-right">추가</button>
                        </div>

                        <div class="bootstrap-tagsinput pt-2">
                            <span class="tag badge badge-info">초급 3년 이상<span data-role="remove"></span></span>
                            <span class="tag badge badge-info">초급 5년 이상<span data-role="remove"></span></span>
                            <span class="tag badge badge-info">중급 3년 이상<span data-role="remove"></span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">기술</label>
                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="Win" class="selectgroup-input">
                                <span class="selectgroup-button">Win</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="Linux" class="selectgroup-input">
                                <span class="selectgroup-button">Linux</span>
                            </label>
                        </div>

                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="Oracle" class="selectgroup-input">
                                <span class="selectgroup-button">Oracle</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="MySQL" class="selectgroup-input">
                                <span class="selectgroup-button">MySQL</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="MySSQL" class="selectgroup-input">
                                <span class="selectgroup-button">MSSQL</span>
                            </label>
                        </div>

                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="JAVA" class="selectgroup-input">
                                <span class="selectgroup-button">JAVA</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="JSP" class="selectgroup-input">
                                <span class="selectgroup-button">JSP</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="JavaScript" class="selectgroup-input">
                                <span class="selectgroup-button">JavaScript</span>
                            </label>
                        </div>

                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="Spring" class="selectgroup-input">
                                <span class="selectgroup-button">Spring</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" name="value" value="E-Gov" class="selectgroup-input">
                                <span class="selectgroup-button">E-Gov</span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="comment">추가 요청사항</label>
                        <textarea class="form-control" id="comment" rows="4"></textarea>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-black btn-rounded ml-auto mr-auto">수정완료</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>