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
                <div class="page-header"><h4 class="page-title">가용인력</h4></div>
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

                        <div class="row ctgy">
                            <div class="col-8" style="padding-right: 0;">
                                <ul class="nav nav-pills nav-primary">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">전체</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">공개</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">비공개</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col text-right" style="padding-left: 0;">
                                <button class="btn btn-black" style="margin: 5px 0;" data-toggle="modal" data-target="#newinfoModal"><span class="btn-label"><i class="fa fa-plus"></i></span>직원등록</button>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table data-toggle="modal" data-target="#UserInfoModal" style="cursor: pointer;">
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-success btn-rounded w-50">공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-success btn-rounded w-50">공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-success btn-rounded w-50">공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-success btn-rounded w-50">공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-gray btn-rounded w-50">비공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-gray btn-rounded w-50">비공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-gray btn-rounded w-50">비공개</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3 mb-5">
                                <div class="main-info">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <td>홍길동</td>
                                        </tr>

                                        <tr>
                                            <th>연차</th>
                                            <td>1년 6개월</td>
                                        </tr>

                                        <tr>
                                            <th>지역</th>
                                            <td>서울</td>
                                        </tr>

                                        <tr>
                                            <th>인터뷰 가능</th>
                                            <td>22-08-05</td>
                                        </tr>

                                        <tr>
                                            <th>투입 가능</th>
                                            <td>22-08-05</td>
                                        </tr>
                                    </table>

                                    <div class="text-center mt-3">
                                        <button tyle="button" class="btn btn-gray btn-rounded w-50" data-toggle="modal" data-target="#skillModal">비공개</button>
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

<!-- 직원등록 Modal -->
<div class="modal fade" id="newinfoModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">직원등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="col-12 mt-2 mb-2">
                <ul class="nav nav-pills nav-primary" id="pills-tab" role="tablist">
                    <li class="nav-item w-50 text-center">
                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">기본정보</a>
                    </li>
                    <li class="nav-item w-50 text-center">
                        <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">스킬인벤토리</a>
                    </li>
                </ul>
            </div>

            <div class="modal-body" style="padding: 0 1rem; height: 60vh; overflow-y: auto;">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <div class="w-100 text-right">
                            <button class="btn btn-round mb-2" data-toggle="modal" data-target="#basicinfoModal">기본정보 편집</button>
                        </div>
                        <div class="project-info text-center">
                            <table>
                                <tr>
                                    <th>한글 성명</th>
                                    <td>홍길동</td>
                                </tr>

                                <tr>
                                    <th>영문 성명</th>
                                    <td>Hong Gil Dong</td>
                                </tr>

                                <tr>
                                    <th>생년월일</th>
                                    <td>1986.02.08</td>
                                </tr>

                                <tr>
                                    <th>거주지역</th>
                                    <td>인천</td>
                                </tr>

                                <tr>
                                    <th>실경력</th>
                                    <td>3년차</td>
                                </tr>

                                <tr>
                                    <th>등급</th>
                                    <td>중급</td>
                                </tr>

                                <tr>
                                    <th>소속</th>
                                    <td>소속1</td>
                                </tr>

                                <tr>
                                    <th>이관</th>
                                    <td>가능</td>
                                </tr>
                            </table>
                        </div>

                        <div class="education-box">
                            <div class="card-title" style="font-weight: 600;">학력</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>최종학력</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학교</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학과</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학위</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>입학</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>졸업</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="career-box">
                            <div class="card-title" style="font-weight: 600;">경력</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>회사명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>직위</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>담당업무</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>입사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>퇴사</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="educomp-box">
                            <div class="card-title" style="font-weight: 600;">교육이수</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>학원</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>과정명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>기간</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="certificate-box">
                            <div class="card-title" style="font-weight: 600;">자격사항</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>자격명</th>
                                        <td>자격증1</td>
                                    </tr>

                                    <tr>
                                        <th>발행처</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>취득일자</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>자격명</th>
                                        <td>자격증2</td>
                                    </tr>

                                    <tr>
                                        <th>발행처</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>취득일자</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        <div class="skill-box mb-4">
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>프로젝트명</th>
                                        <td>oo 프로젝트</td>
                                    </tr>

                                    <tr>
                                        <th>참여기간</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>고객사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>역할</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>OS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>언어</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>DBMS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>TOOL</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>업무내용</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="text-right mb-2">
                                <button class="btn btn-round btn-danger" style="padding: 6px 30px;">삭제</button>
                                <button class="btn btn-round btn-dark ml-2" style="padding: 6px 30px;">수정</button>
                            </div>
                        </div>

                        <div class="skill-box">
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>프로젝트명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>참여기간</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>고객사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>역할</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>OS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>언어</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>DBMS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>TOOL</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>업무내용</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="text-right mb-2">
                                <button class="btn btn-round" style="padding: 6px 30px;" data-toggle="modal" data-target="#skillModal"><i class="fa fa-plus"></i> 스킬 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-black btn-rounded ml-auto mr-auto">등록</button>
            </div>
        </div>
    </div>
</div>

<!-- 기본정보 입력 Modal -->
<div class="modal fade" id="basicinfoModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">기본정보</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="height: 60vh; overflow-y: auto;">
                <div class="login-form mb-2">
                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">한글 성명</label>
                            <div class="w-100">
                                <input type="text" class="form-control" required>
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="form-label">영문 성명</label>
                            <div class="w-100">
                                <input type="text" class="form-control" required>
                            </div>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">생년월일</label>
                            <div class="w-100">
                                <input type="date" class="form-control" required>
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="form-label">거주지역</label>
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
                    </div>

                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">실경력</label>
                            <div class="w-100">
                                <input type="text" class="form-control" required>
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="form-label">등급</label>
                            <select class="form-control">
                                <option>초급</option>
                                <option>중급</option>
                                <option>고급</option>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-6">
                            <label class="form-label">소속</label>
                            <select class="form-control">
                                <option>소속1</option>
                                <option>소속2</option>
                                <option>소속3</option>
                            </select>
                        </div>

                        <div class="col-6">
                            <label class="form-label">이관</label>
                            <select class="form-control">
                                <option>가능</option>
                                <option>불가능</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">학력</div>
                    <div class="form-group">
                        <div class="class-info">
                            <table>
                                <tr>
                                    <th>최종학력</th>
                                    <td>
                                        <select class="form-control input-full">
                                            <option>최종학력 1</option>
                                            <option>최종학력 2</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <th>학교</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>학과</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>학위</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>입학</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>졸업</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>
                            </table>

                            <div class="text-right mt-3 mb-2">
                                <button class="btn btn-round btn-danger" style="padding: 6px 30px;"><i class="fa fa-minus"></i> 삭제</button>
                            </div>
                        </div>

                        <div class="class-info">
                            <table>
                                <tr>
                                    <th>최종학력</th>
                                    <td>
                                        <select class="form-control input-full">
                                            <option>최종학력 1</option>
                                            <option>최종학력 2</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <th>학교</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>학과</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>학위</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>입학</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>졸업</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>
                            </table>

                            <div class="text-right mt-3 mb-2">
                                <button class="btn btn-round" style="padding: 6px 30px;"><i class="fa fa-plus"></i> 추가</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">경력</div>
                    <div class="form-group">
                        <div class="class-info">
                            <table>
                                <tr>
                                    <th>회사명</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>직위</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>담당업무</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>입사</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>퇴사</th>
                                    <td><input type="date" class="form-control"></td>
                                </tr>
                            </table>

                            <div class="text-right mt-3 mb-2">
                                <button class="btn btn-round" style="padding: 6px 30px;"><i class="fa fa-plus"></i> 추가</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">교육이수</div>
                    <div class="form-group">
                        <div class="class-info">
                            <table>
                                <tr>
                                    <th>학원</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>과정명</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>기간</th>
                                    <td>
                                        <div class="row p-0 form-group">
                                            <div class="col-6">
                                                <input type="date" class="form-control" required>
                                            </div>
                                            <div class="col-6">
                                                <input type="date" class="form-control" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <div class="text-right mt-3 mb-2">
                                <button class="btn btn-round" style="padding: 6px 30px;"><i class="fa fa-plus"></i> 추가</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">자격사항</div>
                    <div class="form-group">
                        <div class="class-info">
                            <table>
                                <tr>
                                    <th>자격명</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>발행처</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>

                                <tr>
                                    <th>취득일자</th>
                                    <td><input type="text" class="form-control"></td>
                                </tr>
                            </table>

                            <div class="text-right mt-3 mb-2">
                                <button class="btn btn-round" style="padding: 6px 30px;"><i class="fa fa-plus"></i> 추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-black btn-rounded ml-auto mr-auto">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- 스킬 인벤토리 입력 Modal -->
<div class="modal fade" id="skillModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">스킬 인벤토리</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="height: 60vh; overflow-y: auto;">
                <div class="login-form mb-2">
                    <div class="form-group">
                        <label class="form-label">프로젝트명</label>
                        <div class="w-100">
                            <input type="text" class="form-control" required>
                        </div>
                    </div>

                    <div class="row form-group" style="padding: 0.5rem 25px;">
                        <label class="form-label">참여기간</label>
                        <div class="selectgroup w-100">
                            <input type="date" class="form-control" required>
                            <input type="date" class="form-control ml-3" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">고객사</label>
                        <div class="w-100">
                            <input type="text" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">역할</label>
                        <div class="selectgroup w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" class="selectgroup-input" name="role">
                                <span class="selectgroup-button">개발</span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="checkbox" class="selectgroup-input" name="role">
                                <span class="selectgroup-button">운영</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="login-form">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">개발환경</div>
                    <div class="form-group pb-0">
                        <label class="form-label">OS</label>
                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="OS" value="Win" class="selectgroup-input">
                                <span class="selectgroup-button">Win</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="OS" value="Linux" class="selectgroup-input">
                                <span class="selectgroup-button">Linux</span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group pb-0">
                        <label class="form-label">언어</label>
                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="lang" value="Java" class="selectgroup-input">
                                <span class="selectgroup-button">Java</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="lang" value="JSP" class="selectgroup-input">
                                <span class="selectgroup-button">JSP</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="lang" value="JavaScript" class="selectgroup-input">
                                <span class="selectgroup-button">JavaScript</span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group pb-0">
                        <label class="form-label">DBMS</label>
                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="DBMS" value="Oracle" class="selectgroup-input">
                                <span class="selectgroup-button">Oracle</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="DBMS" value="MySQL" class="selectgroup-input">
                                <span class="selectgroup-button">MySQL</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="DBMS" value="MSSQL" class="selectgroup-input">
                                <span class="selectgroup-button">MSSQL</span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">TOOL</label>
                        <div class="selectgroup selectgroup-pills w-100">
                            <label class="selectgroup-item">
                                <input type="checkbox" name="TOOL" value="Spring" class="selectgroup-input">
                                <span class="selectgroup-button">Spring</span>
                            </label>

                            <label class="selectgroup-item">
                                <input type="checkbox" name="TOOL" value="E-Gov" class="selectgroup-input">
                                <span class="selectgroup-button">E-Gov</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="login-form mb-2">
                    <div class="card-title" style="font-weight: 600; padding-top: 10px; border-top: 1px solid #e9ecef">업무내용</div>
                    <div class="form-group">
                        <textarea class="form-control" id="comment" rows="3"></textarea>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-black btn-rounded ml-auto mr-auto">저장</button>
            </div>
        </div>
    </div>
</div>

<!--직원이력 Modal -->
<div class="modal fade" id="UserInfoModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><strong>홍길동</strong> 님 프로젝트 이력사항</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="col-12 mt-2 mb-2">
                <ul class="nav nav-pills nav-primary" id="pills-tab-without-border" role="tablist">
                    <li class="nav-item w-50 text-center">
                        <a class="nav-link active" id="pills-home-tab-nobd" data-toggle="pill" href="#pills-home-nobd" role="tab" aria-controls="pills-home-nobd" aria-selected="true">기본정보</a>
                    </li>
                    <li class="nav-item w-50 text-center">
                        <a class="nav-link" id="pills-profile-tab-nobd" data-toggle="pill" href="#pills-profile-nobd" role="tab" aria-controls="pills-profile-nobd" aria-selected="false">스킬인벤토리</a>
                    </li>
                </ul>
            </div>

            <div class="modal-body" style="padding: 0 1rem; height: 60vh; overflow-y: auto;">
                <div class="tab-content" id="pills-without-border-tabContent">
                    <div class="tab-pane fade show active" id="pills-home-nobd" role="tabpanel" aria-labelledby="pills-home-tab-nobd">
                        <div class="img-profile"></div>

                        <div class="project-info text-center">
                            <table>
                                <tr>
                                    <th>한글 성명</th>
                                    <td>홍길동</td>
                                </tr>

                                <tr>
                                    <th>영문 성명</th>
                                    <td>Hong Gil Dong</td>
                                </tr>

                                <tr>
                                    <th>생년월일</th>
                                    <td>1986.02.08</td>
                                </tr>

                                <tr>
                                    <th>거주지역</th>
                                    <td>인천</td>
                                </tr>

                                <tr>
                                    <th>실경력</th>
                                    <td>3년차</td>
                                </tr>

                                <tr>
                                    <th>등급</th>
                                    <td>중급</td>
                                </tr>

                                <tr>
                                    <th>소속</th>
                                    <td>소속1</td>
                                </tr>

                                <tr>
                                    <th>이관</th>
                                    <td>가능</td>
                                </tr>
                            </table>
                        </div>

                        <div class="education-box">
                            <div class="card-title" style="font-weight: 600;">학력</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>최종학력</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학교</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학과</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>학위</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>입학</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>졸업</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="career-box">
                            <div class="card-title" style="font-weight: 600;">경력</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>회사명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>직위</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>담당업무</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>입사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>퇴사</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="educomp-box">
                            <div class="card-title" style="font-weight: 600;">교육이수</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>학원</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>과정명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>기간</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="certificate-box">
                            <div class="card-title" style="font-weight: 600;">자격사항</div>
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>자격명</th>
                                        <td>자격증1</td>
                                    </tr>

                                    <tr>
                                        <th>발행처</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>취득일자</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pills-profile-nobd" role="tabpanel" aria-labelledby="pills-profile-tab-nobd">
                        <div class="skill-box mb-4">
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>프로젝트명</th>
                                        <td>oo 프로젝트</td>
                                    </tr>

                                    <tr>
                                        <th>참여기간</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>고객사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>역할</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>OS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>언어</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>DBMS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>TOOL</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>업무내용</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="skill-box">
                            <div class="project-info text-center">
                                <table>
                                    <tr>
                                        <th>프로젝트명</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>참여기간</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>고객사</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>역할</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>OS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>언어</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>DBMS</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>TOOL</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th>업무내용</th>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-rounded btn-outline-primary" data-toggle="modal" data-target="#agreementModal">이력서 다운로드</button>
                <button class="btn btn-warning btn-rounded ml-auto" data-toggle="modal" data-target="#interviewModal">요청</button>
            </div>
        </div>
    </div>
</div>

<!-- 인터뷰 요청 프로젝트 Modal -->
<div class="modal fade" id="interviewModal">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">인터뷰 요청 프로젝트</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="form-group">
                    <label class="w-100">
                        <input class="form-radio-input" type="radio" name="optionsRadios" checked="">
                        <span class="form-label">등록된 프로젝트</span>
                        <select class="form-control mt-2">
                            <option>프로젝트1</option>
                            <option>프로젝트2</option>
                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label class="w-100">
                        <input class="form-radio-input" type="radio" name="optionsRadios">
                        <span class="form-radio-sign">직접입력</span>
                        <input type="text" class="form-control mt-2" disabled>
                    </label>
                </div>

                <div class="mt-4 mb-2 text-center">
                    <a href="#" class="btn btn-black btn-rounded">확인</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 개인정보 동의 Modal -->
<div class="modal fade" id="agreementModal">
    <div class="modal-dialog2 modal-xl modal-dialog2-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <div class="card-title text-center">개인정보 보호를 위한 동의</div>
                <div class="p-3">
                    <p class="card-text mb-3">
                        - 본 정보는 (주)아이티키의 동의 없이 재배포하지 않으며, 오직 채용 목적으로만 사용되어야 합니다.
                    </p>
                    <p class="card-text mb-3">
                        - 본 정보를 저장, 출력한 경우 개인정보 보호에 대한 책임은 저장, 출력한 당사자에게 있습니다.
                    </p>
                    <p class="card-text">
                        - 정보통신부 고시 제2005-18호에 따라 개인정보가 담긴 이력서 등을 불법 유출 및 배포하게 되면 법에 따라 책임지게 됨을 양지하고, 채용이 종료됨과 동시에 저장 및 출력된 문서는 지체 없이(5일 이내) 반드시 파기하여야 합니다.
                    </p>
                </div>

                <div class="mt-3 mb-2 text-center">
                    <a href="#" class="btn btn-black btn-rounded mr-2">확인</a>
                    <a href="#" class="btn btn-gray btn-rounded" data-dismiss="modal">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>