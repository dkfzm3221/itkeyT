<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-10
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        *@comment 공지사항 에디터
        *
        **/--%>
    $(document).ready(function () {
        const memberType = $("#memberType").val();
        if (memberType !== 'A') {
            $("#modiButton").hide();
            $("#delBtn").hide();
            $("#noticeTitle").attr("readonly", "true");
            $("#noticeType").attr("readonly", "true");
            $("#uploadFile").prop("disabled", true);
            $("#noticeEditor").summernote('disable');
        }
        $('#noticeEditor').summernote({
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
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">공지사항</h3></div>
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
                                                       class="form-control write-form" id="noticeTitle"
                                                       placeholder="제목을 작성해 주세요." name="noticeTitle"
                                                       value="${noticeDetail.noticeTitle}"></td>
                            </tr>
                            <tr>
                                <th class="padding-lg">메뉴 타입</th>
                                <td colspan="3"><input type="text"
                                                       class="form-control write-form" id="noticeType"
                                                       placeholder="메뉴타입을 입력해주세요." name="noticeType"
                                                       value="${noticeDetail.noticeType}"></td>
                            </tr>
                            <input type="hidden" id="memberType" value="${memberType}">
                            <tr>
                                <th class="padding-lg">작성자</th>
                                <td colspan="3">
                                    <input type="text" class="form-control write-form" id="regNm" placeholder="작성자"
                                           name="regNm" value="${noticeDetail.regId}" readonly>
                                    <input type="hidden" name="noticeSeq" id="noticeSeq"
                                           value="${noticeDetail.noticeSeq}"/>
                                    <input type="hidden" name="regId" id="regId" value="${noticeDetail.regId}"/>
                            </tr>
                            <tr>
                                <th class="padding-lg">첨부파일</th>
                                <td colspan="4">
                                    <div class="detail-content" id="">
                                        <c:if test="${empty noticeDetail.fileIdx}">
                                            첨부된 파일이 없습니다.
                                        </c:if>
                                        <c:if test="${not empty noticeDetail.fileIdx}">
                                            <ul id="fileList">
                                                <li id="preview" class="banner-image-preview">
                                                    <a id="downloadLink" href="#"
                                                       onclick="downloadFile('${noticeDetail.filePath}'
                                                               , '${noticeDetail.saveNm}', '${noticeDetail.oriNm}')">${noticeDetail.oriNm}</a>
                                                    <button id="delFile" onclick="delFile(${noticeDetail.fileIdx})"
                                                            style="display: none;">x
                                                    </button>
                                                </li>
                                            </ul>
                                        </c:if>
                                    </div>
                                    <input type="file" title="파일선택" name="multipleFileInput" id="uploadFile">
                                    <div class="fileDownList">
                                        <ul id="newFileList"></ul>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th class="padding-lg">내용</th>
                                <td colspan="4">
                                    <div class="detail-content" id="noticeEditor">
                                        <c:out value="${noticeDetail.noticeContents}" escapeXml="false"/>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button onclick="returnToList()" class="btn btn-black w-3">목록</button>
                <button onclick="modiNotice(${noticeDetail.noticeSeq})" id="modiButton" class="btn btn-black w-3"
                        style="float: right;">수정
                </button>
                <button onclick="deleteNotice(${noticeDetail.noticeSeq})" id="delBtn" class="btn btn-danger w-3"
                        style="float: right;">삭제
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-29
       *@comment 공지사항 첨부파일 수정
       *
       **/--%>
    const removedFiles = [];
    const allFiles = [];
    $(document).ready(function () {

        const fileList = $('#preview');
        const uploadFile = $('#uploadFile');
        const oldFileList = $('#fileList');
        const maxFileCount = 3; // 최대 파일 첨부 개수
        uploadFile.on('change', handleFileSelect);

        function handleFileSelect(event) {
            const files = event.target.files;
            const currentFileCount = fileList.find('li').length;
            oldFileList.hide();

            if (files.length > 3 || currentFileCount + files.length > maxFileCount) {
                alert("파일 등록은 죄대 1개까지 가능합니다.");
                return false;
            } else {
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
                click: function () {
                    listItem.remove();
                    removedFiles.push(file.name);
                }
            });

            listItem.append(fileName);
            listItem.append(deleteButton);

            return listItem;
        }

    });


    <%-- /**
        *
        *
        *@author 김재섭
        *@date 2023-11-29
        *@comment 공지사항 항목으로 돌아가기
        *
        **/--%>

    function returnToList() {
        window.location.href = "/notice/noticeList";
    }


    <%-- /**
        *
        *
        *@author 김재섭
        *@date 2023-11-23
        *@comment 공지사항 수정
        *
        **/--%>

    function modiNotice(seq) {
        let formData = new FormData();
        let noticeTitle = $("#noticeTitle").val();
        let noticeContents = $("#noticeEditor").summernote('code');
        let noticeType = $("#noticeType").val();

        if (!noticeTitle) {
            alert("제목을 입력해주세요.");
            return;
        }

        if (!noticeContents) {
            alert("내용을 입력해주세요.");
            return;
        }

        if (!noticeType) {
            alert("메뉴타입을 입력해주세요.");
            return;
        }

        if(isNaN(noticeType)){
            alert("숫자만 입력 가능합니다.");
            return false;
        }

        formData.append("noticeTitle", noticeTitle);
        formData.append("noticeContents", noticeContents);
        formData.append("noticeSeq", seq);
        formData.append("noticeType", noticeType);

        if (allFiles.length > 0) {
            for (let i = 0; i < allFiles.length; i++) {
                const file = allFiles[i];
                if (removedFiles.indexOf(file.name) === -1) {
                    console.log("File " + (i + 1) + ": " + allFiles[i].name);
                    formData.append("file", file);
                }
            }
        }
        let isConfirmed = confirm("수정하시겠습니까?");

        if (isConfirmed) {
            $.ajax({
                type:"POST"
                ,url: "/notice/modiNotice"
                , data: formData
                , enctype: "multipart/form-data"
                , contentType: false
                , processData: false
                ,success: function () {
                    alert("수정완료하였습니다.");
                    window.location.reload();

                }
            });
        } else {
            alert("수정이 취소되었습니다.");
        }
    }


    <%-- /**
             *
             *
             *@author 김재섭
             *@date 2023-11-29
             *@comment 공지사항 삭제
             *
             **/--%>

    function deleteNotice(seq) {
        let isConfirmed = confirm("삭제하시겠습니까?");
        if (isConfirmed) {
            $.ajax({
                type: "POST",
                url: "/notice/deleteNotice",
                data: {
                    noticeSeq: seq
                },
                success: function () {
                    window.location.href = "/notice/noticeList";
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
    *@comment 파일다운로드
    *
    **/--%>

    function downloadFile(filePath, saveNm, oriNm) {
        var a = document.createElement('a');
        a.href = filePath;
        a.download = saveNm;
        a.click();
    }
</script>
<jsp:include page="../common/contentFooter.jsp"/>
</body>
</html>
