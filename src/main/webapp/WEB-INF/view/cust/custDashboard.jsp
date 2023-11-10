<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/resources/skin/seederp/assets/css/font-icons/entypo/css/entypo.css">
    <link rel="stylesheet" type="text/css"
          href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-core.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-theme.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/neon-forms.css">
    <link rel="stylesheet" type="text/css" href="/resources/skin/seederp/assets/css/custom.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>
    <style type="text/css">

        /*
        .disabledTab{
            pointer-events: none;
        }
        */
        /*미니 달력 center*/
        #datepicker-container {
            text-align: center;
        }

        #datepicker-center {
            display: inline-block;
            margin: 0 auto;
        }

        /*
        //bootstrap modal height center
        .modal {
            text-align: center;
        }

        @media screen and (min-width: 768px) {
            .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
            }
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }
        */

        th {
            background-color: #f1f1f1;
            vertical-align: middle !important
        }

        td {
            vertical-align: middle !important
        }

        .custom_radio {
            width: 15px;
            height: 15px;
            vertical-align: -3px;
        }

        fieldset {
            border: 1px solid #ddd !important;
            margin: 0;
            xmin-width: 0;
            padding: 10px;
            position: relative;
            border-radius: 4px;
            background-color: #f5f5f5;
            padding-left: 10px !important;
        }

        legend {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 0px;
            width: 35%;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px 5px 5px 10px;
            background-color: #ffffff;
        }

        img {
            max-width: 100%;
        }

    </style>
</head>

<body class="page-body xpage-fade skin-black" data-url="http://neon.dev">
<script>

</script>
<div class="page-container">
    <div class="sidebar-menu">

        <div class="sidebar-menu-inner">

            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href="/cust/dashboard">
                        <img src="/resources/skin/seederp/assets/images/itkey_logo_220603.png"
                             width="170" alt=""/>
                    </a>
                </div>
                <div class="sidebar-collapse left_toggle">
                    <a href="#" class="sidebar-collapse-icon">
                        <i class="entypo-menu"></i>
                    </a>
                </div>
                <div class="sidebar-mobile-menu visible-xs left_toggle">
                    <a href="#" class="with-animation">
                        <i class="entypo-menu"></i>
                    </a>
                </div>

            </header>

            <div class="sidebar-user-info">

                <div class="sui-normal">
                    <a href="javascript:void(0)"
                       json='{"name":"member_form","getParameter":{"mem_idx":"1"}}'
                       class="user-link" style="cursor:pointer;">
                        <img src="/resources/upload/member/2022/20220615040944_3390424.jpg"
                             style="height:50px;" alt="김성수" class="img-circle"/>
                        <span>${pm}.</span>
                        <strong>김성수 님</strong>
                    </a>
                </div>

            </div>

            <ul id="main-menu" class="main-menu">
                <li class="xactive xopened xactive xhas-sub">
                    <a href="?v=member_logout">
                        <i class="entypo-logout"></i>
                        <span class="title">로그아웃</span>
                    </a>
                </li>
                <li class="xactive xopened xactive xhas-sub active">
                    <a href="/cust/dashboard">
                        <i class="entypo-gauge"></i>
                        <span class="title">대시보드</span>
                    </a>
                </li>
                <li class="xactive xopened  xhas-sub">
                    <a href="/cust/available">
                        <i class="entypo-cog"></i>
                        <span class="title">가용인력</span>
                    </a>
                </li>
                <li class="xactive xopened xactive xhas-sub ">
                    <a href="/cust/manpowerSearch">
                        <i class="entypo-info-circled"></i>
                        <span class="title">인력검색</span>
                    </a>
                </li>

                <li class="xactive xopened xactive xhas-sub ">
                    <a href="?v=hello_info">
                        <i class="entypo-user"></i>
                        <span class="title">계약관리</span>
                    </a>
                </li>
                <li class="xactive xopened xactive xhas-sub ">
                    <a href="?v=cust_list_all">
                        <i class="entypo-doc-text"></i>
                        <span class="title">개발자 이슈</span>
                    </a>
                </li>

                <li class="xactive xopened xactive xhas-sub ">
                    <a href="?v=fortune_report">
                        <i class="entypo-bag"></i>
                        <span class="title">위탁교육</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <div class="modal fade custom-width" aria-hidden="true" id="this-month-in">
            <div class="modal-dialog" xstyle="min-width:60%;">
                <div class="modal-content" style="border:1px solid #000;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title"><strong style="font-size:20px;" id="cnt-title"></strong></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table xtable-striped table-bordered table-hover" id="cnt_tbody">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                    class="fa fa-close"></i> 닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 col-md-9">
                <div class="row">
                    <div class="col-xs-6 col-md-3">
                        <div class="tile-stats tile-blue" style="cursor:pointer;">
                            <div class="icon"><i class="entypo-rss"></i></div>
                            <div class="num" data-start="0" data-end="5" data-postfix="" data-duration="1500" data-delay="1800">
                            </div>
                            <h3 id="inputManpower">프로젝트 투입인원 ${inputManpowerCount} 명</h3>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="tile-stats tile-blue" style="cursor:pointer;">
                            <div class="icon"><i class="entypo-rss"></i></div>
                            <div class="num" data-start="0" data-end="1" data-postfix="" data-duration="1500" data-delay="1800">
                            </div>
                            <h3 id="evacuationManpower">철수 ${evacuationManpowerCount} 명</h3>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="tile-stats tile-blue" style="cursor:pointer;">
                            <div class="icon"><i class="entypo-rss"></i></div>
                            <div class="num" data-start="0" data-end="1" data-postfix="" data-duration="1500" data-delay="1800">
                            </div>
                            <h3>프로젝트 등록건수 ${projectCount} 건</h3>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="tile-stats tile-blue" style="cursor:pointer;">
                            <div class="icon"><i class="entypo-rss"></i></div>
                            <div class="num" data-start="0" data-end="1" data-postfix="" data-duration="1500" data-delay="1800">
                            </div>
                            <h3>철수예정인력 ${withdrawalScheduledCount} 명</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top:20px;">
<%--            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <style type="text/css">
                  #calendar {
                    font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
                    font-size: 14px;
                  }
                </style>

            </div>--%>
            <div class="hidden-lg" style="margin:10px;">&nbsp;</div>
            <%@ include file="/WEB-INF/view/calendar/calendar.jsp" %>
            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-12">
                    <div class="panel minimal">
                        <!-- panel body -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div class="tab-pane active text-center" id="main_emp_list"
                                     xid="tab1">
                                    <%--<div class="row">
                                        <div class="col-md-12 text-left">
                                            <form name="member_list_main_search" id="member_list_main_search" class="form-inline">
                                                <select name="type" class="form-control" style="margin:2px 0px;">
                                                    <option value="all">--- 전체 ---</option>
                                                    <option value="name">이름</option>
                                                    <option value="number">사원번호</option>
                                                    <option value="hphone">휴대폰</option>
                                                    <option value="email">이메일</option>
                                                </select>
                                                <input type="text" name="keyword" value="${search.keyword}" id="searchBox" class="form-control" placeholder="검색어 입력" style="margin:2px 0px;"/>
                                                <button type="submit" class="btn btn-primary" id="doSearch"><i class="entypo-search"></i>
                                                    검색
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row text-center" id="member_list_main_box" style="margin-top:10px;">
                                        <table class="table xtable-striped table-bordered table-hover" >
                                            <tbody>
                                            <th class=""><strong>상세</strong></th>
                                            <th class=""><strong>이름</strong></th>
                                            <th class=""><strong>연차</strong></th>
                                            <th class=""><strong>스킬</strong></th>
                                            <th class=""><strong>인터뷰 가능 일자</strong></th>
                                            <th class=""><strong>투입 가능 일자</strong></th>

                                            <c:forEach items="${ableList}" var="employee">
                                                <tr class="tBody" >
                                                    <td>돋보기~!</td>
                                                    <td>${employee.empNm}</td> &lt;%&ndash;이름&ndash;%&gt;
                                                    <c:choose>
                                                        <c:when test="${employee.workYF == 0 && employee.workMF != null}">
                                                            <td>${employee.workMF}개월</td>&lt;%&ndash;연차&ndash;%&gt;
                                                        </c:when>
                                                        <c:when test="${employee.workMF == null && employee.workYF != null}">
                                                            <td>${employee.workYF}년</td>&lt;%&ndash;연차&ndash;%&gt;
                                                        </c:when>
                                                        <c:when test="${employee.workMF == null && employee.workYF == null}">
                                                            <td>-</td>&lt;%&ndash;연차&ndash;%&gt;
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>${employee.workYF}년 ${employee.workMF}개월</td>&lt;%&ndash;연차&ndash;%&gt;
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td>${employee.skill}</td>
                                                    <td>${employee.intrvDt}</td>&lt;%&ndash;인터뷰 가능일자&ndash;%&gt;
                                                    <td>${employee.ableDt}</td> &lt;%&ndash;투입가능일자&ndash;%&gt;
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        &lt;%&ndash;페이징 인클루드&ndash;%&gt;
                                        <%@ include file="/WEB-INF/view/common/paging.jsp" %>
                                    </div>
                                    <div class="row text-center" id="member_list_main_paging">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
        <!-- Footer -->
        <footer class="main">

            &copy; 2022 <strong>ITKey</strong> Corp. <a href="http://itkey.co.kr" target="_blank">http://itkey.co.kr</a>

        </footer>
    </div>
</div>


<link href="/resources/css/loading.css" rel="stylesheet"/>
<div style="display:none;position:fixed;_position:absolute;top:0;left:0;z-index:100000000000000000;width:100%;height:100%"
     id="fog">
    <div style="position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.1;filter:alpha(opacity=10)"></div>
    <div style="position:absolute;top:47%;text-align:center;width:100%;">
        <div id="fountainG">
            <div id="fountainG_1" class="fountainG"></div>
            <div id="fountainG_2" class="fountainG"></div>
            <div id="fountainG_3" class="fountainG"></div>
            <div id="fountainG_4" class="fountainG"></div>
            <div id="fountainG_5" class="fountainG"></div>
            <div id="fountainG_6" class="fountainG"></div>
            <div id="fountainG_7" class="fountainG"></div>
            <div id="fountainG_8" class="fountainG"></div>
        </div>
        <div id="fog-msg"></div>
    </div>
</div>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar/index.global.min.js'></script>
<script>
  $("#inputManpower").on("click", function(){
        location.href="/cust/available"
  })

  $("#evacuationManpower").on("click", function (){
      location.href="/cust/available"
  })


</script>





</body>
</html>