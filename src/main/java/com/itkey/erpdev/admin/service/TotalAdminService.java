package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;

import javax.servlet.http.HttpSessionEvent;
import java.util.List;

import java.util.List;

public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 관리자 게시판 목록
	List<Board> getBoardList();

    List<Visitor> mostVisitURL();

	List<Visitor> mostVisitIP();

    List<Visitor> mostVisitDate();

	// 메뉴관리
	public int updMenuMgmtAjax(List<MenuEntity> menuEntityList);
}