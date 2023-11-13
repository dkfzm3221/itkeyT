package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.dto.TotalAdminDTO;

/**
 * Service for SAMPLE_BOARD_TB table : 寃뚯떆�뙋 �젙蹂�
**/
public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);
}