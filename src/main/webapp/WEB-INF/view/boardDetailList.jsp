<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
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
            <jsp:include page="common/sidebarNav_admin.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="common/sidebarNav.jsp"/>
        </c:otherwise>
    </c:choose>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <form id="moveForm" method="GET">
            <input type="hidden" id="menuBoardType" name="menuBoardType" value="${boardType}">
            <input type="hidden" id="searchBoardTitle" name="searchBoardTitle">
            <input type="hidden" id="title" name="title" value="${searchBoardTitle}">
        </form>
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">전체 게시글</h3></div>
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
                                            <col style="width:70px;">
                                            <col style="width:auto">
                                            <col span="4" style="width:120px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th style="width:10%;">No.</th>
                                            <th style="width:10%;">작성자</th>
                                            <th style="width:40%;">제목</th>
                                            <th style="width:10%;">공개/비공개</th>
                                            <th style="width:10%;">조회수</th>
                                            <th style="width:30%;">등록일</th>
                                            <th style="width:30%;">신고</th>
                                            <c:if test="${memberType == 'A'}">
                                                <th style="width:30%;">설정</th>
                                            </c:if>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <form id="searchForm" method="GET" id="searchForm">
                                            <div class="flex">
                                                <input type="text" id="searchTitle"  title="검색어" placeholder="제목">
                                                <button type="button" class="btn" id="searchButton" onclick="openSearch(${boardType})">검색</button>
                                            </div>
                                        </form>
                                        <div class="card-header mb-4 pb-2" style="padding: 0;">
                                            <div class="card-title">
                                                ${selectName}
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${memberType == 'A'}">
                                                <c:if test="${ empty boardDetailList }">
                                                    <tr>
                                                        <td colspan="7">게시된 글이 없습니다.</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${!empty boardDetailList }">
                                                    <c:forEach items="${boardDetailList}" var="item" varStatus="index">
                                                        <tr>
                                                            <td style="text-align:center;">${index.index + 1}</td>
                                                            <td>${item.regNm}</td>
                                                            <td><a href="/boardDetail?boardSeq=${item.boardSeq}">${item.boardTitle}</a></td>
                                                            <td>${item.boardSecretYn == 'Y' ? '공개' : '비공개'}</td>
                                                            <td>${item.inqCnt}</td>
                                                            <td>${item.regDt}</td>
                                                            <td><button onclick="deleteBoard(${item.boardSeq},${boardType})" id="delBtn" class="btn btn-black w-3" style="float: right;">삭제</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${ empty boardDetailList }">
                                                    <tr>
                                                        <td colspan="7">게시된 글이 없습니다.</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${!empty boardDetailList }">
                                                    <c:forEach items="${boardDetailList}" var="item" varStatus="index">
                                                        <tr>
                                                            <td style="text-align:center;">${boardDetailList.size() - index.index}</td>
                                                            <td>
                                                                ${item.regNm}
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${item.boardSecretYn == 'N'}"><a onclick="checkPassword('${item.boardSeq}')">비공개글입니다.</a></c:when>
                                                                    <c:otherwise><a href="/boardDetail?boardSeq=${item.boardSeq}">${item.boardTitle}</a></c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${item.boardSecretYn == 'Y' ? '공개' : '비공개'}</td>
                                                            <td>${item.inqCnt}</td>
                                                            <td>${item.regDt}</td>
<%--                                                            <td><button onclick="report(${item.boardSeq},${boardType})" id="report" class="btn btn-black w-3" style="float: right;">신고하기</button></td>--%>
                                                            <td><button id="reportBtn" class="btn btn-black w-3" style="float: right;">신고하기</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </c:otherwise>
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
                                                    <a class="page-link" href="?menuBoardType=${pageInfo.boardType}&pageNum=${pageNumber}">${pageNumber}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
<%--                        <input type="hidden" id="boardType" value="${item.boardType}">--%>
                        <button onclick="moveToWriteBoard(${boardType})" class="btn btn-black w-3" style="float: right;">글쓰기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="reportModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">신고내용</h2>
            <textarea id="reportContent" placeholder="신고 내용을 입력하세요"></textarea>
            <button id="submitBtn">제출하기</button>
        </div>
    </div>

</div>
<script>
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
      // 신고 내용 제출 로직 추가
      let reportContent = $("#reportContent").val();
      console.log('신고 내용:', reportContent);

      // 모달 닫기 (선택적으로)
      $("#reportModal").css("display", "none");
    });

  })

  // 글쓰기 이동
  function moveToWriteBoard(boardType) {
     window.location.href = "/writeBoardView?boardType="+boardType;
  }

  // 검색
  let openSearch = function(menuBoardType) {
    let form = $("#moveForm");
    $("#menuBoardType").val(menuBoardType);
    $("#searchBoardTitle").val($("#searchTitle").val());

    form.attr("action", "/boardDetailList");
    form.submit();
  }

  // 신고학기
  let report = function(menuBoardType) {
    console.log("Asd");
  }

  // (관리자)게시물 삭제
  function deleteBoard(seq,boardType){
    let isConfirmed = confirm("삭제하시겠습니까?");
    if (isConfirmed) {
      $.ajax({
        type:"POST",
        url: "/deleteBoard",
        data: {boardSeq : seq},
        success: function () {
          alert("삭제 완료하였습니다.");
          let form = $("#moveForm");

          $("#boardNum").val(boardType);
          window.location.href = "/boardDetailList?menuBoardType="+boardType;
        }
      });
    } else {
      alert("삭제가 취소되었습니다.");
    }

  }

  // 비공개글 pass 체크
  function checkPassword(seq){

    let password = prompt("비밀번호를 입력하세요.");

    let boardSeq = seq

    $.ajax({
      type:"POST",
      url: "/boardPassword",
      data: {
        boardSeq : boardSeq
      },
      success: function (data) {
        if(password === data.password) {
          window.location.href = "/boardDetail?boardSeq=" + seq;
        } else if(password === null) {
          alert("취소되었습니다.");
          return false;
        } else {
          alert("비밀번호가 일치하지 않습니다.");
          return false;
        }
      }
    });

  }
</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>