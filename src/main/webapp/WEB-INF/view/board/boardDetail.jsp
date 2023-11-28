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
                                <th class="padding-lg">첨부파일</th>
                                <td colspan="4">
                                    <div class="detail-content" id="">
                                    <c:if test="${empty boardDetail.fileIdx}">
                                        첨부된 파일이 없습니다.
                                    </c:if>
                                    <c:if test="${not empty boardDetail.fileIdx}">
                                        <ul id="fileList">
                                            <li id="preview" class="banner-image-preview" onclick="downloadFile(${boardDetail.fileIdx})"  value="${boardDetail.oriNm}"/>${boardDetail.oriNm}
                                            <button id="delFile" onclick="delFile(${boardDetail.fileIdx})">x</button>
                                        </ul>
                                    </c:if>
                                    </div>
                                    <input type="file" title="파일선택" name="multipleFileInput" id="uploadFile" multiple style="display: none;">
                                    <div class="fileDownList">
                                        <ul id="newFileList"></ul>
                                    </div>
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

            <div class="page-inner">
                <div class="row">
                    <div class="col-sm-10">
                        <table class="table table-bordered">
                            <!--// tableTop -->
                            <!-- rowTable bgTh -->
                            <div class="rowTable v2 bgTh">
                                <colgroup>
                                    <col style="width:150px">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>댓글</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                                        <c:if test="${ empty boardDetailReplyList }">
                                            <tr>
                                                <td colspan="4">등록된 댓글이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${!empty boardDetailReplyList }">
                                            <c:forEach items="${boardDetailReplyList}" var="item" varStatus="index">
                                                <tr>
                                                    <td>
                                                        <textarea class="detail-content" title="댓글" cols="100" rows="3" id="replyTextareaRead${item.replySeq}" readonly disabled>${item.replyContents}</textarea>
                                                    </td>
                                                    <td>${item.regUser}</td>
                                                    <td>${item.regDate}</td>
                                                    <td>
                                                    <c:if test="${item.regUser eq userId}">
                                                        <button onclick="modiBoardReply(${item.replySeq})" id="modBtnReply${item.replySeq}" class="btn btn-black w-3" style="float: right;">수정</button>
                                                        <button onclick="cancelBoardReply(${item.replySeq})" type="reset" name="cancelBtn${item.replySeq}" class="btn btn-black w-3" style="float: right;">취소</button><br/>
                                                    </c:if>
                                                     <c:if test="${item.regUser eq userId || memberType eq 'A'}">
                                                        <button onclick="deleteBoardReply(${item.replySeq})" id="delBtnReply${item.replySeq}" class="btn btn-black w-3" style="float: right;">삭제</button><br/>
                                                     </c:if>

                                                    </td>
                                                    <input type="hidden" name="replySeq" id="replySeq" value="${item.replySeq}"/>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                </tbody>
                            </div>
                        </table>
                    </div>
                </div>
            </div>
<c:choose>
    <c:when test="${!empty memberType}">
            <div class="page-inner">
                <div class="row">
                    <div class="col-sm-10">
                        <table class="table table-bordered">
                            <!--// tableTop -->
                            <!-- rowTable bgTh -->
                            <div class="rowTable v2 bgTh">
                                <colgroup>
                                    <col style="width:150px">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">댓글</th>
                                    <td colspan="1"></td>
                                </tr>
                                <tr>
                                    <td class="conArea">
                                        <div>
                                            <textarea title="댓글" cols="150" rows="3" id="replyText"></textarea>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </div>
                        </table>
                        <button id="reply" class="btn btn-black w-3" style="float: right;" onclick="insertReply()">등록</button>
                    </div>
                </div>
            </div>
    </c:when>
</c:choose>

        </div>
    </div>
</div>
<script>
  <%-- /**
         *
         *
         *@author 신금환
         *@date 2023-11-28
         *@comment 첨부파일 수정 로직
         *
         **/--%>
  const removedFiles = [];
  const allFiles = [];
  $(document).ready(function() {

    const fileList = $('#preview');
    const uploadFile = $('#uploadFile');
    const oldFileList = $('#fileList');
    const maxFileCount = 3; // 최대 파일 첨부 개수
    uploadFile.on('change', handleFileSelect);

    function handleFileSelect(event) {
      const files = event.target.files;
      const currentFileCount = fileList.find('li').length;
      oldFileList.hide();

      if(files.length > 3 || currentFileCount + files.length > maxFileCount){
        alert("파일 등록은 죄대 1개까지 가능합니다.");
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
      const deleteButton = $('<button></button>', {
        type: 'button',
        class: 'btnDel',
        html: '<span class="hide">파일 삭제</span>',
        click: function() {
          listItem.remove();
          removedFiles.push(file.name);
        }
      });

      listItem.append(fileName);
      listItem.append(deleteButton);

      return listItem;
    }

  });

  $(document).ready(function () {
    $('[name^="cancelBtn"]').hide();
    $("#delFile").hide();
  })

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

                  $("#fileUploadArea").toggle();
                  $("#uploadFile").toggle();
                  $("#delFile").show();

                  // 선택한 파일 목록을 가져와서 미리 보기로 표시
                  const files = $("#uploadFile")[0].files;
                  const newFileList = $("#newFileList");
                  newFileList.empty();

                  for (var i = 0; i < files.length; i++) {
                    newFileList.append("<li>" + files[i].name + "</li>");
                  }

                }else{
                    alert("비밀번호가 일치하지 않습니다.")
                    return false;
                }
            }
        });
    }


  <%-- /**
           *
           *
           *@author 신금환
           *@date 2023-11-28
           *@comment 게시물 삭제
           *
           **/--%>
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
           *@author 신금환
           *@date 2023-11-28
           *@comment 댓글등록
           *
           **/--%>
    function insertReply(){
      let boardSeq = $("#boardSeq").val();
      let replyContents = $("#replyText").val();
      let boardType = $("#boardType").val();
      let regUser = $("#userId").val();
      if (!replyContents) {
        alert("내용을 입력해주세요.");
        return;
      }

      let isConfirmed = confirm("등록하시겠습니까?");

        if (isConfirmed) {
            $.ajax({
                type:"POST",
                url: "/insertBoardReply",
                data: {boardSeq: boardSeq,
                  replyContents: replyContents,
                  boardType: boardType,
                  regUser: regUser
                },
                success: function () {
                  alert("등록 완료하였습니다.");
                  location.reload();
                }
            });
        } else {
            alert("댓글 등록되었습니다.");
        }

    }

  <%-- /**
         *
         *
         *@author 신금환
         *@date 2023-11-28
         *@comment 버튼타입변경
         *
         **/--%>
   function modiBoardReply(seq){
       $('#replyTextareaRead'+seq).removeAttr('readonly');
       $('#replyTextareaRead' + seq).removeAttr('disabled');
       $('#modBtnReply'+seq).attr('onclick', 'updateBoardReply('+seq+')');
     $('#delBtnReply'+seq).hide();
     $('[name="cancelBtn' + seq + '"]').show();

   }
  // 버든 타입 변경
   function cancelBoardReply(seq){
       $('#replyTextareaRead'+seq).attr('readonly', 'readonly');
       $('#replyTextareaRead' + seq).attr('disabled', 'disabled');
       $('#modBtnReply'+seq).attr('onclick', 'modiBoardReply('+seq+')');
     $('#delBtnReply'+seq).show();
     $('[name="cancelBtn' + seq + '"]').hide();

   }

  <%-- /**
           *
           *
           *@author 신금환
           *@date 2023-11-28
           *@comment 댓글수정
           *
           **/--%>
   function updateBoardReply(seq){
     let replyTextareaRead = $("#replyTextareaRead"+seq).val();

     if (!replyTextareaRead) {
       alert("내용을 입력해주세요.");
       return;
     }

     let isConfirmed = confirm("댓글 수정 하시겠습니까?");
     if (isConfirmed) {
       if (isConfirmed) {
         $.ajax({
           type:"POST",
           url: "/modBoardReply",
           data: {replySeq: seq,
             replyContents: replyTextareaRead
           },
           success: function () {
             alert("수정 완료하였습니다.");
             location.reload();
           }
         });
       } else {
         alert("삭제가 취소되었습니다.");
       }
     }
   }

  <%-- /**
          *
          *
          *@author 신금환
          *@date 2023-11-28
          *@comment 댓글 삭제
          *
          **/--%>
   function deleteBoardReply(seq){
     let isConfirmed = confirm("삭제하시겠습니까?");
     if (isConfirmed) {
       $.ajax({
         type:"POST",
         url: "/deleteBoardReply",
         data: {replySeq : seq
         },
         success: function () {
           alert("삭제 완료하였습니다.");
          location.reload();
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
      let formData = new FormData();
        let boardTitle = $("#boardTitle").val();
        let boardEditor = $("#boardEditor").summernote('code');
        let updNm = $("#regNm").val();
        let password = $("#password").val();
        let boardSecretYn = $("input[name='boardSecretYn']:checked").val();
        let boardSeq = $("#boardSeq").val();
        let boardType = $("#boardType").val();

      if (allFiles.length > 0) {
        for (let i = 0; i < allFiles.length; i++) {
          const file = allFiles[i];
          if (removedFiles.indexOf(file.name) === -1) {
            // console.log("File " + (i + 1) + ": " + allFiles[i].name);
            formData.append("file", file);
          }
        }
      }

      formData.append("boardTitle", boardTitle);
      formData.append("boardContent", boardEditor);
      formData.append("updNm", updNm);
      formData.append("password", password);
      formData.append("boardSecretYn", boardSecretYn);
      formData.append("boardSeq", boardSeq);
      formData.append("boardType", boardType);

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
                type:"POST"
                ,url: "/updateBoard"
                ,data: formData
                  , enctype: "multipart/form-data"
                  , contentType: false
                  , processData: false
                ,success: function () {
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

  <%-- /**
             *
             *
             *@author 신금환
             *@date 2023-11-28
             *@comment 파일삭제
             *
             **/--%>
  function delFile(fileIdx){
    let isConfirmed = confirm("첨부 파일을 삭제하시겠습니까?");
    if (isConfirmed) {
      $.ajax({
        type:"POST",
        url: "/deleteBoardFile",
        data: {fileIdx : fileIdx
        },
        success: function () {
          alert("삭제 완료하였습니다.");
          location.reload();
        }
      });
    } else {
      alert("삭제가 취소되었습니다.");
    }
  }
</script>
<jsp:include page="../common/contentFooter.jsp"/>
</body>
</html>
