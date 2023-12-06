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
<style>
    .nav-menu{
        margin-left: 83%;
    }
    .top>button{
        background-color: transparent;
        border:none;
        position : relative;
    }
    #setting{
        width: 8em;
        position: absolute;
        display: none;
        border-radius: 2px;
        background-color: whitesmoke;
        font-size: 1.3rem;
        z-index: 1;
        right : 42px;
        top : 50px;
    }
    #setting>ol li{
        font-size: 16px;
        list-style: none;
        margin-top : 10px;
    }
    #setting>ol li:hover{
        color: cornflowerblue;
        cursor: pointer;
    }
    .inputStyle1 {
        width: 270px;
        height: 28px;
        font-size: 15px;
        border: 0;
        border-radius: 10px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(250, 250, 250);
    }
    .read{
        background-color: #eeeeee;
    }
     #deleteMemberBtn{
         float: left ;
         font-size: 10px;
     }
</style>
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

        <!-- 1번 디자인 영역 -->
         <c:forEach items="${designList}" var="design" varStatus="index">
             <c:if test="${design.designSeq eq 1}">
                 ${design.content}
             </c:if>
         </c:forEach>

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

    <%--/**
    *
    *
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 사이드 네비게이션 메뉴리스트
    *
    **/--%>

    <%--<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="background-color:#111111" !important>--%>
    <!-- 2번 디자인 영역 -->
    <c:forEach items="${designList}" var="design" varStatus="index">
        <c:if test="${design.designSeq eq 2}">
            ${design.content}
        </c:if>
    </c:forEach>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/history">연혁</a>
                </li>

               <c:forEach items="${menuList}" var="menu">
                   <li class="nav-item active">
                       <a class="nav-link" href="/boardDetailList?menuBoardType=${menu.menuBoardType}">${menu.menuName}</a>
                   </li>
               </c:forEach>
            </ul>
        </div>

            <%-- /**
          *
          *
          *@author 유은비
          *@date 2023-11-23
          *@comment 로그인/마이페이지
          *
          **/--%>
            <!-- 로그인/마이페이지 버튼 영역-->
            <div class="collapse navbar-collapse">
            <c:choose>
                <c:when test="${empty member}">
                    <button class="btn btn-secondary nav-menu" onclick="loginButton()">Login</button>
                </c:when>
                <c:otherwise>
                    <button class="btn nav-menu" onclick="openSetting()"><i class="icon-user"></i></button>
                </c:otherwise>
            </c:choose>
            </div>

            <!-- 마이페이지 -->
            <div id="setting">
                <ol>
                    <li onclick="updateMemberInfo(${member.seq})" data-toggle="modal" data-target='#updateMember'>회원 정보 수정</li>
                    <li onclick="logoutButton()">로그아웃</li>
                </ol>
            </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="background-color:#e0e0e0!important; height: 30px;">
        <i class="bi bi-megaphone" style="font-size: 20px; vertical-align: middle; margin-right: 10px;"></i>
        <marquee direction="left" behavior="scroll" scrollamount="15">
            <span style="color: red; font-weight: bold;">${sessionScope.noticeOne.noticeTitle}</span>
        </marquee>
    </nav>
    <!-- End Navbar -->
</div>

<%--/**
*
*
*
*@author 김재섭
*@date 2023-11-23
*@comment 사이드 네비게이션 배너 리스트
*
**/--%>
<!-- Sidebar -->
<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="info">
                    <div class="row">
                        <c:forEach items="${bannerList}" var="item">
                            <div class="col-md-12">
                                <c:if test="${empty item.filePath}">
                                    <a href="${item.bannerUrl}" target="_blank">
                                        <p>${item.bannerName}</p>
                                    </a>
                                </c:if>
                                <c:if test="${not empty item.filePath}">
                                    <a href="${item.bannerUrl}" target="_blank">
                                        <img src="${item.filePath}" class="navbar-brand" style="width: 100%;">
                                    </a>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- End Sidebar -->

<%-- /**
  *
  *
  *@author 유은비
  *@date 2023-11-23
  *@comment 회원 정보 수정
  *
  **/--%>
<!-- 회원 수정 Modal -->
<div class="modal fade" id="updateMember">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회원 정보 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="project-info">
                    <div class="card-title"></div>
                    <form action="" method="post" id="updateMemberForm">
                        <input type="hidden" id="MemberIdx" name="seq" value="${member.seq}">
                        <table class="text-center">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" class="inputStyle1" value="${member.id}" name="id" readonly></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" class="inputStyle1 read" value="${member.name}" name="name"></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="password" class="inputStyle1 read" id="updateMemPw" name="password"></td>
                            </tr>
                            <tr>
                                <th>비밀번호확인</th>
                                <td><input type="password" id="checkPw" class="inputStyle1 read"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td><input type="text" class="inputStyle1 read" id="updateMemHp" value="" name="hp"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" class="inputStyle1" id="updateMemEmail" value="" name="email"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="form-action">
                    <a href="#" class="p-0 btn btn-link btn-black" id="deleteMemberBtn">탈퇴하기</a>
                </div>

                <div class="manpower mb-3">
                    <div class="text-right mt-3">
                        <button type="button" class="btn btn-primary" style="padding: 6px 30px" id="updateMemberBtn">수정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function loginButton (){
        window.location.href = "/mem/joinForm";
    }
    function logoutButton(){
        window.location.href = "/mem/logout";
    }
    //마이페이지 불러오기
    function openSetting(){
        if(document.getElementById('setting').style.display==='block'){
            document.getElementById('setting').style.display='none';
        }else{
            document.getElementById('setting').style.display='block';
        }
    }
    //유효성 처리
    $("#updateMemberBtn").on("click", function(){
        if ($('#checkPw').val() != $('#updateMemPw').val()) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요!");
            $('#checkPw').val("");
            $('#updateMemPw').val("");
            return false;
        }
    })
    //회원 정보 불러오기
    function updateMemberInfo(seq){
        let memberIdx = seq;
        $.ajax({
            url : "/mem/updateMemberInfo",
            data : {memberIdx : memberIdx},
            success : function(result){
                $("#updateMemId").val(result.id);
                $("#updateMemName").val(result.name);
                $("#updateMemHp").val(result.hp);
                $("#updateMemEmail").val(result.email);
                $('#updateMemPw').val("");
            }
        })
    }
    //회원정보수정
    $(document).on("click", "#updateMemberBtn", function() {
        let confirm_val = confirm("수정하시겠습니까?");
        if (confirm_val) {
            $("#updateMemberForm").attr("action", "/mem/updateMember").submit();
        }
    });
    //하이픈(-) 자동 입력, 클래스에 phoneNumber 추가
    $(document).on("keyup", "#updateMemHp", function() {
        $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));
    });

    //탈퇴하기
    $(document).on("click", "#deleteMemberBtn", function() {
        let seq = $("#MemberIdx").val();
        let confirm_val = confirm("정말로 탈퇴하시겠습니까?");
        if (confirm_val) {
            location.href = "/mem/deleteMember?" + "seq=" + seq;
        }
    });


</script>
</body>
</html>
