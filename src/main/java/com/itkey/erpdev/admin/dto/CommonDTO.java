package com.itkey.erpdev.admin.dto;

import lombok.Data;

@Data
public class CommonDTO {

	private String menuCode = "";
	private String menuSite = "";
	private String menuName = "";
	private String menuParentCode = "";
	private String menuLevel = "";
	private String menuOrder = "";
	private String menuUseYn = "";
	private String menuType = "";
	private String menuUrl = "";
	private String menuConnWay = "";
	private String menuDesc = "";
	
	private String authAccess = "";
	private String authList = "";
	private String authDetail = "";
	private String authUpdate = "";
}

