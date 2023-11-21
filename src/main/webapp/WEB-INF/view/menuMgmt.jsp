<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <div class="box-body">

                <div class="text-center" style="margin:10px 0px;">
                    <div class="btn btn-group">
                        <button type="button" class="btn btn-info btn-lg" onclick="create_box();"><i class="fa fa-plus"></i> 메뉴 추가
                        </button><button type="button" class="btn btn-success btn-lg" onclick="menu_save();"><i class="fa fa-database"></i> 저장</button>
                    </div>
                </div>

                <table class="table table-bordered">
                    <tr style="background-color:#F1F1F1;">
                        <th style="text-align:center;width:70px"></th>
                        <th style="text-align:center;width:150px">메뉴명</th>
                        <th style="text-align:center;width:150px;">URL</th>
                        <th style="text-align:center;width:200px;">게시판 타입</th>
                    </tr>
                    <tbody id="menu-box">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        setMenuMgmt();
    });

    var removedMenuSeqs = [];   // 삭제 row
    var menu_number = 0;        // menuSeq에 사용
    var max_number  = 1;        // 현재 코드 상태에서는 부모코드 갯수

    // 페이지 셋팅
    function setMenuMgmt() {
        menu_number = 0;  // 초기화 추가
        $.ajax({
            type: 'post',
            url: '/totalAdmin/getMenuMgmtAjax',
            dataType: "json",
            success: function (data) {
                if (data.menuList.length > 0) {
                    var menuList = data.menuList;
                    $(menuList).each(function (idx, val) {
                        addMenuRow(val);
                        max_number++;
                    });
                    menu_number = data.menuCnt + 1;
                }
            }
        });
    }

    // 페이지 셋팅2
    function addMenuRow(menuData) {
        var listHtml = '<tr>';
        listHtml += '<input type="hidden" name="menuLevel" value="' + menuData.menuLevel + '" />';
        listHtml += '<input type="hidden" name="menuSeq" value="' + menuData.menuSeq + '"/>';
        listHtml += '<input type="hidden" name="menuParentSeq" value="' + menuData.menuParentSeq + '" />';
        listHtml += '<input type="hidden" name="menuUseYn" value="' + menuData.menuUseYn + '" />';
        listHtml += '<input type="hidden" name="menuOrder" value="' + menuData.menuOrder + '" />';
        listHtml += '<input type="hidden" name="menuSite" value="U" />';
        listHtml += '<input type="hidden" name="menuType" value="0" />';
        listHtml += '<td>';
        listHtml += '<button type="button" class="btn btn-danger btn-sm" onclick="removeMenuRow(this);">';
        listHtml += '<i class="fa fa-minus"></i> 삭제</button>';
        listHtml += '<button type="button" class="btn btn-info btn-sm" onclick="move(\'up\', ' + menuData.menuSeq + ', this.parentNode.parentNode);">';
        listHtml += '<i class="fa fa-arrow-up"></i>';
        listHtml += '</button>';
        listHtml += '<button type="button" class="btn btn-orange btn-sm" onclick="move(\'down\', ' + menuData.menuSeq + ', this.parentNode.parentNode);">';
        listHtml += '<i class="fa fa-arrow-down"></i>';
        listHtml += '</button>';
        listHtml += '</td>';
        listHtml += '<td><input type="text" name="menuName" class="form-control" ' +
            'placeholder="메뉴명 입력" autocomplete="off" value="' + menuData.menuName + '"></td>';
        listHtml += '<td><input type="text" name="menuUrl" class="form-control" placeholder="URL" autocomplete="off" value="' + menuData.menuUrl + '"></td>';
        listHtml += '<td><input type="text" name="menuBoardType" class="form-control" placeholder="게시판 타입" autocomplete="off" value="' + menuData.menuBoardType + '"></td>';
        listHtml += '</tr>';

        max_number++;

        $("#menu-box").append(listHtml);
    }

    // 이동
    function move(type, number, obj) {
        var currentRow = $(obj).closest('tr');

        if (type == "up") {
            var prevRow = currentRow.prev('tr');
            if (prevRow.length > 0) {
                swapMenuOrder(currentRow, prevRow);
            }
        } else if (type == "down") {
            var nextRow = currentRow.next('tr');
            if (nextRow.length > 0) {
                swapMenuOrder(currentRow, nextRow);
            }
        }
    }

    // 값 교환 함수
    function swapMenuOrder(div1, div2) {
        var menuOrder1 = div1.find("[name='menuOrder']").val();
        var menuOrder2 = div2.find("[name='menuOrder']").val();

        // 1레벨에서만 가능함(부모영역에서 변경하면 자식영역의 값까지 같이 바뀌어서 2레벨 추가하는 기능을 제거했음.)
        div1.find("[name='menuOrder']").val(menuOrder2);
        div2.find("[name='menuOrder']").val(menuOrder1);

        // 화면에서의 순서 변경
        var temp = div1.clone(true);
        div1.replaceWith(div2.clone(true));
        div2.replaceWith(temp);
    }

    // 삭제
    function removeMenuRow(obj) {
        var delRow = $(obj).closest("tr");
        delRow.find("[name='menuUseYn']").val("N");

        // 해당 메뉴의 정보를 추출하여 배열에 추가
        var info = {};
        var input = [
            "menuSite",
            "menuLevel",
            "menuSeq",
            "menuParentSeq",
            "menuName",
            "menuType",
            "menuUrl",
            "menuUseYn",
            "menuBoardType"
        ];

        for (var i = 0; i < input.length; i++) {
            var key = input[i];
            var value = delRow.find("[name=" + key + "]").val();
            info[key] = value;
        }

        if(info.menuName.trim() || info.menuUrl.trim()){
            removedMenuSeqs.push(info);
        }

        delRow.remove();
    }

    // 등록
    function create_box(info = {}) {
        info['menuParentSeq'] = (info['menuParentSeq'] == undefined || info['menuParentSeq'] == "") ? "" : info['menuParentSeq'];
        info['menuSeq'] = (info['menuSeq'] == undefined || info['menuSeq'] == "") ? menu_number : info['menuSeq'];
        info['menuLevel'] = (info['menuLevel'] !== '' && info['menuLevel'] !== undefined && !isNaN(info['menuLevel'])) ? (Number(info['menuLevel']) + 1) : 1;

        // 자식 메뉴일 경우 menuOrder를 현재 자식 메뉴의 수 + 1로 설정
        if (info['menuParentSeq'] !== "") {
            info['menuOrder'] = $("#menu-box-" + info['menuParentSeq'] + " .child-menu").length + 1;
        } else {
            info['menuOrder'] = (info['menuOrder'] == undefined || info['menuOrder'] == "") ? max_number : info['menuOrder'];
            max_number++;
        }

        var html = "";
        html += '<tr id="menu-box-' + info['menuSeq'] + '">';
        html += '<input type="hidden" name="menuLevel" value="' + info['menuLevel'] + '" />';
        html += '<input type="hidden" name="menuSeq" value="' + info['menuSeq'] + '"/>';
        html += '<input type="hidden" name="menuParentSeq" value="' + info['menuParentSeq'] + '" />';
        html += '<input type="hidden" name="menuUseYn" value="Y" />';
        html += '<input type="hidden" name="menuOrder" value="' + info['menuOrder'] + '" />'
        html += '<input type="hidden" name="menuSite" value="U" />';
        html += '<input type="hidden" name="menuType" value="0" />';
        html += '<td>';
        html += '<button type="button" class="btn btn-danger btn-sm" onclick="removeMenuRow(this);">';
        html += '<i class="fa fa-minus"></i> 삭제';
        html += '</button>';
        html += '<button type="button" class="btn btn-info btn-sm" onclick="move(\'up\', ' + info['menuSeq'] + ', this);">';
        html += '<i class="fa fa-arrow-up"></i>';
        html += '</button>';
        html += '<button type="button" class="btn btn-orange btn-sm" onclick="move(\'down\', ' + info['menuSeq'] + ', this);">';
        html += '<i class="fa fa-arrow-down"></i>';
        html += '</button>';
        html += '</td>';
        if (info['menuParentSeq'] != "" && info['menuLevel'] != undefined) {
            html += '<td><i class="fa fa-chevron-right" style="width:30px; margin-left:0px;"></i></td>';
        }
        html += '<td><input type="text" name="menuName" class="form-control" placeholder="메뉴명 입력" autocomplete="off" value=""></td>';
        html += '<td><input type="text" name="menuUrl" class="form-control" placeholder="URL" autocomplete="off" value=""></td>';
        html += '<td><input type="text" name="menuBoardType" class="form-control" placeholder="menuBoardType" autocomplete="off" value=""></td>';
        html += '</tr>';

        menu_number++;

        if (info['menuParentSeq'] != "") {
            $("#menu-box-" + info['menuParentSeq']).append(html);
        } else {
            $("#menu-box").append(html);
        }
    }

    // 저장
    function menu_save() {
        var input = [
            "menuSite",
            "menuLevel",
            "menuSeq",
            "menuParentSeq",
            "menuName",
            "menuType",
            "menuUrl",
            "menuUseYn",
            "menuOrder",
            "menuBoardType"
        ];

        var data = [];
        $("#menu-box tr").each(function() {
            var row = $(this);
            var info = {};
            for (var i = 0; i < input.length; i++) {
                var key = input[i];
                var value = row.find("[name="+key+"]").val();
                info[key] = value;
            }
            data.push(info);
        });

        // 삭제된 메뉴의 정보를 data에 추가
        data = data.concat(removedMenuSeqs);

        var jsonData = JSON.stringify(data);

        $.ajax({
            type : 'post',
            url : '/totalAdmin/updMenuMgmtAjax',
            data : jsonData,
            dataType : "json",
            contentType: 'application/json; charset=utf-8',
            success : function(data) {
                alert("저장되었습니다.");
                location.reload();
            }
        });
    }
</script>

<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>