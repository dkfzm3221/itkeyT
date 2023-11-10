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
                                <td colspan="3"><input type="text"
                                   class="form-control write-form" id="boardTitle"
                                   placeholder="제목을 작성해 주세요." name="boardTitle"></td>
                            </tr>
                            <tr>
                                <th class="padding-lg">작성자</th>
                                <td colspan="3">
                                    <input type="text" class="form-control write-form" id="boardWriter" placeholder="작성자" name="boardWriter">
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div class="detail-content">
                                        <textarea class="form-control write-form" rows="14"
                                                  id="contents" placeholder="내용을 작성해 주세요."
                                                  name="boardContents"></textarea>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
