package com.itkey.erpdev.board.service;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.HistoryDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.SearchBoard;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

public interface BoardService {
    List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception;

    void writeBoard(Board board, HttpServletRequest request) throws Exception;

    Board boardDetail(Board board) throws Exception;

    void updateInqCnt(Board board) throws Exception;

    int getTotalBoardCount(String boardType) throws Exception;

    Board selectPassword(Board board) throws Exception;

    void updateBoard(Board board, HttpServletRequest request) throws Exception;

    void deleteBoard(Board board) throws Exception;

    List<Board> boardDetailList(int pageNum, int countPerPage, String boardType, SearchBoard searchBoard);

    List<Board> getMenuList() throws Exception;

    List<Board> boardTypeList() throws Exception;

    List<Banner> bannerList() throws Exception;

    Board selectName(String boardType);

    List<Board> boardDetailReplyList(Board board);

    void insertBoardReply(Board board);

    void updateBoardReply(Board board);

    void deleteBoardReply(Board board);

    // 디자인 리스트
    List<DesignDTO> getDegignList();

    void deleteBoardFile(Board board);

    void deleteBoardFileSeq(Board board);

    // 유저페이지 연혁조회
    List<HistoryDTO> getHistoryList();
}
