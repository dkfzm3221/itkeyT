package com.itkey.erpdev.admin.domain;

import lombok.Data;

@Data
public class MenuEntity {

	private String menuSeq = "";		// 메뉴 순번
	private String menuSite = "";		// 메뉴 사이트
	private String menuName = "";		// 메뉴 이름
	private String menuLevel = "";		// 메뉴 레벨
	private String menuOrder = "";		// 메뉴 순서
	private String menuUseYn = "";		// 메뉴 사용여부
	private String menuType = "";		// 메뉴 형태(1 : 기본, 2 : 링크(URL))
	private String menuUrl = "";		// 메뉴 URL
	private String menuConnWay = "";	// 메뉴 연결방식연결방식(0 : 현재창, 1 : 새창, 2 : 팝업창)
	private String menuParentSeq = "";	// 부모 메뉴 번호

	private String regId = "";
	private String updDt = "";
}

