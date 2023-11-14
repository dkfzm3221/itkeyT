package com.itkey.erpdev.admin.dto;

import lombok.Data;

@Data
public class MenuDTO {

	private String menuSeq = "";
	private String menuCode = "";
	private String menuSite = "";
	private String menuName = "";
	private String menuLevel = "";
	private String menuOrder = "";
	private String menuUseYn = "";
	private String menuType = "";
	private String menuUrl = "";
	private String menuConnWay = "";
	private String menuDesc = "";
	private String menuParentSeq = "";
	
	private String authAccess = "";
	private String authList = "";
	private String authDetail = "";
	private String authUpdate = "";

	private String regId = "";
	private String updDt = "";
}

