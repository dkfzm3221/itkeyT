<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="box-body">

                <div class="text-center" style="margin:10px 0px;">
                    <div class="btn btn-group">
                        <button type="button" class="btn btn-info btn-lg" onclick="addBanner();"><i class="fa fa-plus"></i> 배너 추가</button>
                        <button type="button" class="btn btn-success btn-lg" onclick="saveBanner();"><i class="fa fa-database"></i> 저장</button>
                    </div>
                </div>

                <div id="menu-box">
                </div>
            </div>
            <form action="/saveBanner" method="post" enctype="multipart/form-data" id="bannerForm">
                <table class="table table-bordered">
                    <tbody>
                    <tr style="background-color:#F1F1F1;" id="banner_list_thead">
                        <th style="text-align:center;width:70px">순번</th>
                        <th style="text-align:center;width:150px">배너 이미지</th>
                        <th style="text-align:center;width:150px;">배너명</th>
                        <th style="text-align:center;width:200px;">배너/링크</th>
                        <th style="text-align:center;width:150px"><i class="fa fa-gear"></i></th>
                    </tr>
                    <c:forEach items="${bannerList}" var="item">
                    <tr>
                        <td><input type="text" class="form-control" name="bannerOrder" placeholder="순번 입력" value="${item.bannerOrder}" ></td>
                        <td>
                            <input type="file" id="' + fileInputID + '" class="form-control banner-image-input" onchange="previewImage(this)" name="file" placeholder="배너이미지 등록">
                            <img id="' + fileInputID + 'Preview" src="../resources/images/${item.saveNm}" class="banner-image-preview"/>
                        </td>
                        <input type="hidden" name="fileIdx" value="${item.fileIdx}">
                        <td><input type="text" class="form-control" name="bannerName" placeholder="배너명 입력" value="${item.bannerName}"></td>
                        <td><input type="text" class="form-control" name="bannerUrl" placeholder="배너/링크 입력" value="${item.bannerUrl}"></td>
                        <td><button style="float: right;" class="btn-red" onclick="removeBanner(this)">배너 삭제</button></td>
                    </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
    function addBanner() {
        var table = document.getElementById('banner_list_thead').parentNode;
        var row = table.insertRow(-1);

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);

        var fileInputID = 'bannerImage' + table.rows.length;

        cell1.innerHTML = '<input type="text" name="bannerOrder" class="form-control" placeholder="순번 입력">';
        cell2.innerHTML = '<input type="file" id="' + fileInputID + '"' +
            'class="form-control banner-image-input" name="file" onchange="previewImage(this)" placeholder="배너이미지 등록">' +
            '<img id="' + fileInputID + 'Preview" class="banner-image-preview" />';
        cell3.innerHTML = '<input type="text" name="bannerName" class="form-control" placeholder="배너명 입력">' +
            '<input type="hidden" name="fileIdx" value="${item.fileIdx}">';
        cell4.innerHTML = '<input type="text" name="bannerUrl" class="form-control" placeholder="배너/링크 입력">';
        cell5.innerHTML = '<button style="float: right;" class="btn-red" onclick="removeBanner(this)">배너 삭제</button>';
    }

    function previewImage(input) {
        var preview = document.getElementById(input.id + 'Preview');

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    function removeBanner(btn) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }

    function saveBanner() {
        var formElement = document.getElementById("bannerForm");
        var formData = new FormData(formElement);

        $.ajax({
            url: '/totalAdmin/saveBanner',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
               // location.reload();
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    }



</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>