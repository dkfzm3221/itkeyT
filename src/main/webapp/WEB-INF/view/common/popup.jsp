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
<!-- /**
    *
    *@author 신금환
    *@date 2023-11-28
    *@comment 팝업 for문
    *
    **/-->
<c:forEach items="${popupList}" var="item" varStatus="index">
    <div class="popup-data"
         data-popup-url="${item.popupUrl}"
         data-popup-name="${item.popupName}"
         data-width="${item.width}"
         data-height="${item.height}"
         data-left="${item.left}"
         data-top="${item.top}"
         data-popup-seq="${item.popupSeq}"
         data-file-path="${item.filePath}"
         data-file-idx="${item.fileIdx}">
    </div>
</c:forEach>
<script>
//  window.open("http://wooin21.net/", "wooin22", "width=450, height=600, left=120, top=100, scrollbars=no");
$(document).ready(function () {
/**
   *
   *
   *
   *@author 신금환
   *@date 2023-11-28
   *@comment 팝업 오픈
   *
   **/
  $(".popup-data").each(function () {
    const width = $(this).data("width"); // 사이즈
    const left = $(this).data("left"); // 사이즈
    const top = $(this).data("top"); // 사이즈
    const height = $(this).data("height"); // 사이즈
    const popupName = $(this).data("popup-name"); // 팝업명
    const popupSeq = $(this).data("popup-seq"); // 팝업seq
    const popupUrl = $(this).data("popup-url"); // 팝업url
    const filePath = $(this).data("file-path"); //

    const popupWindow = window.open(popupUrl, popupSeq, "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top + ", scrollbars=no");

    const imageTag = "<img src='" + filePath +"'>";
    $(popupWindow.document.body).html("<h3>" + popupName + "</h3>" + "<p>" + imageTag + "</p>");
  });

})

</script>
</body>
</html>