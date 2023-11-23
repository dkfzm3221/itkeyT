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
                        <th style="text-align:center;width:200px;">배너/링크 ex)https://www.google.com</th>
                        <th style="text-align:center;width:200px;">저장/삭제</th>
                    </tr>
                    <c:forEach items="${bannerList}" var="item">
                    <tr>
                        <td><input type="text" class="form-control" name="bannerOrder" id="bannerOrder${item.bannerSeq}" placeholder="순번 입력" value="${item.bannerOrder}" ></td>
                        <td>
                            <input type="file" id="fileInput${item.bannerSeq}" class="form-control banner-image-input" onchange="previewImage(this)" name="file" placeholder="배너이미지 등록">
                            <c:if test="${empty item.fileIdx }">
                                이미지가 없습니다.
                            </c:if>
                            <c:if test="${not empty item.fileIdx }">
                                <img id="imgPreview${item.bannerSeq}" src="${item.filePath}" class="banner-image-preview"/>
                            </c:if>
                        </td>
                        <input type="hidden" name="fileIdx" id="fileIdx${item.bannerSeq}" value="${item.fileIdx}">
                        <input type="hidden" name="bannerSeq" id="boardSeq${item.bannerSeq}" value="${item.bannerSeq}">
                        <td><input type="text" class="form-control" id="bannerName${item.bannerSeq}" name="bannerName" placeholder="배너명 입력" value="${item.bannerName}"></td>
                        <td><input type="text" class="form-control" id="bannerUrl${item.bannerSeq}" name="bannerUrl" placeholder="배너/링크 입력 ex)https://www.google.com" value="${item.bannerUrl}"></td>
                        <td colspan="2"><button type="button" class="btn btn-success btn-lg" onclick="updateBanner(${item.bannerSeq});">저장</button>
                        <button style="float: right;" class="btn btn-warning btn-lg" onclick="removeSaveBanner(this, ${item.bannerSeq})">삭제</button></td>
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

        var bannerId = table.rows.length;

        cell1.innerHTML = '<input type="text" name="bannerOrder" id="bannerOrder' + bannerId + '" class="form-control" placeholder="순번 입력">';
        cell2.innerHTML = '<input type="file" id="fileInput' + bannerId + '" class="form-control banner-image-input" name="file" onchange="previewImage(this)" placeholder="배너이미지 등록">' +
            '<img id="imgPreview' + bannerId + '" class="banner-image-preview" />';
        cell3.innerHTML = '<input type="text" name="bannerName" id="bannerName' + bannerId + '" class="form-control" placeholder="배너명 입력">' +
            '<input type="hidden" name="fileIdx">';
        cell4.innerHTML = '<input type="text" name="bannerUrl" id="bannerUrl' + bannerId + '" class="form-control" placeholder="배너/링크 입력 ex)https://www.google.com">';
        cell5.innerHTML = '<td colspan="2"><button type="button" class="btn btn-success btn-lg" onclick="saveBanner(' + bannerId + ');">저장</button>'
            +'<button class="btn btn-warning btn-lg" onclick="removeBanner(this)">삭제</button><td>';
    }

    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                var imgId = '#imgPreview' + input.id.replace('fileInput', '');
                $(imgId).attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    function removeSaveBanner(btn, seq) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);

         console.log("ddd : " + seq)


        if(confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/removeBanner', // 요청을 보낼 URL
                type: 'POST',
                data: {"bannerSeq" : seq},
                success: function(data) {
                    location.reload();
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        }
    }


    function removeBanner(btn) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }

    function saveBanner(bannerId) {
        var formData = new FormData();
        var bannerOrder = $("#bannerOrder" + bannerId).val();
        if($("#fileInput"+ bannerId).val() != ""){
            var fileInput = document.getElementById("fileInput" + bannerId).files[0];
            formData.append("file", fileInput);
        }else{
            formData.append("file", "");
        }
        var bannerName = $("#bannerName" + bannerId).val();
        var bannerUrl = $("#bannerUrl" + bannerId).val();

        // FormData 객체 생성 및 데이터 추가

        formData.append("bannerOrder", bannerOrder);

        formData.append("bannerName", bannerName);
        formData.append("bannerUrl", bannerUrl);

        if(confirm("저장하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/saveBanner', // 요청을 보낼 URL
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    location.reload();
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        }
    }


    function updateBanner(bannerSeq) {
        var formData = new FormData();
        var bannerOrder = $("#bannerOrder" + bannerSeq).val();
        var bannerName = $("#bannerName" + bannerSeq).val();
        var bannerUrl = $("#bannerUrl" + bannerSeq).val();
        var fileIdx = $("#fileIdx" + bannerSeq).val();

        // FormData 객체 생성 및 데이터 추가
        formData.append("bannerOrder", bannerOrder);
        formData.append("bannerName", bannerName);
        formData.append("bannerUrl", bannerUrl);
        formData.append("bannerSeq", bannerSeq);
        formData.append("fileIdx", fileIdx);

        // 파일이 업로드된 경우에만 추가
        if ($("#fileInput" + bannerSeq).val() !== "") {
            var fileInput = document.getElementById("fileInput" + bannerSeq).files[0];
            formData.append("file", fileInput);
        }

        for (var pair of formData.entries()) {
            console.log(pair[0] + ', ' + pair[1]);
        }

        if(confirm("수정하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/saveBanner',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    location.reload();
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        }
    }





</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>