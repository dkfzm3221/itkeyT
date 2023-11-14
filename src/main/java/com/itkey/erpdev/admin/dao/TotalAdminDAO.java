package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;

import java.util.List;

public interface TotalAdminDAO {

	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 메뉴관리
	public int updMenuMgmtAjax(List<MenuEntity> menuEntityList);
}