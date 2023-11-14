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
                <div id="menu-box">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    setMenuMgmt();
});

var menu_number = 0;
var max_number = 0;

// 페이지 셋팅
function setMenuMgmt(){
    $.ajax({
        type : 'post',
        url : '/totalAdmin/getMenuMgmtAjax',
        dataType : "json",
        success : function(data) {
            if (data.gnbMenuList.length > 0) {
                var menuList = data.gnbMenuList;
                $(menuList).each(function(idx, val){
                    var listHtml = "";
                    listHtml += '<div class="menu-box form-inline" id="menu-box-' + val.menuSeq + '">';
                    listHtml +=     '<input type="hidden" name="menuLevel" value="' + val.menuLevel + '" />';
                    listHtml +=     '<input type="hidden" name="menuSeq" value="' + val.menuSeq + '"/>';
                    listHtml +=     '<input type="hidden" name="menuParentSeq" value="' + val.menuParentSeq + '" />';
                    listHtml +=     '<input type="hidden" name="menuUseYn" value="' + val.menuUseYn + '" />';
                    if(val.menuLevel == '1') {
                        listHtml += '<button type="button" class="btn btn-success btn-sm" onclick="create_box({\'menuLevel\':' + val.menuLevel + ', \'menuParentSeq\':' + (val.menuParentSeq == '' ? val.menuSeq : val.menuParentSeq) + '});">';
                        listHtml += '<i class="fa fa-plus"></i> 하부 추가';
                        listHtml += '</button>';
                    }
                    listHtml +=     '<button type="button" class="btn btn-danger btn-sm" onclick=\"remove_box(this);\">';
                    listHtml +=         '<i class="fa fa-minus"></i> 삭제';
                    listHtml +=     '</button>';
                    listHtml +=     '<button type="button" class="btn btn-info btn-sm" onclick="move(\'up\', ' + val.menuSeq + ', this);">';
                    listHtml +=         '<i class="fa fa-arrow-up"></i>';
                    listHtml +=     '</button>';
                    listHtml +=     '<button type="button" class="btn btn-orange btn-sm" onclick="move(\'down\', ' + val.menuSeq + ', this);">';
                    listHtml +=         '<i class="fa fa-arrow-down"></i>';
                    listHtml +=     '</button>';
                    if(val.menuLevel != '1'){
                        listHtml +=     '<i class="fa fa-chevron-right" style="width:30px; margin-left:0px;"></i>';
                    }
                    listHtml +=     '<select name="menuSite" class="form-control" style="">';
                    listHtml +=         '<option value="A" selected="">전체회원</option>';
                    listHtml +=     '</select>';
                    listHtml +=     '<input type="text" name="menuName" class="form-control" ' +
                                        'placeholder="메뉴명 입력" autocomplete="off" value="' + val.menuName + '">';
                    listHtml +=     '<select name="menuType" class="form-control">';
                    listHtml +=         '<option value="0" selected="">현재창</option>';
                    // listHtml +=         '<option value="1">새창</option>';
                    listHtml +=     '</select>';
                    listHtml +=     '<span id="type-span-' + val.menuSeq + '">';
                    listHtml +=     '<input type="text" name="menuUrl" class="form-control" placeholder="URL" autocomplete="off" value="' + val.menuUrl + '">';
                    listHtml +=     '</span>';
                    listHtml += '</div>';

                    if(val.menuParentSeq != ''){
                        $("#menu-box-"+ val.menuParentSeq).append(listHtml);
                    } else {
                        $("#menu-box").append(listHtml);
                    }

                    max_number++;
                })
                menu_number = max_number + 1;
            }

        }
    });
}

// 이동
function move(type, number, obj) {
    if(type == "up")
    {
        if($("#menu-box-"+number).prev("div").attr("id") != undefined)
        {
            var now_content = $("#menu-box-"+number).clone(true);
            $("#menu-box-"+number).prev("div").before(now_content);
            $(obj).parent("div").remove();
        }
    }
    else if(type == "down")
    {
        if($("#menu-box-"+number).next("div").attr("id") != undefined)
        {
            var now_content = $("#menu-box-"+number).clone(true);
            $("#menu-box-"+number).next("div").after(now_content);
            $(obj).parent("div").remove();
        }
    }
}

// 삭제
function remove_box(obj) {
    var delDiv = $(obj).parent("div");

    let seq = $("#menuSeq").val();

    delDiv.find("[name='menuUseYn']").val("N");
    delDiv.remove();
}

// 등록
function create_box(info = {}) {
    info['menuParentSeq'] = (info['menuParentSeq'] == undefined || info['menuParentSeq'] == "") ? "" : info['menuParentSeq'];
    info['menuSeq'] = (info['menuSeq'] == undefined || info['menuSeq'] == "") ? menu_number : info['menuSeq'];
    info['menuLevel'] = info['menuLevel'] == "" ? 0 : info['menuLevel'] + 1;

    debugger;
    var html = "";
    html += '<div class="menu-box form-inline" id="menu-box-' + info['menuSeq'] + '">';
    html +=     '<input type="hidden" name="menuLevel" value="' + info['menuLevel'] + '" />';
    html +=     '<input type="hidden" name="menuSeq" id="menuSeq" value="' + info['menuSeq'] + '"/>';
    html +=     '<input type="hidden" name="menuParentSeq" value="' + info['menuParentSeq'] + '" />';
    if(info['menuParentSeq'] == "" && info['menuLevel'] == undefined){
        html += '<button type="button" class="btn btn-success btn-sm" onclick="create_box({\'menuLevel\':' + info['menuLevel'] + ', \'menuParentSeq\':' + info['menuParentSeq'] + '});">';
        html += '<i class="fa fa-plus"></i> 하부 추가';
        html += '</button>';
    }
    html +=     '<button type="button" class="btn btn-danger btn-sm" onclick=\"remove_box(this);\">';
    html +=         '<i class="fa fa-minus"></i> 삭제';
    html +=     '</button>';
    html +=     '<button type="button" class="btn btn-info btn-sm" onclick="move(\'up\', ' + info['menuSeq'] + ', this);">';
    html +=         '<i class="fa fa-arrow-up"></i>';
    html +=     '</button>';
    html +=     '<button type="button" class="btn btn-orange btn-sm" onclick="move(\'down\', ' + info['menuSeq'] + ', this);">';
    html +=         '<i class="fa fa-arrow-down"></i>';
    html +=     '</button>';
    if(info['menuParentSeq'] != "" && info['menuLevel'] != undefined) {
        html += '<i class="fa fa-chevron-right" style="width:30px; margin-left:0px;"></i>';
    }
    html +=     '<select name="menuSite" class="form-control" style="">';
    html +=         '<option value="A" selected="">전체회원</option>';
    html +=     '</select>';
    html +=     '<input type="text" name="menuName" class="form-control" ' +
        'placeholder="메뉴명 입력" autocomplete="off" value="">';
    html +=     '<select name="menuType" class="form-control">';
    html +=         '<option value="0" selected="">현재창</option>';
    // html +=         '<option value="1">새창</option>';
    html +=     '</select>';
    html +=     '<span id="type-span-' + info['menuSeq'] + '">';
    html +=     '<input type="text" name="menuUrl" class="form-control" placeholder="URL" autocomplete="off" value="">';
    html +=     '</span>';
    html += '</div>';

    menu_number++;

    if(info['menuParentSeq'] != ""){
        $("#menu-box-"+info['menuParentSeq']).append(html);
    } else{
        $("#menu-box").append(html);
    }
}

// 저장
function menu_save() {
    debugger;

    var input = [
        "menuSite",
        "menuLevel",
        "menuSeq",
        "menuParentSeq",
        "menuName",
        "menuType",
        "menuUrl",
        "menuUseYn"
    ];

    var data = [];
    $(".menu-box").each(function() {
        var info = {};
        for (var i = 0; i < input.length; i++) {
            var key = input[i];
            var value = $(this).find("[name="+key+"]").val();
            info[key] = value;
        }
        data.push(info);
    });

    var jsonData = JSON.stringify(data);

    $.ajax({
        type : 'post',
        url : '/totalAdmin/updMenuMgmtAjax',
        data : jsonData,
        dataType : "json",
        contentType: 'application/json; charset=utf-8',
        success : function(data) {
            alert("성공");
        }
    });
}
</script>
<!-- Footer  -->
<jsp:include page="common/contentFooter.jsp"/>
<!-- Footer END  -->
</body>
</html>