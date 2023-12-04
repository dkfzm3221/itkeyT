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
       *@comment 게시판 글 에디터
       *
       **/--%>
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
                                <td colspan="3">
                                    <input type="text"
                                           class="form-control write-form" id="boardTitle"
                                           placeholder="제목을 작성해 주세요." name="boardTitle">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">작성자</th>
                                <td colspan="3">
                                    <c:if test="${empty userId}">
                                        <input type="text" class="form-control write-form" id="regNm" placeholder="작성자" name="regNm" oninput="checkUserId(this.value)">
                                    </c:if>
                                    <c:if test="${!empty userId}">
                                        <c:if test="${memberType == 'A'}">
                                            <input type="text" class="form-control write-form" id="regNm" placeholder="작성자" name="regNm" value="관리자" readonly>
                                        </c:if>
                                        <c:if test="${memberType == 'U'}">
                                            <input type="text" class="form-control write-form" id="regNm" placeholder="작성자" name="regNm" value="${userId}" readonly>
                                        </c:if>
                                    </c:if>
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
                                <th class="padding-lg">첨부파일</th>
                                <td colspan="3">
                                    <input type="file" title="파일선택" name="multipleFileInput" id="uploadFile" multiple>
                                    <div class="fileDownList">
                                        <ul id="fileList">
                                        </ul>
                                    </div>
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
                <button onclick="insertBoard(${boardType})" class="btn btn-black w-3" style="float: right;">등록</button>
            </div>
        </div>
    </div>
</div>
<script>

  const removedFiles = [];
  const allFiles = [];

  const fileList = $('#fileList');
  const uploadFile = $('#uploadFile');
  const maxFileCount = 1; // 최대 파일 첨부 개수
  uploadFile.on('change', handleFileSelect);

  function handleFileSelect(event) {
    const files = event.target.files;
    const currentFileCount = fileList.find('li').length;
    if(files.length > 1 || currentFileCount + files.length > maxFileCount){
     alert("파일 등록은 죄대 3개까지 가능합니다.");
      return false;
    }else{
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const listItem = createListItem(file);
        fileList.append(listItem);
        allFiles.push(file);
      }
    }

  }

  function createListItem(file) {
    const listItem = $('<li></li>');
    const fileName = $('<a></a>').text(file.name);
    const deleteButton = $('<button class=""></button>', {
      type: 'button',
      class: 'btn btn-black w-3',
      html: '<span class="">파일 삭제</span>',
      click: function() {
        listItem.remove();
        removedFiles.push(file.name);
      }
    });

    listItem.append(fileName);
    listItem.append(deleteButton);
    return listItem;
  }

  function checkUserId(value) {
      var adminIds = ['admin', 'ADMIN', '관리자'];
      if (adminIds.includes(value)) {
          alert('사용할 수 없는 작성자명입니다.');
          $("#regNm").val("");
          $("#regNm").focus();
      }
  }

  // 게시물 등록
function insertBoard(boardType){
  let formData = new FormData();

    let boardTitle = $("#boardTitle").val();
    let boardEditor = $("#boardEditor").summernote('code');
    let regName = $("#regNm").val();
    let password = $("#password").val();

    let boardSecretYn = $("input[name='boardSecretYn']:checked").val();

  formData.append("boardTitle",boardTitle);
  formData.append("boardContent",boardEditor);
  formData.append("password",password);
  formData.append("regNm",regName);
  formData.append("boardSecretYn",boardSecretYn);
  formData.append("boardType",boardType);


  if (allFiles.length > 0) {
    for (let i = 0; i < allFiles.length; i++) {
      const file = allFiles[i];
      if (removedFiles.indexOf(file.name) === -1) {
        console.log("File " + (i + 1) + ": " + allFiles[i].name);
        formData.append("file", file);
      }
    }
  }

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
        /*$.ajax({
            type:"POST",
            url: "/writeBoard",
            data: {boardTitle : boardTitle,
                boardContent : boardEditor,
                regNm : regName,
                boardSecretYn : boardSecretYn,
                password : password,
                boardType : boardType
            },
            success: function () {
              alert("등록완료하였습니다.");
              let form = $("#moveForm");

              $("#boardNum").val(boardType);

              form.attr("action", "/boardDetailList");
              form.submit();
            }
        });
        */
        $.ajax({
            type:"POST"
            ,url: "/writeBoard"
            , data: formData
            , enctype: "multipart/form-data"
            , contentType: false
            , processData: false
            ,success: function () {
              alert("등록완료하였습니다.");
              let form = $("#moveForm");

              $("#boardNum").val(boardType);

              form.attr("action", "/boardDetailList");
              form.submit();
            }
        });
    } else {
        alert("등록이 취소되었습니다.");
    }
}
</script>
<jsp:include page="../common/contentFooter.jsp"/>
</body>
</html>
