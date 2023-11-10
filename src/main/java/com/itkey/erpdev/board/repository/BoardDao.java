package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.board.domain.Board;

import java.util.List;

public interface BoardDao {
    List<Board> boardList() throws Exception;
}
