<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- Header -->
<jsp:include page="common/contentHeader.jsp"/>
<!-- Header END -->
<html lang="ko-kr">
<body>
<style>
    .custom-form-control {
        height: 50px;
        width: 70px;
    }
</style>
<div class="wrapper">
    <!-- SideBar Navbar  -->
    <jsp:include page="common/sidebarNav_admin.jsp"/>
    <!-- SideBar Navbar END  -->
    <div class="main-panel">
        <div class="container">
            <div class="main-content" xstyle="xwidth:1440px">
                <div class="row">
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-6">
                            <div class="card card-stats card-round">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box" style="margin-top:10px;">
                    <div class="box-body">
                        <div class="text-center" style="margin:10px 0px;">
                            <div class="btn btn-group">
                                <button type="button" class="btn btn-info btn-lg" onclick="addHistroy();"><i class="fa fa-plus"></i> 연혁 추가</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead id="history_list_thead">
                                <tr style="background-color:#F1F1F1;">
                                    <th style="text-align:center;width:60px">고유번호</th>
                                    <th style="text-align:center;width:70px">연도</th>
                                    <th style="text-align:center;width:70px">월</th>
                                    <th style="text-align:center;">내용</th>
                                    <th style="text-align:center;"><i class="fa fa-gear">수정</i></th>
                                </tr>
                                </thead>
                                <tbody id="history_list_tbody">
                                <c:forEach items="${historyList}" var="historyList" varStatus="index">
                                    <tr>
                                        <input type="hidden" id="year_${historyList.historySeq}" value="${historyList.year}"/>
                                        <input type="hidden" id="month_${historyList.historySeq}" value="${historyList.month}"/>
                                        <td style="text-align:center;">${historyList.historySeq}</td>
                                        <td>${historyList.year}</td>
                                        <td>${historyList.month}</td>
                                        <td>
                                                <input type="text" class="form-control" id="content_${historyList.historySeq}" placeholder="내용 입력" value="${historyList.content}"/>
                                        </td>
                                        <td style="text-align:center;width:200px">
                                            <button class="btn btn-sm btn-info" onclick="updateHistory(${historyList.historySeq});"><i class="fa fa-list"></i> 저장</button>
                                            <button class="btn btn-danger btn-sm" onclick="deleteHistory(${historyList.historySeq}, 'Y', this);"><i class="fa fa-list"></i> 삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var hisSeq = ${historySeq};

    <%-- /**
         *
         *
         *@author 이정후
         *@date 2023-11-29
         *@comment 연혁관리 추가
         *
         **/--%>
    function addHistroy() {
        hisSeq++;

        var tbody = document.getElementById("history_list_tbody"); // 테이블의 tbody 엘리먼트 가져오기

        var newRow = document.createElement("tr");

        var innerHTML = "";
        innerHTML += '<td style="text-align:center;width:60px">' + hisSeq + '</td>';
        innerHTML += '<td><input type="text" class="custom-form-control" id="year_' + hisSeq + '" placeholder="연도 입력" maxlength="4"></td>';
        innerHTML += '<td><input type="text" class="custom-form-control" id="month_' + hisSeq + '" placeholder="월 입력" maxlength="2"></td>';
        innerHTML += '<td><input type="text" class="form-control" id="content_' + hisSeq + '" placeholder="내용 입력"></td>';
        innerHTML += '<td style="text-align:center;width:200px">';
        innerHTML +=    '<button class="btn btn-sm btn-info" onclick="updateHistory(hisSeq);"><i class="fa fa-list"></i> 저장</button>';
        innerHTML +=    '<button class="btn btn-danger btn-sm" onclick="deleteHistory(hisSeq, \'N\', this);"><i class="fa fa-list"></i> 삭제</button>';
        innerHTML += '</td>';

        newRow.innerHTML = innerHTML;

        tbody.appendChild(newRow);
    }

    <%-- /**
       *
       *
       *@author 이정후
       *@date 2023-11-29
       *@comment 연혁관리 수정
       *
       **/--%>
    function updateHistory(hisSeq) {
        var content = $("#content_" + hisSeq).val();
        var year = $("#year_" + hisSeq).val();
        var month = $("#month_" + hisSeq).val();

        $.ajax({
            type: "POST",
            url: "/totalAdmin/upDateHistoryMgmt",
            data: {
                historySeq: hisSeq,
                year: year,
                month: month,
                content: content
            },
            success: function(response) {
                if (response === "S") {
                    alert("저장되었습니다.");
                    location.reload();
                } else {
                    alert("저장 실패하였습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    }

    <%-- /**
       *
       *
       *@author 이정후
       *@date 2023-11-29
       *@comment 연혁관리 삭제
       *
       **/--%>
    function deleteHistory(hisSeq, save, obj) {

        if(save == 'Y'){
            var content = $("#content_" + hisSeq).val();
            var year = $("#year_" + hisSeq).val();
            var month = $("#month_" + hisSeq).val();

            $.ajax({
                type: "POST",
                url: "/totalAdmin/upDateHistoryMgmt",
                data: {
                    historySeq: hisSeq,
                    useYn: "N",
                    year: year,
                    month: month,
                    content: content
                },
                success: function(response) {
                    if (response === "S") {
                        alert("삭제되었습니다.");
                        location.reload();
                    } else {
                        alert("삭제 실패하였습니다.");
                    }
                },
                error: function() {
                    alert("서버 오류가 발생했습니다.");
                }
            });
        } else {
            var delRow = $(obj).closest("tr");
            delRow.remove();
        }
    }
</script>


<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->

</body>
</html>