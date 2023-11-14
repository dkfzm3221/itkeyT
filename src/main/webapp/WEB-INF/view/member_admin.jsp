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
    input{
        width: 270px;
        height: 28px;
        font-size: 15px;
        border: 0;
        border-radius: 10px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(250, 250, 250);
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
                                            <h4 class="card-title">회원 수</h4>
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
                                        <button class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#insertAdmin">회원등록</button>
                                        <button class="btn btn-primary btn-rounded">회원그룹관리</button>
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
                                            <th>회원등록일</th>
                                            <th>등록자명</th>
                                            <th>최종수정일시</th>
                                            <th>수정자</th>
                                            <th>설정</th>
                                        </tr>

                                            <c:forEach items="${adminList}" var="adminList">
                                                <c:if test="${adminList.seq != null}">
                                            <tr>
                                                <td class='ano'>${adminList.seq}</td>
                                                <td>${adminList.name}</td>
                                                <td>${adminList.id}</td>
                                                <td>${adminList.memberType}</td>
                                                <td>${adminList.email}</td>
                                                <td>${adminList.regDt}</td>
                                                <td>${adminList.regNm}</td>
                                                <td>${adminList.updDt}</td>
                                                <td>${adminList.updNm}</td>
                                                <td>
                                                    <button class="btn-primary btn-rounded" onclick="admin_f_login(${adminList.seq})">로그인</button>
                                                    <button class="btn-primary btn-rounded" onclick="updateAdminInfo(${adminList.seq})" data-toggle="modal" data-target='#updateAdmin'>수정</button>
                                                    <button class="btn-rounded" onclick="deleteAdminInfo(${adminList.seq})">탈퇴</button>
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
                                                    <a class="page-link" id="previous" href="adminHome?pageNum=${pageList.prePage}&type=${search.type}&keyword=${search.keyword}">Previous</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin= "${startPage}" end="${endPage}" var="idx">
                                            <c:choose>
                                                <c:when test="${pageList.pageNum == idx}">
                                                    <li class="page-item"><a disabled="ture" style="font-weight: bold">${idx}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="adminHome?pageNum=${idx}&type=${search.type}&keyword=${search.keyword}">${idx}</a></li>
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
                                                    <a class="page-link" href="adminHome?pageNum=${pageList.nextPage}&type=${search.type}&keyword=${search.keyword}">Next</a>
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

<!-- 회원 등록 Modal -->
<div class="modal fade" id="insertAdmin">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">관리자 등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
                    <div class="card-title"></div>
                    <form action="" method="post" id="adminForm">
                        <table class="text-center">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" id="adminId" name="id"><span id="checkResult"></span></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" id="adminName" name="name"></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="password" id="adminPassWord" name="password"></td>
                            </tr>
                            <tr>
                                <th>비밀번호확인</th>
                                <td><input type="password" id="checkPassword"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td><input type="text" id="adminHp" name="hp"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" id="adminEmail" name="email"></td>
                            </tr>
                            <tr>
                                <th>회원타입</th>
                                <td><select id="adminType" name="memberType"><option>A</option><option>B</option></select></td>
                            </tr>
                        </table>
                    </form>
                </div>

                <div class="manpower mb-3">
                    <div class="text-right mt-3">
                        <button type="button" class="btn btn-primary" style="padding: 6px 30px" id="insertAdminBtn">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 회원 수정 Modal -->
<div class="modal fade" id="updateAdmin">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">관리자 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
                    <div class="card-title"></div>
                    <form action="" method="post" id="updateAdminForm">
                        <input type="hidden" id="adminIdx" name="seq">
                        <table class="text-center">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" id="updateAdminId" name="id" readonly></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" id="updateAdminName" name="name" readonly></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="password" id="updateAdminPassWord" name="password"></td>
                            </tr>
                            <tr>
                                <th>비밀번호확인</th>
                                <td><input type="password" id="updateCheckPassword"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td><input type="text" id="updateAdminHp" name="hp"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" id="updateAdminEmail" name="email"></td>
                            </tr>
                            <tr>
                                <th>회원타입</th>
                                <td>
                                    <select id="updateAdminType" name="memberType">
                                    <option>A</option>
                                    <option>B</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

                <div class="manpower mb-3">
                    <div class="text-right mt-3">
                        <button type="button" class="btn btn-primary" style="padding: 6px 30px" id="updateAdminBtn">수정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    //유효성 처리
    $("#insertAdminBtn").on("click", function(){

        var pattern = /^[가-힣]+$/;
        if($("#adminId").val()==""){
            alert("아이디를 입력해주세요.");
            $("#adminId").focus();
            return false;
        }
        if($("#adminName").val()==""){
            alert("이름을 입력해주세요.");
            $("#adminName").focus();
            return false;
        }
        if($("#adminPassWord").val()==""){
            alert("비밀번호를 입력해주세요.");
            $("#adminPassWord").focus();
            return false;
        }
        if ($('#checkPassword').val() != $('#adminPassWord').val()) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요!");
            $('#adminPassWord').val("");
            $('#checkPassword').val("");
            return false;
        }
        if($("#adminHp").val()==""){
            alert("전화번호를 입력해주세요.");
            $("#adminHp").focus();
            return false;
        }
        if($("#adminEmail").val()==""){
            alert("이메일을 입력해주세요.");
            $("#adminEmail").focus();
            return false;
        }
    })

    //회원수 카운트
    function countAdmin() {
        $.ajax({
            url: "/totalAdmin/countAdmin",
            success: function (result) {
                $('#countAdmin').append(result);
            }
        })
    }
    $(function(){
        countAdmin();
    })

    //회원 등록
    $(document).on("click", "#insertAdminBtn", function() {
            let confirm_val = confirm("등록하시겠습니까?");
            if (confirm_val) {
                $("#adminForm").attr("action", "/totalAdmin/insertAdmin").submit();
            }
    });
    //빠른 로그인
    function admin_f_login(Idx){
        let adminIdx = Idx;
        let confirm_val = confirm("이 계정으로 로그인 하시겠습니까?");

        if (confirm_val) {
        console.log("시작")
           $.ajax({
               url : "/totalAdmin/adminFastLogin",
               data : {adminIdx : adminIdx},
               dataType: "text",
               success : function(result){
                    if(result == 'S'){
                        alert('로그인 성공')
                        location.reload()
                    }else{
                        alert("로그인 실패")
                    }
               }
           })
        }
    }
    //회원정보 수정 폼 불러오기
    function updateAdminInfo(seq){
        let adminIdx = seq;
        $.ajax({
            url : "/totalAdmin/updateAdminForm",
            data : {adminIdx : adminIdx},
            success : function(result){
                $("#adminIdx").val(result.seq);
                $("#updateAdminId").val(result.id);
                $("#updateAdminName").val(result.name);
                $("#updateAdminHp").val(result.hp);
                $("#updateAdminType").val(result.memberType);
                $("#updateAdminEmail").val(result.email);
            }
        })
    }
    //회원정보수정
    $(document).on("click", "#updateAdminBtn", function() {
        let confirm_val = confirm("수정하시겠습니까?");
        if (confirm_val) {
            $("#updateAdminForm").attr("action", "/totalAdmin/updateAdmin").submit();
        }
    });

    //회원 탈퇴
    function deleteAdminInfo(seq){
        let adminIdx = seq;
        let confirm_val = confirm("탈퇴시키겠습니까?");
        if (confirm_val) {
            $.ajax({
                url : "/totalAdmin/deleteAdmin",
                data : {adminIdx : adminIdx},
                dataType: "text",
                success : function(result){
                    if(result == 'S'){
                        alert('탈퇴 완료')
                        location.reload()
                    }
                }
            })
        }
    }
    //탈퇴 회원 관리 페이지로
    $(document).on("click", "#del_adminHomeBtn", function() {
        location.href = "/totalAdmin/del_adminHome"
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
            $("#member_list_main_search").attr("action", "/totalAdmin/adminHome").submit();
    });

    //아이디 중복 체크
    $(function(){
        //아이디 중복 체크
        const $idInput = $("#adminForm input[name=id]");
        $idInput.keyup(function(){
            if($idInput.val().length >= 2){
                $.ajax({
                    url:"/totalAdmin/adminIdCheck",
                    data:{
                        id : $idInput.val()
                    },
                    dataType: "text",
                    success:function(result){
                        if(result == "NN"){ // 사용불가능
                            $("#checkResult").show();
                            $("#checkResult").css("color","red").text("X");
                            $("#insertAdminBtn").attr("disabled",true);
                        }else{ // 사용가능
                            $("#checkResult").show();
                            $("#checkResult").css("color","green").text("O");
                            $("#insertAdminBtn").attr("disabled",false);
                        }
                    }, error:function(){
                        console.log("아이디 중복체크용 ajax 통신 실패");
                    }
                })
            }else{
                $("#checkResult").hide();
            }
        })
    })





</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>