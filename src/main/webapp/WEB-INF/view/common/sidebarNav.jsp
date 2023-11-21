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
     <%--   <a href="/" class="logo">
            <img src="/resources/images/itkey-logo-white.png" alt="logo" class="navbar-brand" style="height: 28px;">
        </a>

        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
        </button>--%>
         <a class="navbar-brand" href="/">
             <img src="/resources/images/itkey-logo-white.png" alt="logo" class="navbar-brand" style="height: 28px;">
         </a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>

        <div class="more bell-mobile">
            <ul class="navbar-nav topbar-nav align-items-center">
                <li class="nav-item dropdown hidden-caret">

                </li>
            </ul>
        </div>

      <%--  <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar"><i class="icon-menu"></i></button>
        </div>--%>
    </div>
    <!-- End Logo Header -->

    <!-- Navbar Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <c:forEach items="${sessionScope.menuList}" var="menu">
                    <li class="nav-item active">
                        <a class="nav-link" href="/${menu.menuUrl}">${menu.menuName}</a>
                    </li>
                </c:forEach>

                <!-- Add more items here -->
            </ul>
        </div>
        <button class="btn btn-secondary" onclick="loginButton()">Login</button>
    </nav>
    <!-- End Navbar -->
</div>

<!-- Sidebar -->
<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="info">
                    <div class="row">
                        <div class="col-md-12">
                            <a data-toggle="collapse" href="#collapseExample1" aria-expanded="true">
                                <img src="/resources/images/test.png" alt="logo" class="navbar-brand" style="width: 100%;">
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a data-toggle="collapse" href="#collapseExample2" aria-expanded="true">
                                stest
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a data-toggle="collapse" href="#collapseExample3" aria-expanded="true">
                                setset
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div><!-- End Sidebar -->
<script>
    function loginButton (){
        window.location.href = "/totalAdmin/loginAdmin";
    }
</script>
</body>
</html>
