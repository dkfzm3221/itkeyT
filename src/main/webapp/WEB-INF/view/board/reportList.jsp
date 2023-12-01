<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="../common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<style>
    .boardTable {
        border-collapse: collapse;
    }
    .boardTable th, .boardTable td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .boardTable tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .boardTable th {
        background-color: #1572E8;
        color: white;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%; /* 수정된 부분: 너비를 40%로 설정 */
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    textarea {
        width: 100%;
        height: 100px;
        resize: none;
    }
</style>
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
<%--            <input type="hidden" id="menuBoardType" name="menuBoardType" value="${boardType}">--%>
            <input type="hidden" id="searchRegName" name="searchRegName">
            <input type="hidden" id="title" name="title" value="${searchRegName}">
        </form>
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">전체 신고글</h3></div>
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
                    <div class="col">
                        <div class="card">
                            <div class="card-body">

                                <div class="card-header mb-4 pb-2" style="padding: 0;">
                                    <div class="card-title">
                                    </div>
                                </div>
                                <div id="boardList">
                                    <table class="text-center boardTable">
                                        <colgroup>
                                            <col style="width:100px;">
                                            <col style="width:auto">
                                            <col span="4" style="width:120px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="width:10%;">No.</th>
                                            <th style="width:10%;">신고자</th>
                                            <th style="width:30%;">신고 게시물 제목</th>
                                            <th style="width:10%;">신고내용</th>
                                            <th style="width:10%;">등록일</th>
                                            <th style="width:20%;">삭제 현황</th>
                                            <th style="width:20%;">신고내역 삭제</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <form id="searchForm" method="GET" id="searchForm">
                                            <div class="flex">
                                                <input type="text" id="searchTitle"  title="검색어" placeholder="제목">
                                                <button type="button" class="btn" id="searchButton" onclick="openSearch()">검색</button>
                                            </div>
                                        </form>
                                        <div class="card-header mb-4 pb-2" style="padding: 0;">
                                            <div class="card-title">
                                               신고 관리함
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${memberType == 'A'}">
                                                <c:if test="${empty reportList }">
                                                    <tr>
                                                        <td colspan="7">신고된 게시물이 없습니다.</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${!empty reportList }">
                                                    <c:forEach items="${reportList}" var="item" varStatus="index">
                                                        <tr>
                                                            <td style="text-align:center;">${index.index + 1}</td>
                                                            <td>${item.regName}</td>
                                                            <td><a href="/boardDetail?boardSeq=${item.boardSeq}">${item.boardTitle}</a></td>
                                                            <td><button onclick="reportDetailView(${item.reportIdx},${item.boardSeq})" class="btn btn-black w-3" style="float: right;">신고내용보기</button></td>
                                                            <td>${item.reportRegDate}</td>
                                                            <td>${item.reportState == 'Y' ? '삭제완료' : '삭제요청'}</td>
                                                            <td><button onclick="deleteReport(${item.reportIdx})" class="btn btn-black w-3" style="float: right;">내역 삭제</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </c:when>
                                        </c:choose>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:forEach begin="${pageInfo.startPageGroup}" end="${pageInfo.endPageGroup}" var="pageNumber">
                                        <c:choose>
                                            <c:when test="${pageNumber == pageInfo.currentPage}">
                                                <li class="page-item active">
                                                    <span class="page-link">${pageNumber}</span>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
<%--                                                    <a class="page-link" href="?menuBoardType=${pageInfo.boardType}&pageNum=${pageNumber}">${pageNumber}</a>--%>
                                                    <a class="page-link" href="?pageNum=${pageNumber}">${pageNumber}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="reportModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">신고내용</h2>
            <textarea id="reportContent" readonly></textarea>
            <button id="submitBtn">해당 게시물 삭제</button>
        </div>
    </div>

</div>
<script>
  const reportBoardSeq = {};
  const reportBoardIdx = {};
  $(document).ready(function () {
    // 엔터키 막음
    $("#searchTitle").keypress(function(event) {
      if (event.which === 13) { // 13 is the key code for Enter
        event.preventDefault();
      }
    });

    // 검색 후 검색어 유지
    if($("#title").val() !== null || $("#title").val() !== ''){
      $("#searchTitle").val($("#title").val());
    }

    $("#reportBtn").click(function () {
      // 모달 열기
      $("#reportModal").css("display", "block");
    });

    $(".close").click(function () {
      // 모달 닫기
      $("#reportModal").css("display", "none");
    });

    $("#submitBtn").click(function () {
      let formData = new FormData();
      let isConfirmed = confirm("해당 게시물을 삭제하시겠습니까?");

      formData.append("boardSeq", reportBoardSeq.boardSeq);
      formData.append("reportIdx", reportBoardIdx.reportIdx);


      if (isConfirmed) {
        $.ajax({
          type:"POST"
          ,url: "/report/reportBoardDelete"
          ,data: formData
          , contentType: false
          , processData: false
          ,success: function () {
            alert("삭제 완료하였습니다.");
            location.reload();
          }
        });
      } else {
        alert("삭제가 취소되었습니다.");
      }

    });
  })


  function reportDetailView(reportIdx,boardSeq) {
    // 클로저를 사용하여 boardSeq 저장
    reportBoardSeq.boardSeq = boardSeq;
    reportBoardIdx.reportIdx = reportIdx;
    // 모달 열기
    $.ajax({
      type:"POST"
      ,url: "/report/reportRead"
      ,data: {reportIdx : reportIdx}
      ,success: function (data) {
        $("#reportModal").css("display", "block");
        if(data !== null || data !== ""){
          $("#reportContent").text(data.reportContents);
        }
      }
    });

  }

  function deleteReport(reportIdx) {

    let formData = new FormData();
    let isConfirmed = confirm("해당 내역을 삭제하시겠습니까?");
    formData.append("reportIdx", reportIdx);


    if (isConfirmed) {
      $.ajax({
        type:"POST"
        ,url: "/report/deleteReportHistory"
        ,data: formData
        , contentType: false
        , processData: false
        ,success: function () {
          alert("내역 삭제 완료하였습니다.");
          location.reload();
        }
      });
    } else {
      alert("삭제가 취소되었습니다.");
    }

  }


  // 검색
  let openSearch = function() {
    let form = $("#moveForm");
    $("#searchRegName").val($("#searchTitle").val());


    form.attr("action", "/report/reportList");
    form.submit();
  }


</script>
<!-- Footer  -->
<jsp:include page="../common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>