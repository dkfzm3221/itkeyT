package com.itkey.erpdev.board.service;

import com.itkey.erpdev.admin.dto.MenuDTO;
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
    public List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception {
        return dao.boardList(pageNum, countPerPage, boardType);
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

    @Override
    public void deleteBoard(Board board) throws Exception {
        dao.deleteBoard(board);
    }

    @Override
    public List<Board> getMenuList() throws Exception {
        return dao.getMenuList();
    }

    @Override
    public List<Board> boardTypeList() throws Exception {
        return dao.boardTypeList();
    }

    @Override
    public List<Board> boardDetailList(int pageNum, int countPerPage, int boardType) {
        return dao.boardDetailList(pageNum,countPerPage,boardType);
    }

}
