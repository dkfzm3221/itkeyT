package com.itkey.erpdev.board.service;

import com.itkey.erpdev.board.domain.Board;

import java.util.List;

public interface BoardService {
    List<Board> boardList() throws Exception;
}
