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
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<head>
    <title>Title</title>
</head>
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.3rem; font-weight: bold;">게시판 등록</h3></div>
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
                                <th class="padding-lg">게시판명</th>
                                <td colspan="3">
                                    <input type="text"
                                           class="form-control write-form" id="boardTitle"
                                           placeholder="제목을 작성해 주세요." name="boardTitle">
                                </td>
                            </tr>
                            <tr>
                                <th class="padding-lg">게시판 타입</th>
                                <td colspan="3">
                                    <select name="boardType" id="boardType" class="form-control">
                                        <option value="1">NORMAL</option>
                                        <option value="2">GALLERY2</option>
                                    </select>
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
    let boardType = $("#boardType").val();

    if (!boardTitle) {
        alert("제목을 입력해주세요.");
        return;
    }

    let isConfirmed = confirm("등록하시겠습니까?");

    if (isConfirmed) {
        $.ajax({
            type:"POST",
            url: "/adminWriteBoard",
            data: {boardTitle : boardTitle,
                boardType : boardType
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
