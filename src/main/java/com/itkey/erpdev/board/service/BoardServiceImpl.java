package com.itkey.erpdev.board.service;

import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.repository.BoardDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    BoardDao dao;

    @Override
    public List<Board> boardList(int pageNum, int countPerPage) throws Exception {
        return dao.boardList(pageNum, countPerPage);
    }

    @Override
    public void writeBoard(Board board) throws Exception {
        dao.writeBoard(board);
    }

    @Override
    public Board boardDetail(Board board) throws Exception {
        return dao.boardDetail(board);
    }

    @Override
    public void updateInqCnt(Board board) throws Exception {
        dao.updateInqCnt(board);
    }

    @Override
    public int getTotalBoardCount() throws Exception {
        return dao.getTotalBoardCount();
    }

    @Override
    public Board selectPassword(Board board) throws Exception {
        return dao.selectPassword(board);
    }

    @Override
    public void updateBoard(Board board) throws Exception {
        dao.updateBoard(board);
    }

}