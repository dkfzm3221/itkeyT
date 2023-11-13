<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                        <button class="btn btn-rounded">탈퇴회원관리</button>

                                    </div>
                                </div>

                                <div id="memberList">
                                    <table class="text-center boardTable">
                                        <tr>
                                            <th>No.</th>
                                            <th>아이디</th>
                                            <th>회원타입</th>
                                            <th>이메일</th>
                                            <th>등록일</th>
                                            <th>최종접속일시</th>
                                            <th>등록자명</th>
                                            <th>설정</th>
                                        </tr>

                                            <c:forEach items="${adminList}" var="adminList">
                                                <c:if test="${adminList.seq != null}">
                                            <tr>
                                                <td>${adminList.seq}</td>
                                                <td>${adminList.id}</td>
                                                <td>${adminList.memberType}</td>
                                                <td>${adminList.email}</td>
                                                <td>${adminList.regDt}</td>
                                                <td>${adminList.lastCntnDt}</td>
                                                <td>${adminList.regNm}</td>
                                                <td>
                                                    <button class="btn-primary">로그인</button>
                                                    <button class="btn-primary">수정</button>
                                                    <button class="">탈퇴</button>
                                                </td>
                                            </tr>
                                                </c:if>
                                            </c:forEach>
                                    </table>

                                </div>
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
                    <form action="/insertAdmin.ad" method="post" id="insertAdminForm">
                        <table class="text-center">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" id="adminId" name="id"></td>
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
                                <td><input type="text" id="AdminHp" name="hp"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" id="adminEmail" name="email"></td>
                            </tr>
                            <tr>
                                <th>회원타입</th>
                                <td><select id="AdminType" name="memberType"><option>A</option></select></td>
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
<script>
    function countAdmin() {
        $.ajax({
            url: "/countAdmin.ad",
            success: function (result) {
                console.log("회원수" + result)
                $('#countAdmin').append(result);
            }
        })
    }
    $(function(){
        countAdmin();
    })



    $(document).on("click", "#insertAdminBtn", function() {
            let confirm_val = confirm("등록하시겠습니까?");
            if (confirm_val) {
                $("#insertAdminForm").submit();
            }
    });

</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>