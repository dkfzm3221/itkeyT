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
                                    <!--<th style="text-align:center;xwidth:200px;">권한</th>-->
                                    <th style="text-align:center;xwidth:100px;">게시판 타입</th>
                                    <th style="text-align:center;xwidth:70px">게시글 수</th>
                                    <th style="text-align:center;xwidth:200px"><i class="fa fa-gear"></i></th>
                                </tr>
                                </thead>
                                    <tbody id="board_list_tbody">
                                        <c:forEach items="${adminBoardList}" var="item" varStatus="index">
                                            <tr>
                                                <td style="text-align:center;">${item.adminBoardNumber}</td>
                                                <td>${item.adminBoardName}</td>
                                                <td class="text-center">${item.boardType}</td>
                                                <td>${item.boardTypeCnt}</td>
                                                <td style="text-align:center;padding:5px 0px;">
                                                    <a href="board_list.php?board_key=${item.adminBoardNumber}" class="btn btn-sm btn-info"><i class="fa fa-list"></i> 리스트</a>
                                                    <a href="board_write.php?board_key=${item.adminBoardNumber}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> 글쓰기</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <script type="text/javascript">

                    </script>
                </div>

                <script>
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