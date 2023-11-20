package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;

import java.util.List;

import java.util.List;

public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 관리자 게시판 목록
	List<Board> getAdminBoardList();

	// 게시판 목록
	List<Board> getBoardList();

	// 게시판타입 갯수
	List<Board> boardTypeCnt();

	// 관리자 게시판 등록
	void adminWriteBoard(Board board);

    List<Visitor> mostVisitURL();

	List<Visitor> mostVisitIP();

    List<Visitor> mostVisitDate();

	// 메뉴관리
	int updMenuMgmtAjax(List<MenuEntity> menuEntityList);

	// 메뉴 수
	int getMenuListCntAjax();
}