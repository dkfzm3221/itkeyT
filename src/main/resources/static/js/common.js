var week = ['일', '월', '화', '수', '목', '금', '토'];

$(document).ready(function(){
	$('.onlyAlphabetAndNumber').keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
		}
	});
	 
	$(".onlyHangul").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[a-z0-9]/gi,''));
		}
	});

	$(".onlyNumber").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
});

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType === 'R') {
				fullAddr = data.roadAddress;

			} else {
				fullAddr = data.jibunAddress;
			}

			if(data.userSelectedType === 'R'){
				if(data.bname !== ''){
					extraAddr += data.bname;
				}

				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}

				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			$(".postcode").val(data.zonecode);
			$(".address").val(fullAddr);
		}
	}).open();
}

function openPhoto(obj){
	$("#modal-member_photo .modal-title").html("<b>" + obj.title + "</b>님의 프로필 사진");
	$("#modal-member_photo .modal-body").html("<img src='"+obj.src+"' style=\"max-width:100%;\" />");
	$("#modal-member_photo").css("z-index", (erp_modal.z_index + 1));
	$("#modal-member_photo").modal("show");
}

function call_calender(){
	$(document).find(".calendar").removeClass('hasDatepicker').datepicker({
		changeYear			: true,
		changeMonth			: true,

		yearRange			: "-70:+1",
		dateFormat			: 'yy-mm-dd',

		prevText			: '이전 달',
		nextText			: '다음 달',
		monthNames			: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort		: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames			: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort		: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin			: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear	: true,
		yearSuffix			: '년'
	});
}

function gmtToDate(gmt){
	var t = new Date(gmt);
	var y = (parseInt(t.getYear()) + 1900) + "";
	var m = (parseInt(t.getMonth()) + 1) + "";
	var d = t.getDate() + "";
	var h = t.getHours() + "";
	var i = t.getMinutes() + "";

	m = m.length == 1 ? "0" + m : m;
	d = d.length == 1 ? "0" + d : d;
	h = h.length == 1 ? "0" + h : h;
	i = i.length == 1 ? "0" + i : i;

	var date_string = y + "-" + m + "-" + d + " " + h + ":" + i + ":00";

	return date_string;
}

//////////////////////////////////////////////////////////////// 폼 벨리데이션 체크
function form_check(fname){
	var form_pass = true;
	$("#" + fname + " :input").each(function(){
		var rText = $(this).attr("requiredText");
		if(rText){
			var name = $(this).attr("name");
			var value = $(this).val();
			//console.log(name + " = " + value);
			if(!value){
				alert(rText);
				$(this).focus();
				form_pass = false;
				return false;
			}
		}
	});

	return form_pass;
}

//////////////////////////////////////////////////////////////// 거래처 등록
$(document).off("click", "#btn_cust_form_save");
$(document).on("click", "#btn_cust_form_save", function(){
	var form_pass = form_check("cust_form");
	if(form_pass){
		//console.log('form_pass true');
		erp_process.cust_form_submit();
	}
});

//////////////////////////////////////////////////////////////// 자산추가 -> 사양추가
$(document).off("click", "#btn_fortune_spec_add");
$(document).on ("click", "#btn_fortune_spec_add", function(){
	if(document.fortune_form.category.value == ""){
		alert("자산 종류를 선택해주세요.");
		return false;
	}

	$(this).attr("json", '{"name":"fortune_category_spec_form","getParameter":{"category_idx":"'+document.fortune_form.category.value+'"},"functions":"fortune_spec_add_end"}');
	erp_modal.open($(this));
});
$(document).off("click", ".btn_fortune_spec_remove");
$(document).on ("click", ".btn_fortune_spec_remove", function(){
	$(this).parent("td").parent("tr").remove();
});
$(document).off("click", "#btn_fortune_form_save");
$(document).on ("click", "#btn_fortune_form_save", function(){
	var form_pass = form_check("fortune_form");
	if(form_pass){
		erp_process.fortune_form_submit();
	}
});
function fortune_spec_add_end(){
	erp_process.fortune_category_onchange(document.fortune_form.category);
}

//////////////////////////////////////////// 네이버 스마트 에디터
var oEditors = [];
function naverLoad(naverContentField, content)
{
	//document.write("");
	nhn.husky.EZCreator.createInIFrame({
		oAppRef        : oEditors,
		elPlaceHolder  : naverContentField,
		sSkinURI       : PATH['main'] + "/plugin/smarteditor/SmartSkin.php",
		htParams       :
		{
			bUseToolbar            : true,
			bUseVerticalResizer    : true,
			bUseModeChanger        : true,
			fOnBeforeUnload        : function(){},
			SE_EditingAreaManager  : { sDefaultEditingMode : "WYSIWYG" } // - Editor 모드 : WYSIWYG - HTML 모드 : HTMLSrc - TEXT 모드 : TEXT
		},
		fOnAppLoad     : function(){
			oEditors.getById[naverContentField].setDefaultFont('굴림', 9);
			if(content){
				oEditors.getById[naverContentField].exec("PASTE_HTML", [content]);
			}
		},
		fCreator       : "createSEditor2"
	});
}

function number_format(data)
{
	data = data + "";

	var tmp = '';
	var number = '';
	var cutlen = 3;
	var comma = ',';
	var i;

	var sign = data.match(/^[\+\-]/);
	if (sign) {
		data = data.replace(/^[\+\-]/, '');
	}

	len = data.length;
	mod = (len % cutlen);
	k = cutlen - mod;
	for (i = 0; i < data.length; i++) {
		number = number + data.charAt(i);

		if (i < data.length - 1) {
			k++;
			if ((k % cutlen) === 0) {
				number = number + comma;
				k = 0;
			}
		}
	}

	if (sign !== null) {
		number = sign+number;
	}

	return number;
}