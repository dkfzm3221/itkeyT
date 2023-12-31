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
                        <button type="button" class="btn btn-info btn-lg" onclick="addPopup();"><i class="fa fa-plus"></i>팝업 추가</button>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <tbody>
                <tr style="background-color:#F1F1F1;" id="popup_list_thead">
                    <th style="text-align:center;width:150px;">팝업명</th>
                    <th style="text-align:center;width:400px;">팝업내용</th>
                    <th style="text-align:center;width:200px;">팝업URL ex)https://www.google.com</th>
                    <th style="text-align:center;width:150px;">width</th>
                    <th style="text-align:center;width:150px;">height</th>
                    <th style="text-align:center;width:150px;">left</th>
                    <th style="text-align:center;width:150px;">top</th>
                    <th style="text-align:center;width:150px;"></th>
                </tr>
                <c:forEach items="${popupList}" var="item">
                    <tr>
                        <td><input type="text" class="form-control" id="popupName${item.popupSeq}" name="popupName" placeholder="팝업명" value="${item.popupName}"></td>
                        <td>
                            <input type="file" id="fileInput${item.popupSeq}" class="form-control banner-image-input" onchange="previewImage(this)" name="file" placeholder="배너이미지 등록">
                            <c:if test="${empty item.fileIdx}">
                                이미지가 없습니다.
                            </c:if>
                            <c:if test="${not empty item.fileIdx}">
                                <img id="imgPreview${item.popupSeq}" src="${item.filePath}" class="banner-image-preview"/>
                            </c:if>
                        </td>
                        <td><input type="text" class="form-control" id="popupUrl${item.popupSeq}" name="popupUrl" placeholder="팝업URL" value="${item.popupUrl}"></td>
                        <td><input type="text" class="form-control" id="width${item.popupSeq}" name="width" placeholder="width" value="${item.width}"></td>
                        <td><input type="text" class="form-control" id="height${item.popupSeq}" name="height" placeholder="height" value="${item.height}"></td>
                        <td><input type="text" class="form-control" id="left${item.popupSeq}" name="left" placeholder="left" value="${item.left}"></td>
                        <td><input type="text" class="form-control" id="top${item.popupSeq}" name="top" placeholder="right" value="${item.top}"></td>
                        <input type="hidden" class="form-control" id="popupSeq" name="popupSeq" value="${item.popupSeq}">
                        <td colspan="2"><button style="float: right;" class="btn btn-success btn-lg" onclick="updatePopup(${item.popupSeq})">저장</button>
                        <button style="float: right;" class="btn btn-warning btn-lg" onclick="removeSavePopup(this, ${item.popupSeq})">삭제</button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>

    <%-- /**
     *
     *
     *@author 김재섭
     *@date 2023-11-23
     *@comment 팝업 추가 버튼 클릭시 html 추가
     *
     **/--%>

    function addPopup() {
        var table = document.getElementById('popup_list_thead').parentNode;
        var row = table.insertRow(-1);

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);
        var cell8 = row.insertCell(7);

        var popupId = table.rows.length;

        cell1.innerHTML = '<input type="text" class="form-control" id="popupName' + popupId + '" name="popupName" placeholder="팝업명">';
        cell2.innerHTML = '<input type="file" id="fileInput' + popupId + '" class="form-control banner-image-input" name="file" onchange="previewImage(this)" placeholder="배너이미지 등록">' +
            '<img id="imgPreview' + popupId + '" class="banner-image-preview" />';
        cell3.innerHTML = '<input type="text" class="form-control" id="popupUrl' + popupId + '" name="popupUrl" placeholder="팝업URL">';
        cell4.innerHTML = '<input type="text" class="form-control" id="width' + popupId + '" name="width" placeholder="width">';
        cell5.innerHTML = '<input type="text" class="form-control" id="height' + popupId + '" name="height" placeholder="height">';
        cell6.innerHTML = '<input type="text" class="form-control" id="left' + popupId + '" name="left" placeholder="left">';
        cell7.innerHTML = '<input type="text" class="form-control" id="top' + popupId + '" name="top" placeholder="top">';
        cell8.innerHTML = '<td colspan="2">' +
            '<button style="float: right;" class="btn btn-success btn-lg" onclick="savePopup(' + popupId + ')">저장</button>' +
            '<button style="float: right;" class="btn btn-warning btn-lg" onclick="removePopup(this)">삭제</button>' +
            '</td>';
    }

    function removePopup(btn) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }


    <%-- /**
     *
     *
     *@author 김재섭
     *@date 2023-11-23
     *@comment 팝업 저장
     *
     **/--%>

    function savePopup(popupId) {

        var formData = new FormData();
        var popupName = $("#popupName" + popupId).val();
        var popupUrl = $("#popupUrl" + popupId).val();
        var width = $("#width" + popupId).val();
        var height = $("#height" + popupId).val();
        var left = $("#left" + popupId).val();
        var top = $("#top" + popupId).val();

        if(width == ""){
            alert("width를 입력해주세요.");
            return false;
        }
        if(height == ""){
            alert("height를 입력해주세요.");
            return false;
        }
        if(left == ""){
            alert("left를 입력해주세요.");
            return false;
        }
        if(top == ""){
            alert("top을 입력해주세요.");
            return false;
        }

        // FormData 객체 생성 및 데이터 추가
        formData.append("popupName", popupName);
        formData.append("popupUrl", popupUrl);
        formData.append("width", width);
        formData.append("height", height);
        formData.append("left", left);
        formData.append("top", top);
        if($("#fileInput"+ popupId).val() != ""){//이미지 없을시 처리
            var fileInput = document.getElementById("fileInput" + popupId).files[0];
            formData.append("file", fileInput);
        }else{
            formData.append("file", "");
        }


        if(confirm("저장하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/savePopup', // 요청을 보낼 URL
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


    <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 이미지 미리보기
       *
       **/--%>
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


    <%-- /**
       *
       *
       *@author 김재섭
       *@date 2023-11-23
       *@comment 팝업 수정
       *
       **/--%>
    function updatePopup(popupSeq) {
        var formData = new FormData();
        var popupName = $("#popupName" + popupSeq).val();
        var popupContents = $("#popupContents" + popupSeq).val();
        var popupUrl = $("#popupUrl" + popupSeq).val();
        var width = $("#width" + popupSeq).val();
        var height = $("#height" + popupSeq).val();
        var left = $("#left" + popupSeq).val();
        var top = $("#top" + popupSeq).val();

        if(width == ""){
            alert("width를 입력해주세요.");
            return false;
        }
        if(isNaN(width)){
            alert("숫자만 입력 가능합니다.");
            return false;
        }

        if(height == ""){
            alert("height를 입력해주세요.");
            return false;
        }
        if(isNaN(height)){
            alert("숫자만 입력 가능합니다.");
            return false;
        }

        if(left == ""){
            alert("left를 입력해주세요.");
            return false;
        }
        if(isNaN(left)){
            alert("숫자만 입력 가능합니다.");
            return false;
        }

        if(top == ""){
            alert("top을 입력해주세요.");
            return false;
        }
        if(isNaN(top)){
            alert("숫자만 입력 가능합니다.");
            return false;
        }

        // 파일이 업로드된 경우에만 추가
        if ($("#fileInput" + popupSeq).val() !== "") {
            var fileInput = document.getElementById("fileInput" + popupSeq).files[0];
            formData.append("file", fileInput);
        }


        // FormData 객체 생성 및 데이터 추가
        formData.append("popupName", popupName);
        formData.append("popupContents", popupContents);
        formData.append("popupUrl", popupUrl);
        formData.append("width", width);
        formData.append("height", height);
        formData.append("left", left);
        formData.append("top", top);
        formData.append("popupSeq", popupSeq);


        if(confirm("수정하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/updatePopup',
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


    <%-- /**
      *
      *
      *@author 김재섭
      *@date 2023-11-23
      *@comment 저장된 팝업 삭제
      *
      **/--%>
    function removeSavePopup(btn, seq) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);

        if(confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                url: '/totalAdmin/removePopup', // 요청을 보낼 URL
                type: 'POST',
                data: {"popupSeq" : seq},
                success: function(data) {
                    location.reload();
                },
                error: function(error) {
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