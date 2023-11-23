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
    <meta charset="utf-8">
    <title>팝업창 띄우기 예제 - open()</title>
    <meta name="author" content="wooin21">
    <meta name="description" content="Popup by open() method">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="">
    <link rel="icon" type="image/x-icon" href="icon.gif"/>

</head>
<body>
<script>
//  window.open("http://wooin21.net/", "wooin22", "width=450, height=600, left=120, top=100, scrollbars=no");
$(document).ready(function () {
  const popupContent = "text.";

// jQuery를 사용하여 새 창 열기
  const popupWindow = window.open("", "wooin22", "width=450, height=600, left=120, top=100, scrollbars=no");
// 텍스트를 새 창에 쓰기
  $(popupWindow.document.body).html("<p>" + popupContent + "</p>");
})


</script>
</body>
</html>