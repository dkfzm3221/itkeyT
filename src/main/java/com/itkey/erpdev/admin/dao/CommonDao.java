package com.itkey.erpdev.admin.dao;

import java.util.List;

import com.itkey.erpdev.admin.dto.CommonDTO;

public interface CommonDao {

	// gnb 목록
	public List<CommonDTO> getGnbMenuListAjax();

	
}
