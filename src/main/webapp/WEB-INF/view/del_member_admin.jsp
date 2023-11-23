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
                                        <button class="btn btn-primary btn-rounded" id="block_adminHomeBtn">차단회원관리</button>
                                        <button class="btn btn-rounded" id="del_adminHomeBtn">탈퇴회원관리</button>
                                    </div>
                                </div>
                                <div class="col-md-12 text-left" style="margin: 5px">
                                    <form name="member_list_main_search" action=""
                                          id="member_list_main_search" class="form-inline">
                                        <input type="hidden" name="depart_sub" value=""/>
                                        <select name="type" class="form-control"
                                                style="margin:2px 0px;">
                                            <option value="all">--- 전체 ---</option>
                                            <option value="name">관리자명</option>
                                            <option value="id">아이디</option>
                                        </select>
                                        <input type="text" name="keyword"
                                               class="form-control" id="searchBox"
                                               placeholder="검색어 입력" style="margin:2px 0px;" />
                                        <button type="button" id="adminSearchBtn" class="btn btn-primary"><i
                                                class="adminSearchBtn"></i>검색
                                        </button>
                                    </form>
                                </div>

                                <div id="memberList">
                                    <table class="text-center boardTable">
                                        <tr>
                                            <th>No.</th>
                                            <th>관리자명</th>
                                            <th>아이디</th>
                                            <th>회원타입</th>
                                            <th>이메일</th>
                                            <th>등록일</th>
                                            <th>탈퇴일자</th>
                                            <th>등록자명</th>
                                            <th>설정</th>
                                        </tr>
                                        <c:forEach items="${adminList}" var="adminList">
                                            <c:if test="${adminList.seq != null}">
                                                <tr>
                                                    <td class='ano'>${adminList.rowNum}</td>
                                                    <td>${adminList.name}</td>
                                                    <td>${adminList.id}</td>
                                                    <c:if test="${adminList.memberType == 'U'}">
                                                        <td>사용자</td>
                                                    </c:if>
                                                    <c:if test="${adminList.memberType == 'A' }">
                                                        <td>관리자</td>
                                                    </c:if>
                                                    <td>${adminList.email}</td>
                                                    <td>${adminList.regDt}</td>
                                                    <td>${adminList.whdwlYmd}</td>
                                                    <td>${adminList.regNm}</td>
                                                    <td>
                                                        <c:if test="${admin.memberType == 'A'}">
                                                            <button class="btn-primary btn-rounded" onclick="updateY(${adminList.seq})">복귀</button>
                                                            <button class="btn-rounded" onclick="realDeleteAdmin(${adminList.seq})">탈퇴</button>
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
                                                    <a class="page-link" id="previous" href="del_adminHome?pageNum=${pageList.prePage}&type=${search.type}&keyword=${search.keyword}">Previous</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin= "${startPage}" end="${endPage}" var="idx">
                                            <c:choose>
                                                <c:when test="${pageList.pageNum == idx}">
                                                    <li class="page-item"><a class="page-link" disabled="true" style="font-weight: bold">${idx}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="del_adminHome?pageNum=${idx}&type=${search.type}&keyword=${search.keyword}">${idx}</a></li>
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
                                                    <a class="page-link" href="del_adminHome?pageNum=${pageList.nextPage}&type=${search.type}&keyword=${search.keyword}">Next</a>
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
    //회원수 카운트
    function countAdmin() {
        $.ajax({
            url: "/totalAdmin/countDelAdmin",
            success: function (result) {
                $('#countAdmin').append(result);
            }
        })
    }
    $(function(){
        countAdmin();
    })
    //회원 관리 페이지로
    $(document).on("click", "#adminHomeBtn", function() {
        location.href = "/totalAdmin/adminHome"
    });
    //검색어 빈값 처리
    $("#adminSearchBtn").on("click", function (){
        if($("#searchBox").val() == ""){
            alert("검색어를 입력해주세요.");
            return false;
        }
    });
    //검색 기능
    $(document).on("click", "#adminSearchBtn", function() {
        $("#member_list_main_search").attr("action", "/totalAdmin/del_adminHome").submit();
    });
    //복귀
    function updateY(seq){
        let adminIdx = seq;
        let confirm_val = confirm("복귀시키겠습니까?");
        if (confirm_val) {
            $.ajax({
                url : "/totalAdmin/returnAdmin",
                data : {adminIdx : adminIdx},
                dataType: "text",
                success : function(result){

                    if(result == 'S'){
                        alert('복귀 완료')
                        location.reload()
                    }else{
                        alert("복귀 실패")
                    }
                }
            })
        }
    }
    //영구탈퇴
    function realDeleteAdmin(seq){
        let adminIdx = seq;
        let confirm_val = confirm("영구탈퇴 시키겠습니까?");
        if (confirm_val) {
            $.ajax({
                url : "/totalAdmin/realDeleteAdmin",
                data : {adminIdx : adminIdx},
                dataType: "text",
                success : function(result){

                    if(result == 'S'){
                        alert('영구탈퇴 완료')
                        location.reload()
                    }else{
                        alert("실패")
                    }
                }
            })
        }
    }
    //차단 회원 관리 페이지 이동
    $(document).on("click", "#block_adminHomeBtn", function() {
        location.href = "/totalAdmin/block_adminHome"
    });
    //탈퇴 회원 관리 페이지로
    $(document).on("click", "#del_adminHomeBtn", function() {
        location.href = "/totalAdmin/del_adminHome"
    });
</script>






<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>