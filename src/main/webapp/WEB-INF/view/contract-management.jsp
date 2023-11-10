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
					<div class="page-header"><h4 class="page-title">계약관리</h4></div>
					<div class="card">								
						<div class="card-body">
							<div class="col-md-12" style="margin-bottom: 20px; padding: 0;">
								<form name="member_list_main_search" id="member_list_main_search" class="form-inline">
									<select name="search_type" class="form-control">
										<option value="">--- 전체 ---</option>
										<option value="name">이름</option>
									</select>
									<div class="m-search">
										<input type="text" name="search_word" class="form-control" placeholder="검색어 입력">
										<button type="button" class="btn btn-primary">검색</button>
									</div>
								</form>
							</div>

							<div class="row mt-3">
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>서명 대기</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#signatureModal">서명하기</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>진행중</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-6 btn btn-rounded btn-outline-primary">계약서 다운로드</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>서명 대기</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#signatureModal">서명하기</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>	
											
											<tr>
												<th>상태</th>
												<td>계약서 작성중</td>
											</tr>	
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#signatureModal" disabled>서명하기</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>서명 대기</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#signatureModal">서명하기</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>	
											
											<tr>
												<th>상태</th>
												<td>계약서 작성중</td>
											</tr>	
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-5 btn btn-rounded btn-outline-warning" data-toggle="modal" data-target="#signatureModal" disabled>서명하기</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>진행중</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-6 btn btn-rounded btn-outline-primary">계약서 다운로드</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>진행중</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-6 btn btn-rounded btn-outline-primary">계약서 다운로드</button>
										</div>
									</div>
								</div>
								
								<div class="col-md-4 col-lg-4 mb-5">
									<div class="main-info">
										<table data-toggle="modal" data-target="#contractModal" style="cursor: pointer;">
											<tr>
												<th>프로젝트명</th>
												<td>oo은행 유지보수</td>
											</tr>

											<tr>
												<th>시작일</th>
												<td>22-08-05</td>
											</tr>

											<tr>
												<th>종료예정일</th>
												<td>22-08-05</td>
											</tr>
											
											<tr>
												<th>상태</th>
												<td>진행중</td>
											</tr>
										</table>
										
										<div class="mt-3 text-center">
											<button class="col-6 btn btn-rounded btn-outline-primary">계약서 다운로드</button>
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
	
	<!-- 계약상세 Modal -->
	<div class="modal fade" id="contractModal">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">

			<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">계약상세</h4>
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
						</table>
					</div>
					
					<div class="manpower mb-3">
						<table class="scrolltable scrolltable3">
							<thead>
								<tr>
									<th>이름</th>
									<th>투입일</th>
									<th>철수예정일</th>
									<th>단가</th>
									<th>총매출</th>
								</tr>
							</thead>
							<tbody>
								<tr data-toggle="modal" data-target="#sm-info-Modal">
									<td>홍길동</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
								<tr>
									<td>임꺽정</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
								<tr>
									<td>고길동</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
								<tr>
									<td>미나리</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
								<tr>
									<td>고구마</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
								<tr>
									<td>호랑이</td>
									<td>2022-07-31</td>
									<td>2022-08-01</td>
									<td>1,000,000</td>
									<td>1,000,000</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 인력상세 Modal -->
	<div class="modal fade" id="sm-info-Modal">
		<div class="modal-xl modal-dialog2 modal-dialog2-centered">
			<div class="modal-content">
			<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><strong>홍길동</strong> 님의 정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="img-profile"></div>
					
					<div class="project-info">
						<table class="text-center">
							<tr>
								<th>연차</th>
								<td>2년 3개월</td>
							</tr>
							
							<tr>
								<th>지역</th>
								<td>인천</td>
							</tr>
							
							<tr>
								<th>성별</th>
								<td>남</td>
							</tr>
							
							<tr>
								<th>소속</th>
								<td>정규직</td>
							</tr>
							
							<tr>
								<th>생년월일</th>
								<td>1990-01-01</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 서명하기 Modal -->
	<div class="modal fade" id="signatureModal">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
			<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">서명하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
						<div class="col-4 mb-3">
							<div class="bg-light" style="height: 60px;"></div>
						</div>
					</div>
						
					<div class="mt-2 mb-2 text-center">
						<a href="#" class="btn btn-black btn-rounded" data-toggle="modal" data-target="#signaturecanbasModal">서명</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 가상패드 Modal -->
	<div class="modal fade" id="signaturecanbasModal">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
			<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="canvas-box w-100 bg-grey2" style="height: 150px;"></div>
						
					<div class="mt-4 mb-2 text-center">
						<button class="btn btn-rounded mr-3">첨부하기</button>
						<button class="btn btn-black btn-rounded">서명</button>
					</div>
				</div>
			</div>
		</div>
	</div>	
	

</body>
</html>