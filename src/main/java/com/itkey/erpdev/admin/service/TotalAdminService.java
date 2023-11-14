package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.board.domain.Board;

import java.util.List;

/**
 * Service for SAMPLE_BOARD_TB table : 寃뚯떆�뙋 �젙蹂�
**/
public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 관리자 게시판 목록
	List<Board> getBoardList();
}