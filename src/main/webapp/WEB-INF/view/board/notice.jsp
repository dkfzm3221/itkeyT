<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Header -->
<jsp:include page="../common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<style>
    .boardTable {
        border-collapse: collapse;
    }
    .boardTable th, .boardTable td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .boardTable tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .boardTable th {
        background-color: #1572E8;
        color: white;
    }
</style>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="../common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round">
                                </div>
                            </div>

                            <div class="col-6">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-header mb-4 pb-2" style="padding: 0;">
                                    <div class="card-title">
                                        <a href=""></a>
                                    </div>
                                </div>
                                <div>
                                    <table class="text-center boardTable">
                                        <colgroup>
                                            <col style="width:70px;">
                                            <col style="width:auto">
                                            <col span="4" style="width:120px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="width:10%; background-color:#1572E8!important">No.</th>
                                            <th style="width:10%; background-color:#1572E8!important">작성자</th>
                                            <th style="width:40%; background-color:#1572E8!important">제목</th>
                                            <th style="width:10%; background-color:#1572E8 !important">공개/비공개</th>
                                            <th style="width:10%; background-color:#1572E8!important">조회수</th>
                                            <th style="width:30%; background-color:#1572E8!important">등록일</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <a href=""></a>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--    <button onclick="moveToWriteBoard()" class="btn btn-black w-3" style="float: right;">글쓰기</button>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer  -->
<jsp:include page="../common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>