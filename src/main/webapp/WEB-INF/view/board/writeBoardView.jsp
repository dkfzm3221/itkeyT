<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-10
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="../common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<head>
    <title>Title</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
    $(document).ready(function () {

        $('#boardEditor').summernote({
            lang: 'ko-KR',
            height: 300,
            placeholder: '내용을 입력하세요',
            toolbar: [
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link']],
                ['view', ['fullscreen', 'help']]
            ],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30']
        });
    });
</script>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="../common/sidebarNav.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">글쓰기</h3></div>
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
                    <div class="col-sm-12">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th class="padding-lg">제 목</th>
                                <td colspan="3">
                                    <input type="text"
                                           class="form-control write-form" id="boardTitle"
                                           placeholder="제목을 작성해 주세요." name="boardTitle">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">작성자</th>
                                <td colspan="3">
                                    <input type="text" class="form-control write-form" id="regNm" placeholder="작성자" name="regNm">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="boardSecretYn" id="boardSecretY" value="Y" checked>
                                        <label class="form-check-label" for="boardSecretY">공개</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="boardSecretYn" id="boardSecretN" value="N">
                                        <label class="form-check-label" for="boardSecretN">비공개</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">비밀번호</th>
                                <td colspan="3">
                                    <input type="password" class="form-control write-form" id="password" placeholder="비밀번호" name="password" maxlength="4">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">내용</th>
                                <td colspan="4">
                                    <div class="detail-content" id="boardEditor">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button onclick="insertBoard()" class="btn btn-black w-3" style="float: right;">등록</button>
            </div>
        </div>
    </div>
</div>
<script>
function insertBoard(){

    let boardTitle = $("#boardTitle").val();
    let boardEditor = $("#boardEditor").summernote('code');
    let regName = $("#regNm").val();
    let password = $("#password").val();
    let boardSecretYn = $("input[name='boardSecretYn']:checked").val();

    if (!boardTitle) {
        alert("제목을 입력해주세요.");
        return;
    }

    if (!boardEditor) {
        alert("내용을 입력해주세요.");
        return;
    }

    if (!regName) {
        alert("작성자를 입력해주세요.");
        return;
    }
    if (!password) {
        alert("비밀번호를 입력해주세요.");
        return;
    }


    let isConfirmed = confirm("등록하시겠습니까?");

    if (isConfirmed) {
        $.ajax({
            type:"POST",
            url: "/writeBoard",
            data: {boardTitle : boardTitle,
                boardContent : boardEditor,
                regNm : regName,
                boardSecretYn : boardSecretYn,
                password : password
            },
            success: function () {
                window.location.href = "/";
            }
        });
    } else {
        alert("등록이 취소되었습니다.");
    }
}
</script>

</body>
</html>
