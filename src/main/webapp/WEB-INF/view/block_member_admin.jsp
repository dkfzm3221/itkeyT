<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<style>
    .boardTable{
        margin: auto;
    }
    .boardTable th, .boardTable td {
        padding: 13px;
    }
    .pagination li{
        margin-top : 10px;
        padding : 5px;
    }
</style>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">회원 관리</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body text-center" onclick="show_cnt_list('전체진행');">
                                        <div class="numbers">
                                            <h4 class="card-title">탈퇴 회원 수</h4>
                                            <div class="num icon-big" id="countAdmin" style="color: #1572E8; font-weight: 600;" data-start="0" data-end="0" data-postfix="" data-duration="1500" data-delay="1200"></div>
                                        </div>
                                    </div>
                                </div>
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
                                        <button class="btn btn-primary btn-rounded" id="adminHomeBtn">회원관리</button>
                                    </div>
                                    <div class="col-md-12 text-left" style="margin: 5px">
                                        <form name="member_list_main_search" action=""
                                              id="member_list_main_search" class="form-inline">
                                            <input type="hidden" name="depart_sub" value=""/>
                                            <select name="type" class="form-control"
                                                    style="margin:2px 0px;">
                                                <option value="all">--- 전체 ---</option>
                                                <option value="name">이름</option>
                                                <option value="id">아이디</option>
                                            </select>
                                            <input type="text" name="keyword"
                                                   class="form-control inputStyle1" id="searchBox"
                                                   placeholder="검색어 입력" style="margin:2px 0px;" />
                                            <button type="button" id="adminSearchBtn" class="btn btn-primary"><i
                                                    class="adminSearchBtn"></i>검색
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <div id="memberList">
                                    <table class="text-center boardTable">
                                        <tr>
                                            <th>No.</th>
                                            <th>신고자</th>
                                            <th>신고당한사람</th>
                                            <th>신고사유</th>
                                            <th>차단사유</th>
                                            <th>등록일</th>
                                            <th>설정</th>
                                        </tr>
                                        <c:forEach items="${List}" var="adminList">
                                            <c:if test="${adminList.seq != null}">
                                                <tr>
                                                    <td class='ano'>${adminList.rowNum}</td>
                                                    <td>${List.name}</td>
                                                    <td>${List.id}</td>
                                                    <td>${List.memberType}</td>
                                                    <td>${List.email}</td>
                                                    <td>${List.regDt}</td>
                                                    <td>
                                                        <c:if test="${admin.memberType == 'B'}">
                                                            <button class="btn-primary btn-rounded" onclick="updateReport(${adminList.seq})">설정</button>

                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </table>

                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <c:choose>
                                            <c:when test="${pageList.isFirstPage}">
                                                <li class="page-item">
                                                    <a class="page-link" disabled="true">Previous</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" id="previous" href="adminHome.ad?pageNum=${pageList.prePage}&type=${search.type}&keyword=${search.keyword}">Previous</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin= "${startPage}" end="${endPage}" var="idx">
                                            <c:choose>
                                                <c:when test="${pageList.pageNum == idx}">
                                                    <li class="page-item"><a class="page-link" disabled="true" style="font-weight: bold">${idx}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="adminHome.ad?pageNum=${idx}&type=${search.type}&keyword=${search.keyword}">${idx}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${pageList.isLastPage}">
                                                <li class="page-item">
                                                    <a class="page-link" disabled="true">Next</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="adminHome.ad?pageNum=${pageList.nextPage}&type=${search.type}&keyword=${search.keyword}">Next</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function updateReport(seq){
        let idx = seq
    }








</script>






<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>