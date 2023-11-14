<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
            <div class="main-content" xstyle="xwidth:1440px">
                <div class="row">
                    <div class="col-md-6 col-sm-8 clearfix">
                        <ul class="user-info pull-left pull-none-xsm">
                            <li class="profile-info dropdown">
                                <a><strong>${sessionScope.admin.name} </strong> 님</a>
                            </li>
                        </ul>

                        <ul class="user-info pull-left pull-right-xs pull-none-xsm">

                            <!-- Message Notifications -->
                            <li class="notifications dropdown">

                                <!--<a href="?v=messageRecvList" xclass="dropdown-toggle" xdata-toggle="dropdown" xdata-hover="dropdown" xdata-close-others="true">
                                    <i class="entypo-mail"></i>
                                    <span class="badge badge-secondary">1234</span>
                                </a>-->
                            </li>

                        </ul>

                    </div>
                </div>


                <div style="margin:5px 0px;">
                    <div style="float:left;">
                        <a href="board_add.php" type="button" class="btn btn-success xbtn-sm"><i class="fa fa-plus"></i> 게시판 등록</a>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
                <div class="box" style="margin-top:10px;">
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead id="board_list_thead">
                                <tr style="background-color:#F1F1F1;">
                                    <th style="text-align:center;width:80px">고유번호</th>
                                    <th style="text-align:center;xwidth:150px;">게시판명</th>
                                    <th style="text-align:center;xwidth:150px;">카테고리</th>
                                    <!--<th style="text-align:center;xwidth:200px;">권한</th>-->
                                    <th style="text-align:center;xwidth:100px;">게시판 타입</th>
                                    <th style="text-align:center;xwidth:70px">게시글 수</th>
                                    <th style="text-align:center;xwidth:200px"><i class="fa fa-gear"></i></th>
                                </tr>
                                </thead>
                                    <tbody id="board_list_tbody">
                                        <c:forEach items="${boardList}" var="item" varStatus="index">
                                            <tr>
                                                <td style="text-align:center;">${item.boardSeq}</td>
                                                <td>${item.boardTitle}</td>
                                                <td>${item.boardCategory}</td>
                                                <td class="text-center">${item.boardType}</td>
                                                <td>${item.boardTypeCnt}</td>
                                                <td style="text-align:center;padding:5px 0px;">
                                                    <a href="board_list.php?board_key=${item.boardSeq}" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>
                                                    <a href="board_write.php?board_key=${item.boardSeq}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>
                                                    <a href="board_add.php?idx=${item.boardSeq}" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>
                                                    <button class="btn btn-sm btn-danger" onclick="board_del('${item.boardSeq}');"><i class="fa fa-eraser"></i> 삭제</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <script type="text/javascript">
                        //게시판 리스트
                        /*function board_list(){
                            var param = {
                                "callback"	: "board_list",
                                "list_size"	: 100,
                                "search"	: $("#search_form").serializeArray(),
                            };

                            $("#board_list_tbody").html("<tr><td colspan='"+$("#board_list_thead th").length+"' class='text-center'><img src='/img/loading.gif' /></td></tr>");
                            $.post("/act/?c=board&f=board_list", param, function(res){
                                //console.log(res);
                                var list = res.list;
                                var string = "";
                                for(var key in list){
                                    var row = list[key];

                                    var is_master_color = row['is_master'] == 'y' ? 'red' : '';

                                    string += "<tr>";
                                    string += "		<td style='text-align:center;'>"+row['idx']+"</td>";
                                    string += "		<td>"+row['name']+"</td>";
                                    string += "		<td>"+row['group_name']+" / "+row['group_sort']+"</td>";
                                    string += "		<td>"+row['category_str']+"</td>";
                                    //string += "		<td>"+row['auth_string']+"</td>";
                                    string += "		<td class='text-center'>"+row['list_type'].toUpperCase()+"</td>";
                                    string += "		<td style='color:"+is_master_color+";'>"+row['is_master'].toUpperCase()+"</td>";
                                    string += "		<td>"+row['thumb_width']+" * "+row['thumb_height']+"</td>";
                                    string += "		<td>"+row['list']+"</td>";
                                    string += "		<td>"+row['sort']+"</td>";
                                    string += "		<td>"+row['writ_cnt']+"</td>";
                                    string += "		<td style='text-align:center;padding:5px 0px;'>";
                                    string += "			<a href='board_list.php?board_key="+row['idx']+"' class='btn btn-sm btn-info'><i class='fa fa-list'></i> 리스트</a>";
                                    string += "			<a href='board_write.php?board_key="+row['idx']+"' class='btn btn-sm btn-primary'><i class='fa fa-edit'></i> 글쓰기</a>";
                                    string += "			<a href='board_add.php?idx="+row['idx']+"' class='btn btn-sm btn-success'><i class='fa fa-edit'></i> 수정</a>";
                                    string += "			<button class='btn btn-sm btn-danger' onclick=\"board_del('"+row['idx']+"');\"><i class='fa fa-eraser'></i> 삭제</button>";
                                    string += "		</td>";
                                    string += "</tr>";
                                }

                                if(string == ""){
                                    string = "<tr><td colspan='100' align='center'>데이터가 없습니다.</td></tr>";
                                }

                                $("#board_list_tbody").html(string);
                            }, "json");
                        }*/

                        $(document).ready(function(){
                            board_list(1);
                        });
                    </script>
                </div>

                <script>
                    //게시판 삭제
                    function board_del(idx){
                        if(confirm("삭제하시겠습니까?")){
                            $.post("/act/?c=board&f=board_del", { "idx" : idx }, function(res){
                                if(res.result){
                                    board_list();
                                }
                            }, "json");
                        }
                    }
                </script>
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

</body>
</html>