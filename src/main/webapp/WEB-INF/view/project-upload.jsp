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
                <div class="page-header"><h4 class="page-title">프로젝트 등록</h4></div>
                <div class="card">
                    <div class="card-body">
                        <div class="w-620 mr-auto ml-auto">
                            <div class="login-form">
                                <div class="card-title" style="font-weight: 600; margin-top: 10px;">프로젝트 정보</div>

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
                                <div class="card-title" style="font-weight: 600; padding: 10px 0; margin-top: 15px;">인력 요구사항</div>

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

                        <div class="mt-4 mb-2 text-center">
                            <a href="#" class="btn btn-black btn-rounded" data-toggle="modal" data-target="#talentModal">등록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 인력 추천 Modal -->
    <div class="modal fade" id="talentModal">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">AI 추천</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" style="padding: 0.5rem 1rem; border-bottom: 1px solid rgb(233, 236, 239);">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Allselect">
                        <label class="custom-control-label" for="Allselect">전체선택</label>
                    </div>
                </div>
                <div class="modal-body" style="padding: 1rem; height: 60vh; overflow-y: auto;">
                    <div class="manpower-info">
                        <table>
                            <tr>
                                <th>이름</th>
                                <td>홍길동 (남)</td>
                            </tr>

                            <tr>
                                <th>학력</th>
                                <td>고등학교 졸업</td>
                            </tr>

                            <tr>
                                <th>기사</th>
                                <td>보유</td>
                            </tr>

                            <tr>
                                <th>등급</th>
                                <td>초급</td>
                            </tr>

                            <tr>
                                <th>연차</th>
                                <td>1년차</td>
                            </tr>

                            <tr>
                                <th>인터뷰 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>투입 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>스킬</th>
                                <td>Win, Linux, Oracle, MySQL, MSSQL, JAVA, JSP, JS, Spring, E-Gov</td>
                            </tr>
                        </table>

                        <label class="w-100 mt-1 selectgroup-item">
                            <input type="checkbox" class="selectgroup-input" checked="">
                            <span class="selectgroup-button" style="border-radius: 3px;">요청</span>
                        </label>
                    </div>

                    <div class="manpower-info">
                        <table>
                            <tr>
                                <th>이름</th>
                                <td>홍길동 (남)</td>
                            </tr>

                            <tr>
                                <th>학력</th>
                                <td>고등학교 졸업</td>
                            </tr>

                            <tr>
                                <th>기사</th>
                                <td>보유</td>
                            </tr>

                            <tr>
                                <th>등급</th>
                                <td>초급</td>
                            </tr>

                            <tr>
                                <th>연차</th>
                                <td>1년차</td>
                            </tr>

                            <tr>
                                <th>인터뷰 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>투입 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>스킬</th>
                                <td>JAVA, JSP, JS, Spring</td>
                            </tr>
                        </table>

                        <label class="w-100 mt-1 selectgroup-item">
                            <input type="checkbox" class="selectgroup-input">
                            <span class="selectgroup-button" style="border-radius: 3px;">요청</span>
                        </label>
                    </div>

                    <div class="manpower-info">
                        <table>
                            <tr>
                                <th>이름</th>
                                <td>홍길동 (남)</td>
                            </tr>

                            <tr>
                                <th>학력</th>
                                <td>고등학교 졸업</td>
                            </tr>

                            <tr>
                                <th>기사</th>
                                <td>보유</td>
                            </tr>

                            <tr>
                                <th>등급</th>
                                <td>초급</td>
                            </tr>

                            <tr>
                                <th>연차</th>
                                <td>1년차</td>
                            </tr>

                            <tr>
                                <th>인터뷰 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>투입 가능</th>
                                <td>22-08-05</td>
                            </tr>

                            <tr>
                                <th>스킬</th>
                                <td>Win, Linux, Oracle, MySQL, MSSQL, JAVA, JSP, JS, Spring, E-Gov</td>
                            </tr>
                        </table>

                        <label class="w-100 mt-1 selectgroup-item">
                            <input type="checkbox" class="selectgroup-input">
                            <span class="selectgroup-button" style="border-radius: 3px;">요청</span>
                        </label>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-black btn-rounded ml-auto mr-auto">선택 요청하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->
</div>
</body>
</html>