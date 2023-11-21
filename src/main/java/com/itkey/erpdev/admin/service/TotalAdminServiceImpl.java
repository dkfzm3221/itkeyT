package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dao.TotalAdminDAO;
import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class TotalAdminServiceImpl implements TotalAdminService {

    TotalAdminDAO totalAdminDAO;

    @Override
    public TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO) {
        return totalAdminDAO.getAdminInfo(adminDTO);
    }

    @Override
    public List<Board> getAdminBoardList() {
        return totalAdminDAO.getAdminBoardList();
    }

    @Override
    public List<Board> getBoardList() {
        return totalAdminDAO.getBoardList();
    }

    @Override
    public List<Board> boardTypeCnt() {
        return totalAdminDAO.boardTypeCnt();
    }

    @Override
    public void adminWriteBoard(Board board) {
        totalAdminDAO.adminWriteBoard(board);
    }

    @Override
    public List<Visitor> mostVisitURL() {
        return totalAdminDAO.mostVisitURL();
    }

    @Override
    public List<Visitor> mostVisitIP() {
        return totalAdminDAO.mostVisitIP();
    }

    @Override
    public List<Visitor> mostVisitDate() {
        return totalAdminDAO.mostVisitDate();
    }


    @Transactional
    @Override
    public int updMenuMgmtAjax(List<MenuEntity> menuEntityList) {
        try {
            // 삭제 대상 메뉴를 담을 리스트
            List<MenuEntity> menusToDelete = new ArrayList<>();

            for (MenuEntity menuEntity : menuEntityList) {
                if ("N".equals(menuEntity.getMenuUseYn())) {
                    menusToDelete.add(menuEntity);
                }
            }

            // log.info("menusToDeleteSize : " + menusToDelete.size());
            // 삭제하는 메뉴가 있는 경우 해당 게시판의 글 삭제
            if(menusToDelete.size() > 0) {
                totalAdminDAO.delBoardAjax(menusToDelete);
            }

            return totalAdminDAO.updMenuMgmtAjax(menuEntityList);
        } catch (Exception e) {
            throw new RuntimeException("Transaction failed", e);
        }
    }

    @Override
    public int getMenuListCntAjax(){
        return totalAdminDAO.getMenuListCntAjax();
    }

}