<%--
        Created by IntelliJ IDEA.
        User: AHN
        Date: 2023-02-23
        Time: 오후 5:17
        To change this template use File | Settings | File Templates.
        --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="main-header">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="blue">
        <a href="/totalAdmin/mainAdmin" class="logo">
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
                    <form id="logout" action="/totalAdmin/logout" method="post">
                        <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"onclick="logoutButton()" >
                            Logout
                        </a>
                    </form>
                    <%--<a class="nav-link dropdown-toggle" onclick="logoutButton()" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Logout
                    </a>--%>
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
               <%--
                <div class="avatar-sm float-left mr-2" style="margin-right: 0.75rem!important;">
                    <img src="https://via.placeholder.com/50" alt="..." class="avatar-img rounded-circle">
                </div>
                --%>
                <c:if test="${sessionScope.admin != null}">
                    <div class="info">
                        <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									안녕하세요.
									<div style="font-size: 18px; color: #1572E8;">
                                        ${sessionScope.admin.name}님
                                    </div>
								</span>
                        </a>
                        <div class="clearfix"></div>
                    </div>
                </c:if>
            </div>

            <ul class="nav nav-primary">
                <c:forEach var="gnb" items="${sessionScope.gnbList}" varStatus="status">
                    <li class="nav-item">
                        <a href='/${gnb.menuConnWay}/${gnb.menuUrl}'>
                            <c:choose>
                                <c:when test="${gnb.menuName == '회원관리'}">
                                    <i class="fas fa-user-cog"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '메뉴관리'}">
                                    <i class="fas fa-server"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '게시판관리'}">
                                    <i class="fas fa-laptop"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '배너관리'}">
                                    <i class="fas fa-adjust"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '팝업관리'}">
                                    <i class="fas fa-address-book"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '접속로그'}">
                                    <i class="fas fa-address-card"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '디자인관리'}">
                                    <i class="fas fa-desktop"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '공지사항관리'}">
                                    <i class="fas fa-bullhorn"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '연혁관리'}">
                                    <i class="fas fa-database"></i>
                                </c:when>
                                <c:when test="${gnb.menuName == '신고관리'}">
                                    <i class="fas fa-database"></i>
                                </c:when>
                            </c:choose>
                            <p>${gnb.menuName}</p>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<!-- End Sidebar -->
<script>
    function logoutButton (){
      document.getElementById('logout').submit();
    }
</script>
</body>
</html>