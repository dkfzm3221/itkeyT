<%--
  Created by IntelliJ IDEA.
  User: dkfzm
  Date: 2023-02-09
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <meta property="og:image"
          content="resources/skin/seederp/assets/images/itkey_full_white_logo.png">
    <meta property="og:title" content="사람을 위한, 사람으로 인한 기업 아이티키 입니다.">

    <link rel="icon" href="/resources/skin/seederp/assets/images/favicon.ico">

    <title>ITKey</title>
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-core.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/skin/seederp/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/skin/seederp/assets/css/font-icons/entypo/css/entypo.css">
    <link rel="stylesheet" type="text/css"
          href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-core.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-theme.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-forms.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/custom.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">

    <meta charset='utf-8'>
    <style type="text/css">
        #calendar {
            font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
            font-size: 14px;
        }
    </style>



</head>
<body class="page-body xpage-fade skin-black" data-url="http://neon.dev">


<script>

    document.addEventListener('DOMContentLoaded', function () {
        $(function () {
            var request = $.ajax({
                url: "/calendar/view", // 변경하기
                method: "POST",
                dataType: "json"
            });

            request.done(function (data) {

                var calendarEl = document.getElementById('calendar');
                var inDtCalendar = data.inDtCalendar;

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridWeek',
                    headerToolbar: {
                        left: 'prev,next',
                        center: 'title'
                    },
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar
                    drop: function (arg) {
                        // is the "remove after drop" checkbox checked?
                        if (document.getElementById('drop-remove').checked) {
                            // if so, remove the element from the "Draggable Events" list
                            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                        }
                    },
                    events: inDtCalendar
                });

                calendar.render();
            });

            request.fail(function( jqXHR, textStatus ) {
                alert( "Request failed: " + textStatus );
            });
        });

    });



</script>

<div id="calendar"></div>


</body>


</html>