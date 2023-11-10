<%--
  Created by IntelliJ IDEA.
  User: AHN
  Date: 2023-02-23
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="main-header">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="blue">
        <a href="index.jsp" class="logo">
            <img src="/resources/images/itkey-logo-white.png" alt="logo" class="navbar-brand" style="height: 28px;">
        </a>
        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
        </button>

        <div class="more bell-mobile">
            <ul class="navbar-nav topbar-nav align-items-center">
                <li class="nav-item dropdown hidden-caret">
                    <a class="nav-link dropdown-toggle" href="#">
                        <i class="fa fa-bell"></i>
                    </a>
                </li>
            </ul>
        </div>

        <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar"><i class="icon-menu"></i></button>
        </div>
    </div>
    <!-- End Logo Header -->

    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">

        <div class="container-fluid">
            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                <li class="nav-item dropdown hidden-caret">
                    <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <span class="notification">2</span>
                    </a>
                    <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                        <li>
                            <div class="dropdown-title">2개의 새 알림이 있습니다.</div>
                        </li>
                        <li>
                            <div class="notif-center">
                                <a href="#">
                                    <div class="notif-icon notif-primary"><i class="fa fa-user-plus"></i></div>
                                    <div class="notif-content">
												<span class="block">
													New user registered
												</span>
                                        <span class="time">5분 전</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="notif-icon notif-success"><i class="fa fa-comment"></i></div>
                                    <div class="notif-content">
												<span class="block">
													Rahmad commented on Admin
												</span>
                                        <span class="time">12분 전</span>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <a class="see-all" href="javascript:void(0);">전체보기<i class="fa fa-angle-right"></i> </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- End Navbar -->
</div>

<!-- Sidebar -->
<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2" style="margin-right: 0.75rem!important;">
                    <img src="https://via.placeholder.com/50" alt="..." class="avatar-img rounded-circle">
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									안녕하세요.
									<div style="font-size: 18px; color: #1572E8;">홍길동 님</div>
									<span class="caret"></span>
								</span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample">
                        <ul class="nav">
                            <li>
                                <a href="user-info.html">
                                    <span class="link-collapse text-right">정보수정</span>
                                </a>
                            </li>
                            <li>
                                <a href="login.jsp">
                                    <span class="link-collapse text-right">로그아웃</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <ul class="nav nav-primary">
                <li class="nav-item active">
                    <a href="index.jsp">
                        <i class="fas fa-home"></i>
                        <p>대시보드</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="proxy-upload.jsp">
                        <i class="far fa-edit"></i>
                        <p>등록요청</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#manpower-list">
                        <i class="fas fa-user-cog"></i>
                        <p>인력관리</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="manpower-list">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="manpower.jsp">
                                    <span class="sub-item">가용인력</span>
                                </a>
                            </li>
                            <li>
                                <a href="manpower-search.jsp">
                                    <span class="sub-item">인력검색</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#project">
                        <i class="fas fa-server"></i>
                        <p>프로젝트 관리</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="project">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="project-upload.jsp">
                                    <span class="sub-item">프로젝트 등록</span>
                                </a>
                            </li>
                            <li>
                                <a href="project-list.jsp">
                                    <span class="sub-item">프로젝트 목록</span>
                                </a>
                            </li>
                            <li>
                                <a href="project-search.jsp">
                                    <span class="sub-item">프로젝트 검색</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="collapse" href="#mypage">
                        <i class="fas fa-user-alt"></i>
                        <p>마이페이지</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="mypage">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="project-approve.jsp">
                                    <span class="sub-item">승인관리</span>
                                </a>
                            </li>
                            <li>
                                <a href="project-request.jsp">
                                    <span class="sub-item">요청관리</span>
                                </a>
                            </li>
                            <li>
                                <a href="project-support.jsp">
                                    <span class="sub-item">지원관리</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="contract-management.jsp">
                        <i class="fas fa-laptop"></i>
                        <p>계약관리</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- End Sidebar -->
</body>
</html>
