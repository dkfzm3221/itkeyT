package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.Notice;
import com.itkey.erpdev.board.domain.SearchBoard;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@AllArgsConstructor
@Slf4j
public class BoardDaoImpl implements BoardDao{

    SqlSessionTemplate sql;

    @Override
    public List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception {
        int startIdx = (pageNum - 1) * countPerPage;
        Map<String, Object> params = new HashMap<>();
        params.put("startIdx", startIdx);
        params.put("countPerPage", countPerPage);
        params.put("boardType", boardType);

        return sql.selectList("mapper.board.boardList", params);
    }

    @Override
    public void writeBoard(Board board) throws Exception {
        sql.insert("mapper.board.writeBoard", board);
    }

    @Override
    public Board boardDetail(Board board) throws Exception {
        return sql.selectOne("mapper.board.boardDetail", board);
    }

    @Override
    public void updateInqCnt(Board board) throws Exception {
        sql.update("mapper.board.updateInqCnt", board);
    }

    @Override
    public int getTotalBoardCount(String boardType) throws Exception {
        return sql.selectOne("mapper.board.getTotalBoardCount",boardType);
    }

    @Override
    public Board selectPassword(Board board) throws Exception {
        return sql.selectOne("mapper.board.selectPassword", board);
    }

    @Override
    public void updateBoard(Board board) throws Exception {
        sql.update("mapper.board.updateBoard", board);
    }

    @Override
    public void deleteBoard(Board board) throws Exception {
        sql.update("mapper.board.deleteBoard", board);
    }

    @Override
    public List<Board> getMenuList() throws Exception {
        return sql.selectList("mapper.board.getMenuList");
    }

    @Override
    public List<Board> boardTypeList() throws Exception {
        return sql.selectList("mapper.board.boardTypeList");
    }

    @Override
    public List<Banner> bannerList() throws Exception {
        return sql.selectList("mapper.board.bannerList");
    }

    @Override
    public List<Board> boardDetailReplyList(Board board) {
        return sql.selectList("mapper.board.boardDetailReplyList",board);
    }

    @Override
    public void insertBoardReply(Board board) {
        sql.insert("mapper.board.insertBoardReply",board);
    }

    @Override
    public void updateBoardReply(Board board) {
        sql.update("mapper.board.updateBoardReply",board);
    }

    @Override
    public void deleteBoardReply(Board board) {
        sql.update("mapper.board.deleteBoardReply",board);
    }

    @Override
    public Board selectName(String boardType) {
        return sql.selectOne("mapper.board.selectName",boardType);
    }

    @Override
    public List<Board> boardDetailList(int pageNum, int countPerPage, String boardType, SearchBoard searchBoard) {
        int startIdx = (pageNum - 1) * countPerPage;
        Map<String, Object> params = new HashMap<>();
        params.put("startIdx", startIdx);
        params.put("countPerPage", countPerPage);
        params.put("boardType", boardType);
        params.put("searchBoardTitle", searchBoard.getSearchBoardTitle());

        return sql.selectList("mapper.board.boardDetailList", params);
    }


    @Override
    public List<DesignDTO> getDegignList() {
        return sql.selectList("mapper.board.getDegignList");
    }

    @Override
    public void deleteBoardFile(Board board) {
        sql.delete("mapper.board.deleteBoardFile",board);
    }

    @Override
    public void deleteBoardFileSeq(Board board) {
        sql.update("mapper.board.deleteBoardFileSeq",board);
    }

    @Override
    public List<Notice> noticeList(String boardType) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("boardType", boardType);
        return sql.selectList("mapper.board.noticeList", boardType);
    }

    @Override
    public Notice getNoticeOne() throws Exception {
        return sql.selectOne("mapper.board.getNoticeOne");
    }
}
