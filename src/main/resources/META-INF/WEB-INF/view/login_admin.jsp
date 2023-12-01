<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="common/contentHeader.jsp"/>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Admin Login</h3></div>
                            <div class="card-body">
                                <form>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" type="email" placeholder="ID" />
                                        <label for="inputEmail"></label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" type="password" placeholder="Password" />
                                        <label for="inputPassword"></label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between" style="text-align: center">
                                        <a class="btn btn-primary" href="javascript:void(0)" onclick="goLogin()">Login</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script>
    $(document).ready(function() {
        $(document).on("keydown", "#inputEmail, #inputPassword", function (event) {
            if (event.keyCode == 13) {
                goLogin();
            }
        });
    });

    function goLogin(){
        var adminId = $("#inputEmail").val();
        var adminPw = $("#inputPassword").val();

        if(adminId == ""){
            alert("아이디를 입력하세요.");
            $("#adminId").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(adminPw == ""){
            alert("비밀번호 입력하세요.");
            $("#adminPw").focus();
            return;
        }

        $.ajax({
            type : 'post',
            url : '/totalAdmin/login',
            data : {
                'id' : adminId,
                'password' : adminPw
            },
            success : function(data) {
                if (data == "W") {
                    window.location.href="/totalAdmin/mainAdmin";
                } else {
                    alert('아이디와 비밀번호를 확인 후 로그인해주세요.');
                    return false;
                }
            }
        });
    }
</script>
</body>
</html>