package com.itkey.erpdev.board.service;

import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.repository.BoardDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    BoardDao dao;

    @Override
    public List<Board> boardList() throws Exception {
        return dao.boardList();
    }
}
