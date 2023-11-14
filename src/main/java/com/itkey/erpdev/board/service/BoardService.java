package com.itkey.erpdev.board.service;

import com.itkey.erpdev.board.domain.Board;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface BoardService {
    List<Board> boardList(int pageNum, int countPerPage) throws Exception;

    void writeBoard(Board board) throws Exception;

    Board boardDetail(Board board) throws Exception;

    void updateInqCnt(Board board) throws Exception;

    int getTotalBoardCount() throws Exception;

    Board selectPassword(Board board) throws Exception;

    void updateBoard(Board board) throws Exception;

    void deleteBoard(Board board) throws Exception;
}
