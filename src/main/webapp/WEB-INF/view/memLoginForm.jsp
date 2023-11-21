<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/view/common/contentHeader.jsp"/>
<html lang="ko-kr">
<style type="text/css">
    .tile-stats p {
        font-size: 12px;
    }

    .loading-bar-container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 9999; /* Ensure the loading bar is displayed on top */
    }

    .loading {
        display: inline-block;
        width: 50px;
        height: 50px;
        border: 5px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        border-top-color: #fff;
        animation: spin 1s ease-in-out infinite;
        -webkit-animation: spin 1s ease-in-out infinite;
    }

    @keyframes spin {
        to {
            -webkit-transform: rotate(360deg);
        }
    }

    @-webkit-keyframes spin {
        to {
            -webkit-transform: rotate(360deg);
        }
    }

    .progress-text {
        color: #fff;
        font-size: 14px;
        text-align: center;
        margin-top: 10px;
    }

    body.scroll-lock {
        overflow: hidden;
    }
    #adminLoginForm{
        float: right ;
        font-size: 10px;
    }
</style>
<c:if test="${ not empty errorMsg }">
    <script>
        alert("${errorMsg}");
    </script>
    <c:remove var="errorMsg" scope="session"/>
</c:if>
<body class="login">
<div class="wrapper wrapper-login">
    <div class="container container-login animated fadeIn">
        <div class="login-form">
            <form id="loginForm" method="post" action="">
                <div class="form-group form-floating-label">
                    <input id="cacId" name="id" type="text" class="form-control input-border-bottom">
                    <label for="cacId" class="placeholder">아이디</label>
                </div>
                <div class="form-group form-floating-label">
                    <input id="cacPw" name="password" type="password" class="form-control input-border-bottom">
                    <label for="cacPw" class="placeholder">비밀번호</label>
                </div>

                <div class="false-box">
                    <p class="p-false" id="p-false-login"></p>
                </div>

                <div class="form-action mb-3">
                    <button type="button" class="btn btn-primary btn-rounded btn-login" id="loginClick">로그인</button>
                </div>
                <div class="form-action" style="padding: 0 10px;">
                    <a href="#" id="show-signup" style="color: #430091 !important;" class="btn btn-rounded btn-signup">회원가입</a>
                </div>
                <div class="form-action">
                    <a href="#" class="p-0 btn btn-link btn-black" id="goTofindId">아이디 찾기</a>
                    <a href="#" class="p-0 btn btn-link btn-black ml-5" id="goTofindPw">비밀번호 찾기</a>
                </div>
                <div class="form-action">
                    <a href="#" class="p-0 btn btn-link btn-black" id="adminLoginForm">관리자 로그인</a>
                </div>
            </form>
        </div>
    </div>

    <!-- 아이디 찾기 입력 box -->
    <div class="container container-findid animated fadeIn show2" id="containerFindId" style="display: none">
        <h3 class="text-center mb-3" style="font-size: 1.5rem; font-weight: 700;">아이디 찾기</h3>
        <p class="text-center mb-4">가입 시 등록한 정보를 입력해주세요.</p>
        <div class="login-form">
            <div class="form-group form-floating-label">
                <input id="findMemNm" name="name" type="text" class="form-control input-border-bottom" required>
                <label for="findMemNm" class="placeholder">이름</label>
            </div>

            <div class="form-group form-floating-label">
                <input id="findMemPh" name="ph" type="text" class="form-control input-border-bottom" required>
                <label for="findMemPh" class="placeholder">전화번호</label>
            </div>

            <div class="false-box">
                <p class="p-false"></p>
            </div>

            <div class="form-action">
                <a href="#" id="findId" onclick="findId()" class="btn btn-primary btn-rounded btn-login">아이디 찾기</a>
            </div>

            <div class="form-action">
                <a href="#" class="p-0 btn btn-link btn-black show-back">로그인 페이지로 돌아가기</a>
            </div>
        </div>
    </div>

    <!-- 아이디 찾기 결과 box -->
    <div class="container container-findidtrue animated fadeIn" style="display: none">
        <h3 class="text-center mb-3" style="font-size: 1.5rem; font-weight: 700;">아이디 찾기 결과</h3>
        <p class="text-center mb-5">정보 보호를 위해 아이디의 일부만 보여집니다.<br>전체 아이디는 관리자에게 문의해주세요.</p>
        <div class="login-form">
            <div class="text-center" style="font-size:17px;">회원님의 아이디는<br><span class="foundId" style="color:#5600B8;"></span>입니다.</div>

            <div class="form-action mt-4">
                <a href="#" id="goToLogin" class="btn btn-primary btn-rounded btn-login">로그인</a>
            </div>

        </div>
    </div>

    <!-- 비밀번호 찾기 입력 box -->
    <div class="container container-findpw animated fadeIn" style="display: none">
        <h3 class="text-center mb-3" style="font-size: 1.5rem; font-weight: 700;">비밀번호 찾기</h3>
        <p class="text-center mb-4">아이디와 이메일을 입력해주세요.<br>임시 비밀번호는 이메일로 전송됩니다.</p>
        <div class="login-form">
            <div class="form-group form-floating-label">
                <input id="tempId" name="id" type="text" class="form-control input-border-bottom" required>
                <label for="tempId" class="placeholder">아이디</label>
            </div>

            <div class="form-group form-floating-label">
                <input id="tempEmail" name="email" type="text" class="form-control input-border-bottom" required>
                <label for="tempEmail" class="placeholder">이메일</label>
            </div>

            <div class="false-box">
                <p class="p-false"></p>
            </div>

            <div class="form-action">
                <a href="#" onclick="sendTemporaryPw();" class="btn btn-primary btn-rounded btn-login">임시 비밀번호 전송</a>
            </div>

            <div class="form-action">
                <a href="#" class="p-0 btn btn-link btn-black show-back">로그인 페이지로 돌아가기</a>
            </div>
        </div>
    </div>
    <!--회원 가입-->
    <div class="container container-signup animated fadeIn" style="padding: 40px 25px;">
        <h3 class="text-center" style="margin-bottom: 20px;">회원가입</h3>
        <form id="memberJoinForm" method="post" action="">
            <div class="login-form">
                <div class="h-110">
                    <div class="form-group">
                        <label for="joinCacPwChk" class="placeholder"><b style="color: #ff191e">*</b>이름</label>
                        <input id="joinName" name="name" type="text" class="form-control">
                    </div>
                </div>
                <div class="h-110">
                    <div class="form-group">
                        <label for="joinCacId" class="placeholder"><b style="color: #ff191e">*</b>아이디</label>
                        <div class="form-action" style="padding: 0;">
                            <input id="joinCacId" name="id" type="text" class="form-control">
                        </div>
                        <p class="p-false" id="p-false-id"></p>
                        <p class="p-success" id="p-success-id"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="joinCacPw" class="placeholder"><b style="color: #ff191e">*</b>비밀번호</label>
                    <input id="joinCacPw" name="password" type="password" class="form-control">
                    <p class="p-false" id="p-false-pw"></p>
                </div>
                <div class="h-110">
                    <div class="form-group">
                        <label for="joinCacPwChk" class="placeholder"><b style="color: #ff191e">*</b>비밀번호 확인</label>
                        <input id="joinCacPwChk" name="joinCacPwChk" type="password" class="form-control">
                    </div>
                </div>
                <div class="h-110">
                    <div class="form-group">
                        <label for="joinCacPwChk" class="placeholder"><b style="color: #ff191e">*</b>휴대폰 번호</label>
                        <input id="joinHP" name="hp" type="text" class="form-control">
                    </div>
                </div>
                <div class="h-110">
                    <div class="form-group">
                        <label for="joinCacPwChk" class="placeholder"><b style="color: #ff191e">*</b>이메일</label>
                        <input id="joinCacEmail" name="email" type="email" class="form-control">
                        <p class="p-false" id="p-false-pwChk"></p>
                    </div>
                </div>
                <div class="form-action">
                    <button type="button" id="alert_demo_7" class="btn btn-primary btn-rounded btn-login mr-3">등록</button>
                    <a href="#" id="show-signin" style="color: #430091 !important;" class="link btn btn-white btn-rounded btn-signup">취소</a>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".container-findid").hide();

        $("#goTofindId").click(function () {
            $(".container-login").hide();
            $(".container-findid").css("display", 'block');
            $(".false-box .p-false").text("");
            $("#findMemNm").val("");
            $("#findMemPh").val("");
        });

        $("#goTofindPw").click(function () {
            $(".container-login").hide();
            $(".container-findpw").css("display", 'block');
            $(".false-box .p-false").text("");
            $("#findMemNm").val("");
            $("#findMemPh").val("");
        });

        $(".show-back").click(function () {
            $(".container-findid").hide();
            $(".container-login").show();
            $(".container-findpw").hide();
            $(".false-box .p-false").text("");
            $("#findMemNm").val("");
            $("#findMemPh").val("");
        });

        $("#goToLogin").click(function () {
            $(".container-findid").hide();
            $(".container-login").show();
            $(".container-findpw").hide();
            $(".container-findidtrue").hide();
            $(".false-box .p-false").text("");
            $("#findMemNm").val("");
            $("#findMemPh").val("");
        });

        $("#findPw").click(function () {
            $(".container-findid").hide();
            $(".container-login").hide();
            $(".container-findpw").show();
            $(".container-findidtrue").hide();
            $(".false-box .p-false").text("");
            $("#findMemNm").val("");
            $("#findMemPh").val("");
        });

    });

    /*아이디찾기*/
    function findId() {
        var findMemNm = $("#findMemNm").val();
        var findeMemPh = $("#findMemPh").val();

        $.ajax({
            type: "POST",
            url: "findId",
            data: {Name: findMemNm, hp: findeMemPh},
            dataType: "json",
            success: function (data) {
                //console.log("data  : " + JSON.stringify(data.result));
                if (data.result === 'success') {
                    var maskedId = data.foundId;

                    $(".container-login").hide();
                    $(".container-findpw").css("display", 'none');
                    $(".container-findid").hide();
                    $("#findMemNm").val("");
                    $("#findMemPh").val("");
                    $(".container-findidtrue").show();
                    $(".foundId").text(maskedId);
                } else if (data.result === 'zero') {
                    $(".false-box .p-false").text("필수 항목을 입력해주세요.");
                } else {
                    var errorMsg = data.errorMsg;
                    $(".false-box .p-false").text(errorMsg);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("오류 발생: " + errorThrown);
            }
        });
    }

    function sendTemporaryPw() {
        let tempId = $("#tempId").val();
        let tempEmail = $("#tempEmail").val();
        $.ajax({
            type: "POST",
            url: "findPw",
            data: {id: tempId, email: tempEmail},
            dataType: "json",
            success: function (data) {
                if (data.result === 'success') {
                    $.ajax({
                        type: 'POST',
                        url: 'tempPwSend',
                        data: {
                            id: tempId,
                            email: tempEmail,
                            name : data.name
                        },
                        beforeSend: function () {
                            showLoadingBar();
                        },
                        success: function (data) {
                            hideLoadingBar();
                            swal("임시비밀번호가 발급되었습니다. 담당자 이메일을 확인해주세요.", "", "success").then(function () {
                                    location.reload();
                                }
                            )
                        }
                    })

                } else if (data.result === 'zero') {
                    $(".false-box .p-false").text("필수 항목을 입력해주세요.");
                } else {
                    var errorMsg = data.errorMsg;
                    $(".false-box .p-false").text(errorMsg);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("오류 발생: " + errorThrown);
            }
        });
    }

    function showLoadingBar() {
        // 로딩 바를 추가할 요소 생성
        var loadingBarContainer = document.createElement("div");
        loadingBarContainer.className = "loading-bar-container";

        var loadingBar = document.createElement("div");
        loadingBar.className = "loading";

        var progressText = document.createElement("p");
        progressText.className = "progress-text";
        progressText.innerText = "\u00a0\u00a0 Loading...";

        loadingBarContainer.appendChild(loadingBar);
        loadingBarContainer.appendChild(progressText);

        // body 요소에 스크롤 잠금 클래스 추가
        document.body.classList.add("scroll-lock");

        // 로딩 바를 body에 추가
        document.body.appendChild(loadingBarContainer);
    }

    function hideLoadingBar() {
        // 로딩 바 요소 제거
        var loadingBarContainer = document.querySelector(".loading-bar-container");
        if (loadingBarContainer) {
            loadingBarContainer.remove();
        }

        // body 요소의 스크롤 잠금 클래스 제거
        document.body.classList.remove("scroll-lock");
    }
    // 회원가입
    $(document).on("click", "#alert_demo_7", function() {
        let confirm_val = confirm("가입하시겠습니까?");
        if (confirm_val) {
            $("#memberJoinForm").attr("action", "/mem/join").submit();
        }
    });
    //로그인
    $(document).on("click", "#loginClick", function() {
        $("#loginForm").attr("action", "/mem/login").submit();
    });

    //관리자 로그인 화면으로
    $(document).on("click", "#adminLoginForm", function() {
        location.href = "/totalAdmin/loginAdmin"
    });

    //아이디 중복 체크
    $(function(){
        //아이디 중복 체크
        const $idInput = $("#memberJoinForm input[name=id]");
        $idInput.keyup(function(){
            if($idInput.val().length >= 4){
                $.ajax({
                    url:"memberIdCheck",
                    data:{
                        id : $idInput.val()
                    },
                    dataType: "text",
                    success:function(result){
                        if(result == "NN"){ // 사용불가능
                            $("#p-success-id").show();
                            $("#p-success-id").css("color","red").text(" 사용할 수 없습니다.");
                            $("#alert_demo_7").attr("disabled",true);
                        }else{ // 사용가능
                            $("#p-success-id").show();
                            $("#p-success-id").css("color","green").text(" 사용 가능합니다.");
                            $("#alert_demo_7").attr("disabled",false);
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
    //유효성 처리
    $("#alert_demo_7").on("click", function(){
        var pattern = /^[가-힣]+$/;

        if($("#joinName").val()==""){
            alert("이름을 입력해주세요.");
            $("#joinName").focus();
            return false;
        }

        if($("#joinCacId").val()==""){
            alert("아이디를 입력해주세요.");
            $("#joinCacId").focus();
            return false;
        }
        if($("#joinCacPw").val()==""){
            alert("비밀번호를 입력해주세요.");
            $("#joinCacPw").focus();
            return false;
        }
        if ($('#joinCacPwChk').val() != $('#joinCacPwChk').val()) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요!");
            $('#joinCacPw').val("");
            $('#joinCacPwChk').val("");
            return false;
        }
        if($("#joinHP").val()==""){
            alert("전화번호를 입력해주세요.");
            $("#joinHP").focus();
            return false;
        }
        if($("#joinCacEmail").val()==""){
            alert("이메일을 입력해주세요.");
            $("#joinCacEmail").focus();
            return false;
        }
    })

    //하이픈(-) 자동 입력, 클래스에 phoneNumber 추가
    $(document).on("keyup", "#joinHP", function() {
        $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));
    });


</script>
<jsp:include page="/WEB-INF/view/common/loginFooter.jsp"/>
</body>
</html>