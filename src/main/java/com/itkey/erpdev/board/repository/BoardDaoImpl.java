package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class BoardDaoImpl implements BoardDao{

    SqlSessionTemplate sql;

    @Override
    public List<Board> boardList() throws Exception {
        return sql.selectList("mapper.board.boardList");
    }
}
