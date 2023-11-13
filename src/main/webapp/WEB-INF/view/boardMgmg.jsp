<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="common/contentHeader.jsp"/>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>



            <div class="main-content" xstyle="xwidth:1440px">
                <div class="row">
                    <div class="col-md-6 col-sm-8 clearfix">
                        <ul class="user-info pull-left pull-none-xsm">
                            <li class="profile-info dropdown">
                                <a><img src="/upload/member_photo/2023/20231006070720_8526245_128x128.png" alt="" class="img-circle" width="44" height="44">
                                    <strong>마스터</strong> 님</a>
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
                    <div class="col-md-6 col-sm-4 clearfix hidden-xs">
                        <ul class="list-inline links-list pull-right">
                            <li><a href="javascript:logout();">Log Out <i class="entypo-logout right"></i></a></li>
                            <li><a href="../" xtarget="_blank">사이트 메인<i class="entypo-home right"></i></a></li>
                        </ul>
                    </div>
                </div>


                <div style="margin:5px 0px;">
                    <div style="float:left;">
                        <a href="board_add.php" type="button" class="btn btn-success xbtn-sm"><i class="fa fa-plus"></i> 게시판 등록</a>
                        <a href="board_tag.php" type="button" class="btn btn-info xbtn-sm"><i class="fa fa-plus"></i> 태그 등록</a>
                        <a href="board_var.php" type="button" class="btn btn-info xbtn-sm"><i class="fa fa-plus"></i> 변수 등록</a>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
                <div class="box" style="margin-top:10px;">
                    <div class="box-body">
                        <fieldset>
                            <legend>검색</legend>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="search_form">
                                        <div class="col-md-3">
                                            <input type="text" class="form-control" name="search_word" autocomplete="off" onkeypress="if(event.keyCode==13){board_list(); return false;}" placeholder="게시판명">
                                        </div>
                                        <div class="col-md-1">
                                            <button type="button" onclick="board_list();" class="btn btn-primary" style="width:100%;"><i class="fa fa-search"></i> 검색
                                            </button></div>
                                    </form>
                                </div>
                            </div>
                        </fieldset>
                        <div class="text-right">
                            <a href="board_block_list.php" type="button" class="btn btn-danger"><i class="fa fa-bell-slash-o"></i> 신고/차단 리스트</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead id="board_list_thead">
                                <tr style="background-color:#F1F1F1;">
                                    <th style="text-align:center;width:70px">고유번호</th>
                                    <th style="text-align:center;xwidth:150px;">게시판명</th>
                                    <th style="text-align:center;xwidth:150px;">그룹명/정렬</th>
                                    <th style="text-align:center;xwidth:150px;">카테고리</th>
                                    <!--<th style="text-align:center;xwidth:200px;">권한</th>-->
                                    <th style="text-align:center;xwidth:100px;">게시판 타입</th>
                                    <th style="text-align:center;xwidth:100px;">관리자 전용</th>
                                    <th style="text-align:center;xwidth:100px;">썸네일</th>
                                    <th style="text-align:center;xwidth:100px;">페이지당 개수</th>
                                    <th style="text-align:center;xwidth:70px">정렬</th>
                                    <th style="text-align:center;xwidth:70px">게시글 수</th>
                                    <th style="text-align:center;xwidth:200px"><i class="fa fa-gear"></i></th>
                                </tr>
                                </thead>
                                <tbody id="board_list_tbody"><tr>		<td style="text-align:center;">93</td>		<td>사업분야</td>		<td>null / null</td>		<td>1:영상-음향<br>
                                    2:종합상황관제<br>
                                    3:영상감시솔루션<br>
                                    4:멀티디스플레이<br>
                                    5:통합제어시스템<br>
                                    6:LED전광판</td>		<td class="text-center">GALLERY2</td>		<td style="color:;">N</td>		<td>165 * 124</td>		<td>20</td>		<td>0</td>		<td>6</td>		<td style="text-align:center;padding:5px 0px;">			<a href="board_list.php?board_key=93" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>			<a href="board_write.php?board_key=93" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>			<a href="board_add.php?idx=93" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>			<button class="btn btn-sm btn-danger" onclick="board_del('93');"><i class="fa fa-eraser"></i> 삭제</button>		</td></tr><tr>		<td style="text-align:center;">92</td>		<td>주요구축사례</td>		<td>null / null</td>		<td></td>		<td class="text-center">GALLERY2</td>		<td style="color:;">N</td>		<td>165 * 125</td>		<td>20</td>		<td>0</td>		<td>2</td>		<td style="text-align:center;padding:5px 0px;">			<a href="board_list.php?board_key=92" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>			<a href="board_write.php?board_key=92" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>			<a href="board_add.php?idx=92" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>			<button class="btn btn-sm btn-danger" onclick="board_del('92');"><i class="fa fa-eraser"></i> 삭제</button>		</td></tr><tr>		<td style="text-align:center;">91</td>		<td>자료실</td>		<td>null / null</td>		<td></td>		<td class="text-center">GALLERY2</td>		<td style="color:;">N</td>		<td>165 * 125</td>		<td>10</td>		<td>0</td>		<td>1</td>		<td style="text-align:center;padding:5px 0px;">			<a href="board_list.php?board_key=91" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>			<a href="board_write.php?board_key=91" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>			<a href="board_add.php?idx=91" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>			<button class="btn btn-sm btn-danger" onclick="board_del('91');"><i class="fa fa-eraser"></i> 삭제</button>		</td></tr><tr>		<td style="text-align:center;">90</td>		<td>온라인문의</td>		<td>null / null</td>		<td></td>		<td class="text-center">NORMAL</td>		<td style="color:;">N</td>		<td>null * null</td>		<td>20</td>		<td>0</td>		<td>1</td>		<td style="text-align:center;padding:5px 0px;">			<a href="board_list.php?board_key=90" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>			<a href="board_write.php?board_key=90" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>			<a href="board_add.php?idx=90" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>			<button class="btn btn-sm btn-danger" onclick="board_del('90');"><i class="fa fa-eraser"></i> 삭제</button>		</td></tr><tr>		<td style="text-align:center;">89</td>		<td>공지사항</td>		<td>null / null</td>		<td></td>		<td class="text-center">NORMAL</td>		<td style="color:;">N</td>		<td>null * null</td>		<td>20</td>		<td>0</td>		<td>0</td>		<td style="text-align:center;padding:5px 0px;">			<a href="board_list.php?board_key=89" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>			<a href="board_write.php?board_key=89" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>			<a href="board_add.php?idx=89" class="btn btn-sm btn-success"><i class="fa fa-edit"></i> 수정</a>			<button class="btn btn-sm btn-danger" onclick="board_del('89');"><i class="fa fa-eraser"></i> 삭제</button>		</td></tr></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="box-footer clearfix text-center">
                        <ul class="pagination pagination-sm no-margin" id="board_list_pageing">
                            <ul class="pagination">
                                <li class="page-item active"><a href="javascript:void(0);" class="page-link">1</a></li>
                            </ul>
                        </ul>
                    </div>
                    <script type="text/javascript">
                        //게시판 리스트
                        var now_pg = 1;
                        function board_list(pg){
                            if(pg == undefined){
                                pg = now_pg;
                            }
                            else{
                                now_pg = pg;
                            }

                            var param = {
                                "callback"	: "board_list",
                                "pg"		: pg,
                                "list_size"	: 100,
                                "search"	: $("#search_form").serializeArray(),
                            };

                            $("#board_list_tbody").html("<tr><td colspan='"+$("#board_list_thead th").length+"' class='text-center'><img src='/img/loading.gif' /></td></tr>");
                            $("#board_list_pageing").html("");
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
                                $("#board_list_pageing").html(res.paging);
                            }, "json");
                        }

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


        </main>
    </div>
</div>
<script>
    function goLogin(){
        var adminId = $("#inputEmail").val();
        var adminPw = $("#inputPassword").val();

        if(adminId == ""){
            alert("아이디를 입력하세요.");
            $("#adminId").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(adminPw == ""){
            alert("비밀번호 입력하세요.");
            $("#adminPw").focus();
            return;
        }

        $.ajax({
            type : 'post',
            url : '/totalAdmin/login',
            data : {
                'id' : adminId,
                'password' : adminPw
            },
            success : function(data) {
                if (data == "W") {
                    window.location.href="/totalAdmin/mainAdmin";
                } else {
                    alert('아이디와 비밀번호를 확인 후 로그인해주세요.');
                    return false;
                }
            }
        });
    }
</script>
</body>
</html>