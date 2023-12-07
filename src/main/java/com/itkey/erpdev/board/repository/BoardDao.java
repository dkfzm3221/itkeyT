package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.HistoryDTO;
import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.Notice;
import com.itkey.erpdev.board.domain.SearchBoard;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

public interface BoardDao {
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

    Board selectName(String boardType);

    List<Banner> bannerList() throws Exception;

    List<Board> boardDetailReplyList(Board board);

    void insertBoardReply(Board board);

    void updateBoardReply(Board board);

    void deleteBoardReply(Board board);

    List<DesignDTO> getDesignList();

    void deleteBoardFile(Board board);

    void deleteBoardFileSeq(Board board);

    List<Notice> noticeList(String boardType) throws Exception;

    Notice getNoticeOne() throws Exception;

    // 유저페이지 연혁조회
    List<HistoryDTO> getHistoryList();

    void reportBoard(Board board, HttpServletRequest request);
}
