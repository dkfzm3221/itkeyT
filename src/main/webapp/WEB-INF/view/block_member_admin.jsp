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
                                            <h4 class="card-title">차단 회원 수</h4>
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
                                        <colgroup>
                                            <col style="width:70px;">
                                            <col style="width:auto">
                                            <col span="5" style="width:120px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>차단사유</th>
                                            <th>차단일</th>
                                            <th>수정자</th>
                                            <th>설정</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${adminList}" var="list">
                                            <c:if test="${list.seq != null}">
                                                <tr>
                                                    <td class='ano'>${list.rowNum}</td>
                                                    <td>${list.name}</td>
                                                    <td>${list.id}</td>
                                                    <td>${list.blockRsn}</td>
                                                    <td>${list.blockYmd}</td>
                                                    <td>${list.updId}</td>
                                                    <td>
                                                        <c:if test="${admin.memberType == 'A'}">
                                                            <button class="btn-primary btn-rounded" onclick="releaseMember(${list.seq})">풀기</button>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                        </tbody>
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
    //회원 관리 페이지로
    $(document).on("click", "#adminHomeBtn", function() {
        location.href = "/totalAdmin/adminHome"
    });

    //회원수 카운트
    function countAdmin() {
        $.ajax({
            url: "/totalAdmin/countBlockAdmin",
            success: function (result) {
                $('#countAdmin').append(result);
            }
        })
    }
    $(function(){
        countAdmin();
    })
    //차단 풀기
    function releaseMember(seq){
            let memberIdx = seq;
            let confirm_val = confirm("차단을 풀겠습니까?");
            if (confirm_val) {
                $.ajax({
                    url : "/totalAdmin/releaseMember",
                    data : {memberIdx : memberIdx},
                    dataType: "text",
                    success : function(result){
                        if(result == 'S'){
                            alert('차단 풀기 완료')
                            location.reload()
                        }else{
                            alert("풀기 실패")
                        }
                    }
                })
            }
    }
    //검색어 빈값 처리
    $("#adminSearchBtn").on("click", function (){
        if($("#searchBox").val() == ""){
            alert("검색어를 입력해주세요.");
            return false;
        }
    });

    //검색 기능
    $(document).on("click", "#adminSearchBtn", function() {
        $("#member_list_main_search").attr("action", "/totalAdmin/block_adminHome").submit();
    });







</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>