<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="main-content" xstyle="xwidth:1440px">
                <div class="row">
                </div>
                <div class="col-md-6">
                    <div class="card-title"><h2 style="font-size: 1.1rem;">디자인 관리</h2></div>
                    <div class="row">
                        <div class="col-6">
                            <div class="card card-stats card-round">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box" style="margin-top:10px;">
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead id="design_list_thead">
                                <tr style="background-color:#F1F1F1;">
                                    <th style="text-align:center;width:20px">No</th>
                                    <th style="text-align:center;">구분</th>
                                    <th style="text-align:center;">내용</th>
                                    <th style="text-align:center;"><i class="fa fa-gear">수정</i></th>
                                </tr>
                                </thead>
                                <tbody id="design_list_tbody">
                                <c:forEach items="${designList}" var="designList" varStatus="index">
                                    <tr>
                                        <td style="text-align:center;">${designList.designSeq}</td>
                                        <td>${designList.type}</td>
                                        <td>${designList.content}</td>
                                        <td style="text-align:center;padding:5px 0px;">
                                            <button class="btn btn-sm btn-info" onclick="updateDesign(${design.designSeq});"><i class="fa fa-list"></i> 수정</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
</script>

<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>