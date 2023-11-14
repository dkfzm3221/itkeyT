package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dao.TotalAdminDAO;
import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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
    public int updMenuMgmtAjax(List<MenuEntity> menuEntityList) {
        return totalAdminDAO.updMenuMgmtAjax(menuEntityList);
    }
}