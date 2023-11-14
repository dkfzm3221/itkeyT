package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dao.TotalAdminDAO;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class TotalAdminServiceImpl implements TotalAdminService {

    TotalAdminDAO totalAdminDAO;

    @Override
    public TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO) {
        return totalAdminDAO.getAdminInfo(adminDTO);
    }

    @Override
    public List<Board> getAdminBoardList() {
        return totalAdminDAO.getAdminBoardList();
    }

    @Override
    public List<Board> getBoardList() {
        return totalAdminDAO.getBoardList();
    }

    @Override
    public List<Board> boardTypeCnt() {
        return totalAdminDAO.boardTypeCnt();
    }

    @Override
    public void adminWriteBoard(Board board) {
        totalAdminDAO.adminWriteBoard(board);
    }
}