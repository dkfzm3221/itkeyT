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
        *@date 2023-11-29
        *@comment 공지사항 에디터
        *
        **/--%>
    $(document).ready(function () {

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
    <jsp:include page="../common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <form id="moveForm" method="GET">
            <input type="hidden" id="noticeNum" name="menuBoardType">
        </form>
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
                                <td colspan="3">
                                    <input type="text"
                                           class="form-control write-form" id="noticeTitle"
                                           placeholder="제목을 작성해 주세요." name="noticeTitle">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">메뉴 타입</th>
                                <td colspan="3">
                                    <input type="text"
                                           class="form-control write-form" id="noticeType"
                                           placeholder="메뉴타입을 입력해주세요." name="noticeType">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">첨부파일</th>
                                <td colspan="3">
                                    <input type="file" title="파일선택" name="multipleFileInput" id="uploadFile" multiple>
                                    <div class="fileDownList">
                                       <%-- <ul id="fileList">
                                        </ul>--%>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">내용</th>
                                <td colspan="4">
                                    <div class="detail-content" id="noticeEditor">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button onclick="insertNotice()" class="btn btn-black w-3" style="float: right;">등록</button>
                <button onclick="moveToNoticeList()" class="btn btn-black w-3">목록</button>
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
      *@comment 목록으로
      *
      **/--%>
    function moveToNoticeList(){
        window.location.href = "/notice/noticeList";
    }


    <%-- /**
      *
      *
      *@author 김재섭
      *@date 2023-11-29
      *@comment 공지사항 파일첨부
      *
      **/--%>
    const removedFiles = [];
    const allFiles = [];

    const fileList = $('#fileList');
    const uploadFile = $('#uploadFile');
    const maxFileCount = 1; // 최대 파일 첨부 개수
    uploadFile.on('change', handleFileSelect);

    function handleFileSelect(event) {
        const files = event.target.files;
        const currentFileCount = fileList.find('li').length;
        if (files.length > 1 || currentFileCount + files.length > maxFileCount) {
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
        const deleteButton = $('<button class=""></button>', {
            type: 'button',
            class: 'btn btn-black w-3',
            html: '<span class="">파일 삭제</span>',
            click: function () {
                listItem.remove();
                removedFiles.push(file.name);
            }
        });

        listItem.append(fileName);
        listItem.append(deleteButton);
        return listItem;
    }

    <%-- /**
      *
      *
      *@author 김재섭
      *@date 2023-11-29
      *@comment 공지사항 등록
      *
      **/--%>
    function insertNotice() {
        let formData = new FormData();

        let noticeTitle = $("#noticeTitle").val();
        let noticeEditor = $("#noticeEditor").summernote('code');
        let noticeType = $("#noticeType").val();

        formData.append("noticeTitle", noticeTitle);
        formData.append("noticeContents", noticeEditor);
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

        if (!noticeTitle) {
            alert("제목을 입력해주세요.");
            return;
        }

        if (!noticeEditor) {
            alert("내용을 입력해주세요.");
            return;
        }

        if (!noticeType) {
            alert("내용을 입력해주세요.");
            return;
        }


        let isConfirmed = confirm("등록하시겠습니까?");

        if (isConfirmed) {
            $.ajax({
                type: "POST"
                , url: "/notice/insertNotice"
                , data: formData
                , enctype: "multipart/form-data"
                , contentType: false
                , processData: false
                , success: function () {
                    alert("등록완료하였습니다.");
                    window.location.href = "/notice/noticeList";
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
