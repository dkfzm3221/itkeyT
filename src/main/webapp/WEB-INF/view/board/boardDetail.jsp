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
   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 게시판 에디터
       *
       **/--%>
    $(document).ready(function () {

        const memberType =$("#memberType").val();
        const userId =$("#userId").val();
        const regNm =$("#regNm").val();
        if(memberType === 'A' && userId !== regNm){
          $("#modiButton").hide();
        }else if (memberType === 'A' && userId === regNm){
          $("#modiButton").show();
        }

      if(memberType === 'A'){
        $("#delBtn").show();
      }else{
        $("#delBtn").hide();
      }
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

        $('#boardEditor').summernote('disable');
    });
</script>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <c:choose>
        <c:when test="${memberType == 'A'}">
            <jsp:include page="../common/sidebarNav_admin.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="../common/sidebarNav.jsp"/>
        </c:otherwise>
    </c:choose>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">

        <form id="moveForm" method="GET">
            <input type="hidden" id="boardNum" name="menuBoardType">
            <input type="hidden" id="memberType" name="memberType" value="${memberType}">
            <input type="hidden" id="userId" name="userId" value="${userId}">
        </form>
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
                                <td colspan="3"><input type="text"
                                                       class="form-control write-form" id="boardTitle"
                                                       placeholder="제목을 작성해 주세요." name="boardTitle" value="${boardDetail.boardTitle}" readonly></td>
                            </tr>
                            <tr>
                                <th class="padding-lg">작성자</th>
                                <td colspan="3">
                                    <input type="text" class="form-control write-form" id="regNm" placeholder="작성자" name="regNm" value="${boardDetail.regNm}" readonly>
                                    <input type="radio" name="boardSecretYn" id="boardSecretY" value="Y" class="radio" ${boardDetail.boardSecretYn == 'Y' ? 'checked' : ''} disabled />공개&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="boardSecretYn" id="boardSecretN" value="N" class="radio" ${boardDetail.boardSecretYn == 'N' ? 'checked' : ''} disabled />비공개
                                    <input type="hidden" name="boardSeq" id="boardSeq" value="${boardDetail.boardSeq}"/>
                                    <input type="hidden" name="boardType" id="boardType" value="${boardDetail.boardType}"/>
                                    <input type="hidden" name="regId" id="regId" value="${boardDetail.regId}"/>
                            </tr>
                            <tr id="hiddenPassword" hidden>
                                <th class="padding-lg">비밀번호</th>
                                <td colspan="3">
                                    <input type="password" class="form-control write-form" id="password" placeholder="비밀번호" name="password" readonly maxlength="4">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">내용</th>
                                <td colspan="4">
                                    <div class="detail-content" id="boardEditor">
                                        <c:out value="${boardDetail.boardContent}" escapeXml="false"/>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button onclick="returnToList()" class="btn btn-black w-3">목록</button>
                <button onclick="modiBoard()" id="modiButton" class="btn btn-black w-3" style="float: right;">수정</button>
                <button onclick="deleteBoard(${boardDetail.boardSeq})" id="delBtn" class="btn btn-black w-3" style="float: right;">삭제</button>
            </div>
        </div>
    </div>
</div>
<script>
   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 게시판 항목으로 돌아가기
       *
       **/--%>
    function returnToList(){
      let form = $("#moveForm");

      $("#boardNum").val($("#boardType").val());

      form.attr("action", "/boardDetailList");
      form.submit();
    }


   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 게시판 글 수정
       *
       **/--%>
    function modiBoard(){
        let password = prompt("비밀번호를 입력하세요."); //비밀번호 체크
        let regId = $("#regId").val();
        let boardSeq = $("#boardSeq").val();

        $.ajax({
            type:"POST",
            url: "/boardPassword",
            data: {
                boardSeq : boardSeq
            },
            success: function (data) {
              const memberType =$("#memberType").val();
                if(password === data.password) {
                    $("#password").val(data.password);
                    $('#boardTitle').removeAttr('readonly');
                    $('#regNm').removeAttr('readonly');
                    $('#boardContent').removeAttr('readonly');
                    $('#boardSecretY').removeAttr('disabled');
                    $('#boardSecretN').removeAttr('disabled');
                    $('#hiddenPassword').removeAttr('hidden');
                    $('#password').removeAttr('readonly');
                    $('button[onclick="modiBoard()"]').attr('onclick', 'updateBoard()');
                    $('#boardEditor').summernote('enable');
                    // 관리자가 아닐때
                    if(memberType !== 'A'){
                      let deleteButton = $('<button/>', {
                        text: '삭제',
                        class: 'btn btn-danger',
                        style: 'float: right; margin-right: 10px;',
                        click: function () { deleteBoard(boardSeq); }
                      });
                      $('#modiButton').before(deleteButton);
                    }

                }else{
                    alert("비밀번호가 일치하지 않습니다.")
                    return false;
                }
            }
        });
    }

    function deleteBoard(seq){
        let isConfirmed = confirm("삭제하시겠습니까?");
      let boardType = $("#boardType").val();
        if (isConfirmed) {
            $.ajax({
                type:"POST",
                url: "/deleteBoard",
                data: {boardSeq : seq
                },
                success: function () {
                  alert("삭제 완료하였습니다.");
                  let form = $("#moveForm");

                  $("#boardNum").val(boardType);

                  form.attr("action", "/boardDetailList");
                  form.submit();
                }
            });
        } else {
            alert("삭제가 취소되었습니다.");
        }

    }


   <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 게시판 글 수정
       *
       **/--%>
    function updateBoard(){
        let boardTitle = $("#boardTitle").val();
        let boardEditor = $("#boardEditor").summernote('code');
        let updNm = $("#regNm").val();
        let password = $("#password").val();
        let boardSecretYn = $("input[name='boardSecretYn']:checked").val();
        let boardSeq = $("#boardSeq").val();
        let boardType = $("#boardType").val();

        if (!boardTitle) {
            alert("제목을 입력해주세요.");
            return;
        }

        if (!boardEditor) {
            alert("내용을 입력해주세요.");
            return;
        }

        if (!updNm) {
            alert("작성자를 입력해주세요.");
            return;
        }
        if (!password) {
            alert("비밀번호를 입력해주세요.");
            return;
        }


        let isConfirmed = confirm("수정하시겠습니까?");
        if (isConfirmed) {
            $.ajax({
                type:"POST",
                url: "/updateBoard",
                data: {boardTitle : boardTitle,
                    boardContent : boardEditor,
                    updNm : updNm,
                    boardSecretYn : boardSecretYn,
                    password : password,
                    boardSeq : boardSeq,
                    boardType : boardType
                },
                success: function () {
                  alert("수정 완료하였습니다.");
                  let form = $("#moveForm");

                  $("#boardNum").val(boardType);

                  form.attr("action", "/boardDetailList");
                  form.submit();
                }
            });
        } else {
            alert("수정이 취소되었습니다.");
        }
    }
</script>
<jsp:include page="../common/contentFooter.jsp"/>
</body>
</html>
