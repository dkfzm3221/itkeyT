package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;

import java.util.List;

import java.util.List;

public interface TotalAdminDAO {

	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	List<Board> getAdminBoardList();

	List<Board> getBoardList();

	List<Board> boardTypeCnt();

	void adminWriteBoard(Board board);

	List<Visitor> mostVisitURL();

	List<Visitor> mostVisitIP();

	List<Visitor> mostVisitDate();

	// 메뉴 등록/수정
	int updMenuMgmtAjax(List<MenuEntity> menuEntityList);

	// 메뉴 수
	int getMenuListCntAjax();
	// 메뉴관리
	//public int updMenuMgmtAjax(List<MenuEntity> menuEntityList);

}