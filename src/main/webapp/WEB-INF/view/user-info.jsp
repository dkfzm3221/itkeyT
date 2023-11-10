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
                <div class="page-header"><h4 class="page-title">정보수정</h4></div>
                <div class="card">
                    <div class="card-body" style="padding-top: 30px;">
                        <div class="w-620 ml-auto mr-auto">
                            <div class="login-form w-50">
                                <div class="form-group">
                                    <label for="brn" class="placeholder">사업자등록번호</label>
                                    <input id="brn" name="brn" type="text" class="form-control" placeholder="123-45-67890" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="fullname" class="placeholder">아이디</label>
                                    <input id="fullname" name="fullname" type="text" class="form-control" placeholder="hong1234" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="passwordsignin" class="placeholder">비밀번호<span class="ml-3" style="color:#18A6D2;">*비밀번호 변경 시 입력해 주세요.</span></label>
                                    <input id="passwordsignin" name="passwordsignin" type="password" class="form-control" required>
                                </div>

                                <div class="h-110">
                                    <div class="form-group">
                                        <label for="confirmpassword" class="placeholder">비밀번호 확인</label>
                                        <input id="confirmpassword" name="confirmpassword" type="password" class="form-control" required>
                                        <p class="p-false">암호가 일치하지 않습니다.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="login-form">
                                <div class="card-title" style="border-top: 1px solid #ebecec; padding: 15px 0 5px 0; margin-top: 20px; font-weight: 600;">추가 정보</div>

                                <div class="row form-group">
                                    <div class="col-6 ">
                                        <label class="placeholder">상호명</label>
                                        <input name="firstname" type="text" class="form-control" required>
                                    </div>

                                    <div class="col-6">
                                        <label for="ceo" class="placeholder">대표자</label>
                                        <input id="ceo" name="ceo" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-6 ">
                                        <label class="placeholder">업태</label>
                                        <input name="firstname" type="text" class="form-control" required>
                                    </div>

                                    <div class="col-6">
                                        <label class="placeholder">종목</label>
                                        <input type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-6">
                                        <label for="manager" class="placeholder">담당자</label>
                                        <input id="manager" name="manager" type="text" class="form-control" required>
                                    </div>

                                    <div class="col-6">
                                        <label for="birth" class="placeholder">생년월일</label>
                                        <input id="birth" name="birth" type="date" class="form-control" required>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-6 ">
                                        <label for="email" class="placeholder">이메일</label>
                                        <input id="email" name="email" type="email" class="form-control" required>
                                    </div>

                                    <div class="col-6">
                                        <label for="tel" class="placeholder">연락처</label>
                                        <input id="tel" name="tel" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="address" class="placeholder">주소</label>
                                    <div class="input-group" style="padding: 0;">
                                        <input id="address" name="address" type="text" class="form-control" readonly>
                                        <button class="btn btn-right">조회</button>
                                    </div>
                                    <input name="address_detail" type="text" class="form-control" style="margin-top: 8px;" required>
                                </div>

                                <div class="row form-group">
                                    <div class="col-6">
                                        <label for="bank" class="placeholder">은행</label>
                                        <input id="bank" name="bank" type="text" class="form-control" required>
                                    </div>

                                    <div class="col-6">
                                        <label for="accountholder" class="placeholder">계좌주</label>
                                        <input id="accountholder" name="accountholder" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="accountNo" class="placeholder">계좌번호</label>
                                    <input id="accountNo" name="accountNo" type="text" class="form-control" required>
                                </div>
                            </div>
                            <div class="mt-4 mb-3 text-center">
                                <a href="#" class="btn btn-black btn-rounded mr-3">수정</a>
                                <a href="#" class="btn btn-rounded btn-gray">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>