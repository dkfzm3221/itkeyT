<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">이번달 현황(23-02-01 ~ 23-02-28)</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body text-center" onclick="show_cnt_list('전체진행');">
                                        <div class="numbers">
                                            <h4 class="card-title">프로젝트 진행</h4>
                                            <div class="num icon-big" style="color: #1572E8; font-weight: 600;" data-start="0" data-end="0" data-postfix="" data-duration="1500" data-delay="1200">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="card card-stats card-round">
                                    <div class="card-body text-center" onclick="show_cnt_list('철수');">
                                        <div class="numbers">
                                            <h4 class="card-title">철수</h4>
                                            <div class="num icon-big" style="color: #f56954; font-weight: 600;" data-start="0" data-end="0" data-postfix="" data-duration="1500" data-delay="600">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card-title"><h3 style="font-size: 1.1rem;">전체 현황</h3></div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card card-stats card-round" style="background: #657686;">
                                    <div class="card-body text-center">
                                        <div class="numbers">
                                            <h4 class="card-title" style="color: #fff;">프로젝트 등록</h4>
                                            <div class="num icon-big" style="font-weight: 600; color: #fff;">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="card card-stats card-round" style="background: #657686;">
                                    <div class="card-body text-center">
                                        <div class="numbers">
                                            <h4 class="card-title" style="color: #fff;">이력 요청</h4>
                                            <div class="num icon-big" style="font-weight: 600; color: #fff;">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-header mb-4 pb-2" style="padding: 0;">
                                    <div class="card-title">이달 총 매출 : 1,000,000,000 원</div>
                                </div>

                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Calendar info Modal -->
<div class="modal fade" id="cld-info-Modal">
    <div class="modal-xl modal-dialog2 modal-dialog2-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><strong>홍길동</strong> 님 프로젝트 이력사항</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="img-profile"></div>

                <div class="project-info">
                    <table class="text-center">
                        <tr>
                            <th>프로젝트</th>
                            <td>영등포 한국전력 프로젝트</td>
                        </tr>

                        <tr>
                            <th>연차</th>
                            <td>2년 3개월</td>
                        </tr>

                        <tr>
                            <th>지역</th>
                            <td>인천</td>
                        </tr>

                        <tr>
                            <th>기간</th>
                            <td>21-12-31 ~ 22-12-31</td>
                        </tr>

                        <tr>
                            <th>단가</th>
                            <td>8,000,000</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
<script>
  /* initialize the calendar
  -----------------------------------------------------------------*/
  $(document).ready(function () {
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var className = Array('fc-primary', 'fc-danger', 'fc-black', 'fc-success', 'fc-info', 'fc-warning', 'fc-danger-solid', 'fc-warning-solid', 'fc-success-solid', 'fc-black-solid', 'fc-success-solid', 'fc-primary-solid');

    $calendar = $('#calendar');
    $calendar.fullCalendar({
      header: {
        left: 'prev,next',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      selectable: true,
      selectHelper: true,
      select: function (start, end) {

        // on select we show the Sweet Alert modal with an input
        swal({
          title: 'Create an Event',
          html: '<br><input class="form-control" placeholder="Event Title" id="input-field">',
          content: {
            element: "input",
            attributes: {
              placeholder: "Event Title",
              type: "text",
              id: "input-field",
              className: "form-control"
            },
          },
          buttons: {
            cancel: true,
            confirm: true,
          },
        }).then(
            function () {
              var eventData;
              var classRandom = className[Math.floor(Math.random() * className.length)];
              event_title = $('#input-field').val();

              if (event_title) {
                eventData = {
                  title: event_title,
                  start: start,
                  className: classRandom,
                  end: end
                };
                $calendar.fullCalendar('renderEvent', eventData, true); // stick? = true
              }

              $calendar.fullCalendar('unselect');
            }
        );
      },
      events: [
        {
          title: 'All Day Event',
          start: new Date(y, m, 1),
          className: 'fc-black'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d - 3, 16, 0),
          allDay: false,
          className: 'fc-warning'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d + 4, 16, 0),
          allDay: false,
          className: 'fc-info'
        },
        {
          title: 'Meeting',
          start: new Date(y, m, d, 10, 30),
          allDay: false,
          className: 'fc-danger'
        },
        {
          title: 'Lunch',
          start: new Date(y, m, d, 12, 0),
          end: new Date(y, m, d, 14, 0),
          allDay: false,
          className: 'fc-primary',
          description: 'Eat Bro'
        },
        {
          title: 'Meeting',
          start: new Date(y, m, d + 3, 13, 30),
          allDay: false,
          className: 'fc-primary-solid',
          description: 'Meeting'
        },
        {
          title: 'Birthday Party',
          start: new Date(y, m, d + 1, 19, 0),
          end: new Date(y, m, d + 1, 22, 30),
          allDay: false,
          className: 'fc-success',
          description: 'Coba Googling dulu'
        },
        {
          title: 'Lunch',
          start: new Date(y, m, d + 6, 13, 30),
          allDay: false,
          className: 'fc-success-solid',
          description: 'Lunch'
        },
        {
          title: 'Click for Google',
          start: new Date(y, m, 28),
          end: new Date(y, m, 29),
          allDay: false,
          url: 'http://google.com/',
          className: 'fc-info-solid',
        }
      ],

    });
  });
</script>
</body>
</html>