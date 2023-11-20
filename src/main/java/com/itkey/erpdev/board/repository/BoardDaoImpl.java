package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
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
    public int getTotalBoardCount() throws Exception {
        return sql.selectOne("mapper.board.getTotalBoardCount");
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
    public List<Board> boardDetailList(int pageNum, int countPerPage, int boardType) {
        int startIdx = (pageNum - 1) * countPerPage;
        Map<String, Object> params = new HashMap<>();
        params.put("startIdx", startIdx);
        params.put("countPerPage", countPerPage);
        params.put("boardType", boardType);

        return sql.selectList("mapper.board.boardList", params);
    }


}
