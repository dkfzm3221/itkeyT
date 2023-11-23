package com.itkey.erpdev.board.service;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.SearchBoard;

import java.util.List;

public interface BoardService {
    List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception;

    void writeBoard(Board board) throws Exception;

    Board boardDetail(Board board) throws Exception;

    void updateInqCnt(Board board) throws Exception;

    int getTotalBoardCount(String boardType) throws Exception;

    Board selectPassword(Board board) throws Exception;

    void updateBoard(Board board) throws Exception;

    void deleteBoard(Board board) throws Exception;

    List<Board> boardDetailList(int pageNum, int countPerPage, String boardType, SearchBoard searchBoard);

    List<Board> getMenuList() throws Exception;

    List<Board> boardTypeList() throws Exception;

    List<Banner> bannerList() throws Exception;

    Board selectName(String boardType);

    List<Board> boardDetailReplyList(Board board);

    void insertBoardReply(Board board);
}
