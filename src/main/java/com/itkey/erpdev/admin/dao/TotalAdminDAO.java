package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.board.domain.Board;

import java.util.List;

public interface TotalAdminDAO {

	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	List<Board> getAdminBoardList();

	List<Board> getBoardList();

	List<Board> boardTypeCnt();

	void adminWriteBoard(Board board);
}