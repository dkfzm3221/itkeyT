<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:include page="common/loginHeader.jsp"/>
<html lang="ko-kr">
<body class="login">
	<div class="wrapper wrapper-login">
		<div class="container container-login animated fadeIn">
			<h3 class="text-center" style="margin-bottom: 10px;"><img src="/resources/images/itkey-logo.png" alt="아이티키" style="width:40%;" /></h3>
			<h3 class="text-center" style="font-size: 1.5rem; font-weight: 700; margin-bottom: 20px;">Customer ERP</h3>
			<h3 class="text-center" style="font-size: 1.9rem; margin-bottom: 15px;">Login</h3>
			<div class="login-form">
				<div class="form-group form-floating-label">
					<input id="username" name="username" type="text" class="form-control input-border-bottom" required>
					<label for="username" class="placeholder">아이디</label>
				</div>
				<div class="form-group form-floating-label">
					<input id="password" name="password" type="password" class="form-control input-border-bottom" required>
					<label for="password" class="placeholder">비밀번호</label>
					<div class="show-password">
						<i class="icon-eye"></i>
					</div>
				</div>

				<div class="false-box">
					<p class="p-false">암호가 일치하지 않습니다.</p>
				</div>

				<div class="row form-sub m-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="rememberme">
						<label class="custom-control-label" for="rememberme">아이디 저장</label>
					</div>
				</div>
				<div class="form-action mb-3">
					<a href="#" class="btn btn-primary btn-rounded btn-login">로그인</a>
				</div>
				<div class="form-action" style="padding: 0 10px;">
					<a href="#" id="show-signup" class="btn btn-rounded btn-signup">회원가입</a>
				</div>
			</div>
		</div>

		<div class="container container-signup animated fadeIn" style="padding: 40px 25px;">
			<h3 class="text-center" style="margin-bottom: 20px;">회원가입</h3>
			<div class="login-form">
				<div class="h-110">
					<div class="form-group">
						<label for="fullname" class="placeholder">아이디</label>
						<div class="form-action" style="padding: 0;">
							<input id="fullname" name="fullname" type="text" class="form-control" required>
							<button class="btn btn-right">중복확인</button>
						</div>
						<p class="p-success">사용 가능한 아이디입니다.</p>
					</div>
				</div>

				<div class="form-group">
					<label for="passwordsignin" class="placeholder">비밀번호</label>
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

				<div class="h-110">
					<div class="form-group" style="padding-bottom: 0;">
						<label for="brn" class="placeholder">사업자등록번호</label>
						<div class="form-action" style="padding: 0;">
							<input id="brn" name="brn" type="text" class="form-control" required>
							<button class="btn btn-right">조회</button>
						</div>
						<p class="p-false">등록된 사업자가 아닙니다. 관리자에게 문의해 주세요.</p>
					</div>
				</div>

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

					<div class="col-6 ">
						<label for="birth" class="placeholder">생년월일</label>
						<input id="birth" name="birth" type="date" class="form-control" required>
					</div>
				</div>

				<div class="row form-group">
					<div class="col-6 ">
						<label for="email" class="placeholder">이메일</label>
						<input  id="email" name="email" type="email" class="form-control" required>
					</div>

					<div class="col-6">
						<label for="tel" class="placeholder">연락처</label>
						<input id="tel" name="tel" type="text" class="form-control" required>
					</div>
				</div>

				<div class="form-group">
					<label for="address" class="placeholder">주소</label>
					<div class="form-action" style="padding: 0;">
						<input id="address" name="address" type="text" class="form-control" readonly>
						<button class="btn btn-right">조회</button>
					</div>
					<input name="address_detail" type="text" class="form-control" style="margin-top: 8px;" required>
				</div>

				<div class="row form-group">
					<div class="col-6 ">
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
					<input  id="accountNo" name="accountNo" type="text" class="form-control" required>
				</div>

				<div class="form-action">
					<button type="button" id="alert_demo_7" class="btn btn-primary btn-rounded btn-login mr-3">등록</button>
					<a href="#" id="show-signin" class="link btn btn-white btn-rounded btn-signup">취소</a>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="common/loginFooter.jsp"/>
</body>
</html>