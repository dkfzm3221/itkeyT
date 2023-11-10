<%--
  Created by IntelliJ IDEA.
  User: AHN
  Date: 2023-02-23
  Time: 오후 5:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en"><head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>ITKey</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" href="https://via.placeholder.com/50" type="image/x-icon"/>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <!-- Fonts and icons -->
    <script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: {"families":["Lato:300,400,700,900"]},
        custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../assets/css/fonts.min.css']},
        active: function() {
          sessionStorage.fonts = true;
        }
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/atlantis.css">

</head>
<body>

<script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/resources/assets/js/core/popper.min.js"></script>
<script src="/resources/assets/js/core/bootstrap.min.js"></script>
<script src="/resources/assets/js/atlantis.min.js"></script>
<!-- Sweet Alert -->
<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<script>
  //== Class definition
  var SweetAlert2Demo = function() {

    //== Demos
    var initDemos = function() {
      $('#alert_demo_7').click(function(e) {
        swal({
          text: "작성한 내용으로 정보가 등록됩니다.",
          type: 'warning',
          buttons:{
            confirm: {
              text : '확인',
              className : 'btn btn-success-c'
            },
            cancel: {
              text : '취소',
              visible: true,
              className: 'btn btn-danger-c'
            }
          }
        });
      });
    };


    return {
      //== Init
      init: function() {
        initDemos();
      },
    };
  }();

  //== Class Initialization
  jQuery(document).ready(function() {
    SweetAlert2Demo.init();
  });
</script>
</body>
</html>
