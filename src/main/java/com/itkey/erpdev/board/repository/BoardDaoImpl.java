package com.itkey.erpdev.board.repository;

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
    public List<Board> boardList(int pageNum, int countPerPage) throws Exception {
        int startIdx = (pageNum - 1) * countPerPage;
        Map<String, Object> params = new HashMap<>();
        params.put("startIdx", startIdx);
        params.put("countPerPage", countPerPage);

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


}
