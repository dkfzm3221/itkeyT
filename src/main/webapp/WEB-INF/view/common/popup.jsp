<%--
        Created by IntelliJ IDEA.
        User: AHN
        Date: 2023-02-23
        Time: 오후 5:17
        To change this template use File | Settings | File Templates.
        --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
</head>
<body>

<%--<c:forEach items="${popupList}" var="item" varStatus="index">
    <meta charset="utf-8">
    <title>팝업창 띄우기 예제 - open()</title>
    &lt;%&ndash;        <meta name="author" content="wooin21">&ndash;%&gt;
    <meta name="author" content="${item.popupSeq}">
    <meta name="description" content="Popup by open() method">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="">
    <link rel="icon" type="image/x-icon" href="icon.gif"/>
    <input type="hidden" id="popupUrl" value="${item.popupUrl}">
    <input type="hidden" id="popupName" value="${item.popupName}">
    <input type="hidden" id="width" value="${item.width}">
    <input type="hidden" id="height" value="${item.height}">
    <input type="hidden" id="left" value="${item.left}">
    <input type="hidden" id="top" value="${item.top}">
    <input type="hidden" id="popupContent" value="${item.popupContents}">
    <input type="hidden" id="popupSeq" name="popupSeq" value="${item.popupSeq}">
</c:forEach>--%>
<c:forEach items="${popupList}" var="item" varStatus="index">
    <div class="popup-data"
         data-popup-url="${item.popupUrl}"
         data-popup-name="${item.popupName}"
         data-width="${item.width}"
         data-height="${item.height}"
         data-left="${item.left}"
         data-top="${item.top}"
         data-popup-content="${item.popupContents}"
         data-popup-seq="${item.popupSeq}">
    </div>
</c:forEach>

<script>
//  window.open("http://wooin21.net/", "wooin22", "width=450, height=600, left=120, top=100, scrollbars=no");
$(document).ready(function () {
/*
   //const popupContent = "text.";
   const popupContent = $("#popupContent").val();
   const width = $("#width").val();
   const left = $("#left").val();
   const top = $("#top").val();
   const height = $("#height").val();
   const popupName = $("#popupName").val();
   const popupSeq = $("#popupSeq").val();
   const popupUrl = $("#popupUrl").val();



// jQuery를 사용하여 새 창 열기
//   const popupWindow = window.open("", "wooin22", "width=450, height=600, left=120, top=100, scrollbars=no");
  const popupWindow = window.open(popupUrl, popupSeq, "width="+width+", height="+height+", left="+left+", top="+top+", scrollbars=no");
// 텍스트를 새 창에 쓰기
  $(popupWindow.document.body).html("<h3>" + popupName + "</h3>" + "<p>" + popupContent + "</p>");*/


  $(".popup-data").each(function () {
    const popupContent = $(this).data("popup-content");
    const width = $(this).data("width");
    const left = $(this).data("left");
    const top = $(this).data("top");
    const height = $(this).data("height");
    const popupName = $(this).data("popup-name");
    const popupSeq = $(this).data("popup-seq");
    const popupUrl = $(this).data("popup-url");

    const popupWindow = window.open(popupUrl, popupSeq, "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top + ", scrollbars=no");

    // 텍스트를 새 창에 쓰기
    $(popupWindow.document.body).html("<h3>" + popupName + "</h3>" + "<p>" + popupContent + "</p>");
  });

})



</script>
</body>
</html>