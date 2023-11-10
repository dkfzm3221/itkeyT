/*
#페이지를 호출하는 핵심 클래스
$(document).ready(function(){
	erps.member_list_all = new erp_page_class({
		"getParameter"	: '<?=json_encode($_GET)?>',
		"type"			: "전체직원",
		"ptype"			: "<?=$core['util']->get_cookie('member_list_all')?>",
		"unique"		: "member_list_all"
	});
	erps.member_list_all.getList();
});
*/

var seedit = {}; //전역변수

var erp_page_class = function(param){
	var _self = this;

	this.first = false;

	this.pg = 1;
	this.getParameter = $.parseJSON(param.getParameter);
	this.type = param.type;
	this.ptype = param.ptype;
	this.unique = param.unique;
	this.functions = param.functions;

	//this.project_idx = null;

	this.setPg = function(pg){
		this.pg = pg;
	}

	this.getList = function(pg){
		if(this.first == false){
			this.first = true;
			this.ptypeSetting();
		}

		if(pg != undefined){
			this.pg = pg;
		}

		//$("#" + this.unique + "_loading").show();
		$("#fog").show();
		$("#" + this.unique + "_box").html("<img src='"+DIR_SKIN+"/img/loading.gif' />");
		$("#" + this.unique + "_paging").html("");

		if(this.getParameter.v != undefined){ //걍 스크립트에서 제거하자
			delete this.getParameter.v;
		}

		var json = null;
		if(this.getParameter.length == 0){
			json = {};
		}
		else{
			json = this.getParameter;
		}

		json['pg'] = this.pg;
		json['template'] = this.unique;
		json['type'] = this.type;
		json['unique'] = this.unique;
		//console.log(json);

		//검색값 만들기
		//if(document.getElementById(this.unique + "_search") != undefined){
			var search = $("#" + this.unique + "_search").serialize();
			//console.log(search);
			if(search){
				var search_ex = search.split("&");
				for(var key in search_ex){
					var tmp = search_ex[key].split("=");
					json[tmp[0]] = tmp[1];
				}
			}
		//}

		//console.log(json);
		$.get("?v=_core", json, function(res){
			try{
				//console.log(res);
				if(res.result == true){
					//$("#" + _self.unique + "_loading").hide();
					$("#" + _self.unique + "_box").html(res.list);
					$("#" + _self.unique + "_paging").html(res.paging);

					ready_Tooltip();

					//console.log(typeof _self.functions);
					if(typeof _self.functions == "function"){
						_self.functions(res);
					}

					if(res.debug){
						//console.log(res.debug);
					}
				}
				else{
					if(res.msg){
						alert("getListError\n\n" + res.msg);
					}
				}
			}
			catch(e){
				alert("에러가 발생했습니다.\n\n" + e);
			}

			$("#fog").hide();
		}, "json");
	}

	this.ptypeChange = function(ptype){
		if(this.ptype == ptype){
			return;
		}

		this.ptype = ptype;
		this.ptypeSetting();

		var json = {};
		json['name'] = this.unique;
		json['value'] = ptype;
		$.post("?v=_core_ptype_change", json, function(res){
			if(res.result == true){
				_self.getList();
			}
			else{
				alert(res.msg);
			}
		}, "json");
	}

	this.ptypeSetting = function(){
		//console.log("ptype = " + this.ptype);
		if(this.ptype == "list"){
			$("#" + this.unique + "_btnlist").removeClass("btn-white");
			$("#" + this.unique + "_btnlist").addClass("btn-primary");
			$("#" + this.unique + "_btnbox").removeClass("btn-primary");
			$("#" + this.unique + "_btnbox").addClass("btn-white");
		}
		else{
			$("#" + this.unique + "_btnlist").removeClass("btn-primary");
			$("#" + this.unique + "_btnlist").addClass("btn-white");
			$("#" + this.unique + "_btnbox").removeClass("btn-white");
			$("#" + this.unique + "_btnbox").addClass("btn-primary");
		}
	}
}
var erps = {}; //다수 객체 저장



/*
#ajax modal 오픈클래스
- onclick="erp_modal.open(this);"
- 거래처창			: json='{"name":"cust_form","getParameter":{"cust_idx":""}}'
- 직원등록			: json='{"name":"member_form","getParameter":{"mem_idx":"","company_idx":"","company_master_bool":""}}'
- 직원리스트		: json='{"name":"member_list","getParameter":{"project_idx":"","type":""}}'
- 프로젝트창		: json='{"name":"project_form","getParameter":{"project_idx":""}}'
- 인터뷰			: json='{"name":"project_interview_form","getParameter":{"mem_idx":"","project_idx":""}}'
- 투입				: json='{"name":"project_go_form","getParameter":{"mem_idx":"","project_idx":""}}'
- 프로젝트리스트	: json='{"name":"project_list","getParameter":{"mem_idx":""}}'
- 직원 시스템 이력	: json='{"name":"project_member_history","getParameter":{"mem_idx":""}}'
- 회사등록			: json='{"name":"master_company_form","getParameter":{"company_idx":""}}'
*/
var erp_modal_class = function(){
	var _self = this;

	this.z_index = 10000;
	this.open_name = [];
	this.project_idx = null;
	this.mem_idx = null;
	this.functions = {};
	this.open = function(obj){
		try{
			$("#fog").show();
			var param = $.parseJSON($(obj).attr("json"));
			//console.log(param);

			if(param.functions){
				if(!_self.functions[param.name]){
					_self.functions[param.name] = param.functions;
				}
			}

			$("#modal-" + param.name).css("z-index", ++this.z_index);

			try{
				if(param.getParameter.project_idx != undefined){
					this.project_idx = param.getParameter.project_idx;
					//console.log("project_idx = " + this.project_idx + " 저장완료!");
				}
			}
			catch(e){
				//console.log(e);
			}

			//project_interview_form, project_go_form 호출시에 저장함
			try{
				if(param.getParameter.mem_idx != undefined){
					this.mem_idx = param.getParameter.mem_idx;
					//console.log("mem_idx = " + this.mem_idx + " 저장완료!");
				}
			}
			catch(e){
				//console.log(e);
			}

			//console.log(param);
			//console.log(this.project_idx);
			if(param.name == "project_interview_form" || param.name == "project_go_form"){
				if(this.project_idx == null){
					alert("상위 modal에서 project 고유값을 저장하지 못했습니다.\n\n개발자에게 문의바랍니다.");
					return false;
				}

				param.getParameter.project_idx = this.project_idx;
				//console.log("project_idx = " + param.getParameter.project_idx);
			}

			this.openProc(param);

			//close 때 이벤트 발동
			/*
			if(!_self.open_name[param.name]){
				$("#modal-" + param.name).on('hide.bs.modal', function(e){
					if(!_self.open_name[param.name]){
						return true;
					}

					//console.log(param.name + " 닫기!");
					delete _self.open_name[param.name];

					//닫을때 상위 모달 리플래쉬 중지 2017-04-25
					//for(var key in _self.open_name){
					//	_self.openProc(_self.open_name[key]); //열려있는 modal 창 모두 재갱신
					//}

					//console.log(_self.open_name);
				});

				//console.log(param.name + " 열기!");
				//_self.open_name[param.name] = param;
			}
			*/

			//close 할때 function 호출
			if(_self.functions[param.name]){
				$("#modal-" + param.name).on('hide.bs.modal', function(e){
					window[_self.functions[param.name]]();
					e.stopImmediatePropagation();
				});
			}

			$("#fog").hide();
		}
		catch(e){
			alert("modal 오픈에 실패했습니다.\n\n" + e);
		}
	}

	this.openProc = function(param){
		//console.log(param);
		$.get("?v=" + param.name, param.getParameter, function(res){
			//console.log(res);
			try{
				$("#modal-" + param.name).html(res);
				$("#modal-" + param.name).modal({
					'show'		: true,
					'backdrop'	: 'static'
				});

				console.log("템플릿 파일 : <?=DIR_SKIN?>/_" + param.name + ".php 오픈!");
				/*
				if(param.name == "cust_form"){ //프로젝트 등록폼에서 거래처 등록을 할 경우
					$("#modal-project_form").modal("hide");
				}
				*/
			}
			catch(e){
				alert("페이지 로딩에 실패했습니다.\n\n" + e);
			}
		}, "text");
	}

	this.frame_close = function(modal_name){
		$("#modal-" + modal_name).modal("toggle");
		erp_process.reflash(); //Ajax row 페이지 모두 갱신
	}

	this.frame_error = function(response){
		var data = $.parseJSON(response);
		if(data.msg){
			alert(data.msg);
		}
	}
}
var erp_modal = new erp_modal_class();



//Ajax 프로세스 처리 클래스
//erp_process
var erp_process_class = function(){
	var _self = this;

	//열려있는 모든 리스트를 재갱신하자.
	this.reflash = function(){
		for(var key in erps){
			if(typeof erps[key].getList == "function"){
				//console.log(key + " 재갱신 완료!");
				erps[key].getList();
			}
		}
	}

	//Ajax 통신 처리 함수
	this.send = function(param){
		//console.log(param);
		$("#fog").show();

		if(param.ajax_form && param.form_id){
			//console.log('ajaxForm : ' + param.form_id);
			$("#" + param.form_id).ajaxForm({
				beforeSubmit : function() {
					//alert('서브밋 직전입니다!');
				},
				success : function(res) {
					if(typeof param.functions == "function"){
						param.functions(res);
					}

					if(param.use_reflash == false){
					}
					else{
						_self.reflash();
					}
				}
			});
			$("#" + param.form_id).submit();
		}
		else{
			$.post("?v=" + param.v, param.json, function(res){
				try{
					if(res.result == true){
						if(typeof param.functions == "function"){
							param.functions(res);
						}

						if(param.use_reflash == false){
						}
						else{
							_self.reflash();
						}
					}
					else{
						alert(res.msg);
					}
				}
				catch(e){
					alert("처리에 실패했습니다.\n\n" + e);
				}

				$("#fog").hide();
			}, "json");
		}
	}

	this.msg = function(msg){
		alert(msg);
	}

	///////////////////////////////// 자산 자산 카테고리
	this.fortune_category_add = function(){ //카테고리 추가버튼 클릭
		//console.log('fortune_category_add');return;
		this.send({
			"v"			: "fortune_category_form_proc",
			"json"		: {
				"type"		: "add"
			}
		});
	}
	this.fortune_category_mod = function(json){ //카테고리 수정버튼 클릭
		this.send({
			"v"				: "fortune_category_form_proc",
			"json"			: {
				"type"			: "mod",
				"idx"			: json.idx,
				"name"			: json.name
			},
			"functions"		: this.msg("저장되었습니다."),
			"use_reflash"	: false,
		});
	}
	this.fortune_category_remove = function(idx){ //카테고리 삭제버튼 클릭
		this.send({
			"v"		: "fortune_category_form_proc",
			"json"	: {
				"type"		: "del",
				"idx"		: idx
			}
		});
	}

	///////////////////////////////// 자산 자산 카테고리 스텍
	this.fortune_category_spec_add = function(category_idx){
		//console.log(category_idx);
		this.send({
			"v"		: "fortune_category_form_spec_proc",
			"json"	: {
				"type"			: "add",
				"category_idx"	: category_idx
			}
		});
	}
	this.fortune_category_spec_mod = function(json){
		//console.log(json);
		this.send({
			"v"		: "fortune_category_form_spec_proc",
			"json"	: {
				"type"		: "mod",
				"idx"		: json.idx,
				"name_spec"	: json.name_spec
			},
			"functions"		: this.msg("수정되었습니다."),
			"use_reflash"	: false,
		});
	}
	this.fortune_category_spec_remove = function(idx){
		this.send({
			"v"		: "fortune_category_form_spec_proc",
			"json"	: {
				"type"		: "del",
				"idx"		: idx
			}
		});
	}

	///////////////////////////////// 자산 자산 추가 / 카테고리 onchange
	this.fortune_category_onchange = function(obj){
		//console.log(obj.value);
		this.send({
			"v"		: "fortune_category_onchange",
			"json"	: {
				"category_idx" : obj.value
			},
			"functions"		: this.fortune_category_onchange_end,
			"use_reflash"	: false,
		});
	}
	this.fortune_category_onchange_end = function(res){
		//console.log(res);
		//console.log(_self.tbody_fortune_form_row);
		var html = [];
		for(var key in res.list){
			//console.log(res.list[key]['name_spec']);
			if(res.list[key]['name_spec'] == null){
				res.list[key]['name_spec'] = "";
			}
			var makeRow = seedit['tbody_fortune_form'].replace(/%사양명%/gi, res.list[key]['name_spec']);
			html.push(makeRow);
		}

		html = html.join("");
		//console.log(html);
		$("#tbody_fortune_form").html(html);
	}

	///////////////////////////////// 거래처 등록
	this.cust_form_submit = function(){
		//console.log('cust_form_submit');
		this.send({
			"v"				: "cust_form_proc",
			"json"			: $("#cust_form").serializeArray(),
			"functions"		: this.cust_form_submit_end,
			"use_reflash"	: true,
		});
	}
	this.cust_form_submit_end = function(){
		$("#modal-cust_form").modal("hide");
		try{
			_self.send({
				"v"				: "cust_selectbox",
				"functions"		: _self.cust_selectbox_end,
			});
		}
		catch(e){
		}
	}
	this.cust_selectbox_end = function(res){
		$("form[name='project_form'] select[name='cust_idx'] option").remove();
		for(var key in res.list){
			$("form[name='project_form'] select[name='cust_idx']").append("<option value='"+res.list[key]['cust_idx']+"'>"+res.list[key]['cust_name']+"</option>");
		}
	}

	///////////////////////////////// 자산 자산 추가
	this.fortune_form_submit = function(){
		//console.log('fortune_form_submit');
		this.send({
			"v"				: "fortune_form_proc",
			//"json"		: $("#fortune_form").serializeArray(),
			"functions"		: this.fortune_form_submit_end,
			"use_reflash"	: true,
			"ajax_form"		: true,
			"form_id"		: "fortune_form"
		});
	}
	this.fortune_form_submit_end = function(){
		$("#modal-fortune_form").modal("hide");
	}

	///////////////////////////////// 마스터
	this.master_setting = function(type, mem_idx){
		var confirmStr = "";
		if(type == "c"){
			confirmStr = "Master 권한을 취소시키겠습니까?";
		}
		else{
			confirmStr = "Master 권한을 부여하시겠습니까?";
		}

		if(confirm(confirmStr)){
			this.send({
				"v"		: "member_master_proc",
				"json"	: {
					"type"		: type,
					"mem_idx"	: mem_idx
				}
			});
		}
	}

	//직원 퇴사
	this.member_out = function(mem_name){
		if(confirm(mem_name + " 님을 퇴사처리 하시겠습니까?")){
			this.send({
				"v"		: "member_out_proc",
				"json"	: $("#member_out_form").serializeArray(),
				"functions"	: this.member_out_end
			});
		}
	}
	this.member_out_end = function(){
		$("#modal-member_out_form").modal("hide");
	}

	//직원 복직
	this.member_come = function(mem_idx, mem_name){
		if(confirm(mem_name + " 님의 복직 시키겠습니까?")){
			this.send({
				"v"		: "member_in_proc",
				"json"	: {
					"mem_idx"	: mem_idx
				},
				"functions"	: this.calendar_reload
			});
		}
	}

	//프로젝트 삭제
	this.project_delete = function(project_idx){
		if(confirm("프로젝트를 삭제하시겠습니까?")){
			this.send({
				"v"		: "project_remove",
				"json"	: {
					"project_idx"	: project_idx
				},
				"functions"		: this.project_modal_hide
			});
		}
	}

	//프로젝트 취소
	this.project_remove = function(project_idx, mem_idx, mem_name){
		if(confirm(mem_name + " 님을 프로젝트에서 제외하시겠습니까?\n\n제외된 직원은 프로젝트 명단에서 삭제됩니다.")){
			this.send({
				"v"		: "project_member_remove",
				"json"	: {
					"mem_idx"		: mem_idx,
					"project_idx"	: project_idx
				},
				"functions"		: this.calendar_reload
			});
		}
	}

	//프로젝트 철수
	this.project_break = function(project_idx, mem_idx, mem_name){
		if(confirm("오늘 날짜 부로 " + mem_name + " 님을 철수하시겠습니까?")){
			this.send({
				"v"		: "project_member_break",
				"json"	: {
					"mem_idx"		: mem_idx,
					"project_idx"	: project_idx
				},
				"functions"		: this.calendar_reload
			});
		}
	}

	//프로젝트 인터뷰
	this.project_interview = function(){
		var interviewDate = $("#interview_date").val();
		if(!interviewDate){
			alert("인터뷰 날짜를 선택해주세요.");
			return false;
		}

		//console.log("mem_idx = " + erp_modal.mem_idx + " / project_idx = " + erp_modal.project_idx);

		if(erp_modal.mem_idx == null){
			alert("직원 선택시에 회원 고유값을 저장하지 못했습니다.\n\n개발자에게 문의해주세요.");
			return false;
		}

		if(erp_modal.project_idx == null){
			alert("프로젝트 선택시에 프로젝트 고유값을 저장하지 못했습니다.\n\n개발자에게 문의해주세요.");
			return false;
		}

		this.send({
			"v"		: "project_interview_form_proc",
			"json"	: {
				"mem_idx"			: erp_modal.mem_idx,
				"project_idx"		: erp_modal.project_idx,
				"interview_date"	: interviewDate
			},
			"functions"			: this.project_interview_end
		});
	}

	this.project_go = function(){
		var f = document.go_form;
		if(f.go_date.value.trim() == ""){
			alert("투입 날짜를 선택해주세요.");
			return false;
		}

		if(f.out_date.value.trim() == ""){
			alert("철수 날짜를 선택해주세요.");
			return false;
		}

		if(f.go_date.value >= f.out_date.value){
			alert("투입 날짜가 철수 날짜보다 이전일 수 없습니다.");
			return false;
		}

		var ym_check = new Array();
		var ym_bool = false;
		$(".goto_year").each(function(key){
			var goto_year = $(".goto_year").eq(key).val();
			var goto_month = $(".goto_month").eq(key).val();
			var ym = goto_year + "-" + goto_month;
			if($.inArray(ym, ym_check) != -1){
				ym_bool = true;
				return false;
			}

			ym_check.push(ym);
		});

		if(ym_bool == true){
			alert("중복된 년/월이 있습니다.");
			return false;
		}

		var json = $("#go_form").serializeArray();
		//console.log(json);
		this.send({
			"v"			: "project_go_form_proc",
			"json"		: json,
			"functions"	: this.project_go_end
		});
	}

	this.project_interview_end = function(){
		$("#modal-project_interview_form").modal("hide");
		$("#modal-member_list_int_dialog").modal("hide");
		//$("#modal-project_form").modal("hide");

		//히스토리에서 실행
		$("#modal-project_list_history_dialog").modal("hide");

		_self.calendar_reload();
	}

	this.project_go_end = function(){
		$("#modal-project_go_form").modal("hide");
		$("#modal-member_list_go_dialog").modal("hide");
		//$("#modal-project_form").modal("hide");

		//히스토리에서 실행
		$("#modal-project_list_history_dialog").modal("hide");

		_self.calendar_reload();
	}

	this.calendar_reload = function(){
		if(typeof calendar_reload == "function"){
			calendar_reload();
		}
	}

	this.project_modal_hide = function(){
		$("#modal-project_form").modal("hide");
	}

	this.company_del = function(idx){
		if(confirm("정말로 삭제하시겠습니까?")){
			var arg = {
				"idx" : idx
			};
			$.post("action.php?c=master&f=company_del", arg, function(res){
				if(res.result){
					erps.master_company_list_.getList();
				}
			}, "json");
		}
	}
}
var erp_process = new erp_process_class();