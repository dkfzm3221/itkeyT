package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;

import java.util.List;

public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 메뉴관리
	public int updMenuMgmtAjax(List<MenuEntity> menuEntityList);
}