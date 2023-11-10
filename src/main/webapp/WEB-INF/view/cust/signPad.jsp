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
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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
    #signature {border: 1px solid #ddd;}
    #save, #clear,#markUp-button { padding:5px 20px; border:0; color:#fff; background:#000; margin-top:5px; }
    #file { display:none; }

  </style>


</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.4/dist/signature_pad.umd.min.js"></script>
<body class="page-body xpage-fade skin-black" data-url="http://neon.dev">

<div class="page-container">

  <div class="sidebar-menu">

    <div class="sidebar-menu-inner">

      <header class="logo-env">

        <!-- logo -->
        <div class="logo">
          <a href="..">
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
          <a href="?v=master">
            <i class="entypo-cog"></i>
            <span class="title">통합 관리자</span>
            <span class="badge badge-success badge-roundless">거래처 전용</span>
          </a>
        </li>
        <li class="xactive xopened xactive xhas-sub">
          <a href="?v=member_logout">
            <i class="entypo-logout"></i>
            <span class="title">로그아웃</span>
          </a>
        </li>
        <li class="xactive xopened xactive xhas-sub active">
          <a href="..">
            <i class="entypo-gauge"></i>
            <span class="title">대시보드</span>
          </a>
        </li>

        <li class="xactive xopened xactive xhas-sub ">
          <a href="?v=board_notice">
            <i class="entypo-info-circled"></i>
            <span class="title">공지사항</span>
          </a>
        </li>

        <li class="xactive xopened xactive xhas-sub ">
          <a href="?v=hello_info">
            <i class="entypo-user"></i>
            <span class="title">면접정보</span>
          </a>
        </li>
        <li class="has-sub ">
          <a href="#">
            <i class="entypo-vcard"></i>
            <span class="title">직원관리</span>
          </a>
          <ul>
            <li class="">
              <a href="?v=member_list_visit">
                <span class="title">방문 일정 관리</span>
              </a>
            </li>
            <li class="">
              <a href="?v=member_list_all">
                <span class="title">전체직원</span>
              </a>
            </li>
            <li class="">
              <a href="?v=member_list_go">
                <span class="title">투입현황</span>
              </a>
            </li>
            <li class="">
              <a href="?v=member_list_able">
                <span class="title">가용인력</span>
              </a>
            </li>
            <li class="">
              <a href="?v=member_list_out">
                <span class="title">퇴사자</span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0); json='{" name":"member_form"}'>
              <span class="title">직원등록</span>
              </a>
            </li>
          </ul>
        </li>

        <li class="xactive xopened xactive xhas-sub ">
          <a href="?v=cust_list_all">
            <i class="entypo-doc-text"></i>
            <span class="title">거래처 관리</span>
          </a>
        </li>

        <li class="has-sub ">
          <a href="#">
            <i class="entypo-newspaper"></i>
            <span class="title">프로젝트 관리</span>
          </a>
          <ul>
            <li class="">
              <a href="?v=project_list_ing">
                <span class="title">전체 프로젝트</span>
              </a>
            </li>
            <li class="">
              <a href="?v=project_list_ing&type=ing">
                <span class="title">진행 프로젝트</span>
              </a>
            </li>
            <li class="">
              <a href="?v=project_list_end">
                <span class="title">종료 프로젝트</span>
              </a>
            </li>
          </ul>
        </li>

        <li class="xactive xopened xactive xhas-sub ">
          <a href="?v=fortune_report">
            <i class="entypo-bag"></i>
            <span class="title">자산관리</span>
          </a>
        </li>

        <li class="has-sub ">
          <a href="#">
            <i class="entypo-mail"></i>
            <span class="title">메일링 관리</span>
          </a>
          <ul>
            <li class="">
              <a href="?v=mailing_all">
                <span class="title">전체 메일링</span>
              </a>
            </li>
            <li class="">
              <a href="?v=mailing_pay">
                <span class="title">급여명세서 메일링</span>
              </a>
            </li>
          </ul>
        </li>
        <li class="xactive xopened  xhas-sub">
          <a href="?v=config">
            <i class="entypo-cog"></i>
            <span class="title">기타 설정</span>
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
            <h4 class="modal-title"><strong style="font-size:20px;"
                                            id="cnt-title"></strong></h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table class="table xtable-striped table-bordered table-hover"
                         id="cnt_tbody"></table>
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
        <h3>이번달 현황(22-11-01 ~ 22-11-30)</h3>
        <div class="row">
          <div class="col-xs-6 col-md-3" style="cursor:pointer;">
            <div class="tile-stats tile-yellow">
              <div class="icon"><i class="entypo-users"></i></div>
              <div class="num" data-start="0" data-end="12" data-postfix=""
                   data-duration="1500" data-delay="0">
                <p>${empInfo.empNm}</p>
                <p>${pmInCnt}</p>
                <p>${pmOutCnt}</p>
                <p>${empInfo.empNm}</p>
                <p>${empInfo.empNm}</p>
                <c:forEach items="${pmInList}" var="pmInList">
                  <p>${pmInList.empNm}</p>
                  <p>${pmInList.prjNm}</p>
                  <p>${pmInList.inpDt}</p>
                  <p>${pmInList.outDt}</p>
                </c:forEach>


              </div>
              <h3>투입</h3>
            </div>
          </div>
          <div class="col-xs-6 col-md-3">
            <div class="tile-stats tile-red" style="cursor:pointer;">
              <div class="icon"><i class="entypo-chart-bar"></i></div>
              <div class="num" data-start="0" data-end="11" data-postfix=""
                   data-duration="1500" data-delay="600">11
              </div>
              <h3>철수</h3>
            </div>
          </div>
          <div class="col-xs-6 col-md-3">
            <div class="tile-stats tile-blue" style="cursor:pointer;">
              <div class="icon"><i class="entypo-rss"></i></div>
              <div class="num" data-start="0" data-end="5" data-postfix=""
                   data-duration="1500" data-delay="1800">5
              </div>
              <!--<h3>이번달 입사(전체)</h3>-->
              <h3>교육생 입사</h3>
            </div>
          </div>
          <div class="col-xs-6 col-md-3">
            <div class="tile-stats tile-blue" style="cursor:pointer;">
              <div class="icon"><i class="entypo-rss"></i></div>
              <div class="num" data-start="0" data-end="1" data-postfix=""
                   data-duration="1500" data-delay="1800">1
              </div>
              <!--<h3>이번달 입사(정규직)</h3>-->
              <h3>정규직 입사</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-md-3">
        <h3>전체 현황</h3>
        <div class="row">
          <div class="col-xs-12 col-md-12">
            <div class="tile-stats tile-aqua" style="cursor:pointer;">
              <div class="icon"><i class="entypo-mail"></i></div>
              <div class="num" data-start="0" data-end="69" data-postfix=""
                   data-duration="1500" data-delay="1200">69
              </div>
              <h3>프로젝트 진행</h3>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row" style="margin-top:20px;">
      <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
        <style type="text/css">
          #calendar {
            font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
            font-size: 14px;
          }
        </style>
        <div id="calendar"></div>
      </div>
      <div class="hidden-lg" style="margin:10px;">&nbsp;</div>
      <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
        <div class="col-md-12">
          <div class="panel minimal">

            <!-- panel head -->
            <div class="panel-heading">
              <div class="panel-title"><i class="entypo-user"></i> 대기자</div>

              <div class="panel-options">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab1" data-toggle="tab"
                                        aria-expanded="true">전체</a></li>
                  <li><a href="#tab_out" data-toggle="tab" aria-expanded="true">외부개발팀</a>
                  </li>
                  <li><a href="#tab_free" data-toggle="tab" aria-expanded="true">프리랜서</a>
                  </li>
                  <li><a href="#tab_subcon" data-toggle="tab"
                         aria-expanded="true">외주개발</a></li>
                </ul>
              </div>
            </div>

            <!-- panel body -->
            <div class="panel-body">
              <div class="tab-content">
                <div class="tab-pane active text-center" id="main_emp_list"
                     xid="tab1">
                  <div class="row">
                    <div class="col-md-12 text-right">
                      <div class="btn-group">
                        <button type="button" class="btn btn-blue"
                                json='{"name":"member_form","getParameter":{"mem_idx":""}}'>
                          <i class="entypo-user-add"></i> 직원등록
                        </button>
                      </div>
                    </div>
                    <div class="col-md-12 text-left">
                      <form name="member_list_main_search"
                            id="member_list_main_search" class="form-inline">
                        <input type="hidden" name="depart_sub" value=""/>
                        <select name="search_type" class="form-control"
                                style="margin:2px 0px;">
                          <option value="">--- 전체 ---</option>
                          <option value="name">이름</option>
                          <option value="number">사원번호</option>
                          <option value="hphone">휴대폰</option>
                          <option value="email">이메일</option>
                        </select>
                        <input type="text" name="search_word"
                               class="form-control" return false;}"
                        placeholder="검색어 입력" style="margin:2px 0px;" />
                        <button type="button" class="btn btn-primary"><i
                                class="entypo-search"></i>검색
                        </button>
                      </form>
                    </div>
                  </div>
                  <div class="row text-center" id="member_list_main_box"
                       style="margin-top:10px;"></div>
                  <div class="row text-center" id="member_list_main_paging"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="wrapper">
      <canvas id="signature" width="600" height="200"></canvas>
    </div>
    <button id="save">Save</button>
    <button id="clear">Clear</button>
    <input type="file" id="file" name="file" onChange="markUpload(this)"/>
    <button type="button" id="markUp-button">Mark</button>

    <img id="sampleImg">
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
</body>
<script>
  $(document).ready(function ()
  {
    var canvas = $("#signature")[0];
    var signature = new SignaturePad(canvas, {
      minWidth: 5,
      maxWidth: 10,
      backgroundColor: 'rgb(255, 255, 255, 0)',
      penColor: "rgb(0, 0, 0)"
    });

    $("#clear").on("click", function () {
      signature.clear();
    });

    $("#save").on("click", function () {
      if (signature.isEmpty()) {
        alert("내용이 없습니다.");
      } else {
        var dataUrl = signature.toDataURL("image/png");
        $.ajax({
          type: "POST",
          url: "cust/test",
          data: {
            base64Sign: dataUrl
          },
          success: function (data) {
            alert("성공");
          },
          error: function () {
            alert("error");
          }
        });

      }


    });

    $('#markUp-button').click(function (e) {
      e.preventDefault(); //창 이벤트 새로고침 방지
      $('#file').click();
    });

  });

  function markUpload(obj){
    //alert("파일 value"+obj.value);
    //var form = $('#file')[0].files[0];

    var form = obj.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(form);

    reader.onload = function () {
      console.log(reader.result);
      var dataUrl = reader.result;
      $.ajax({
        type: "POST",
        url: "cust/test",
        data: {
          base64Mark: dataUrl
        },
        success: function (data) {
          alert("성공");
        },
        error: function () {
          alert("실패");
        }
      });
    };
    reader.onerror = function (error) {
      console.log('Error: ', error);
    };

  }


</script>
</html>