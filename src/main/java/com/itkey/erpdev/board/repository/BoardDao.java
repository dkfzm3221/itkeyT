package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.board.domain.Board;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface BoardDao {
    List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception;

    void writeBoard(Board board) throws Exception;

    Board boardDetail(Board board) throws Exception;

    void updateInqCnt(Board board) throws Exception;

    int getTotalBoardCount() throws Exception;

    Board selectPassword(Board board) throws Exception;

    void updateBoard(Board board) throws Exception;

    void deleteBoard(Board board) throws Exception;

    List<Board> boardDetailList(int pageNum, int countPerPage, int boardType);

    List<Board> getMenuList() throws Exception;

    List<Board> boardTypeList() throws Exception;
}
