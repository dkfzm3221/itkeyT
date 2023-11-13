package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.SearchAdmin;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.repository.AdminDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

    AdminDao dao;

    @Override
    public int countAdmin() {
        int result = dao.countAdmin();
        return result;
    }

    @Override
    public int insertAdmin(AdminInsert aDTO) {
        int result = dao.insertAdmin(aDTO);
        return result;
    }

    @Override
    public List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {

        return dao.adminList(pageNum, pageSize, searchAdmin);
    }

    @Override
    public TotalAdminDTO getLoginInfo(int adminIdx) {
        return dao.getLoginInfo(adminIdx);
    }

    @Override
    public int deleteAdmin(int adminIdx) {
        return dao.deleteAdmin(adminIdx);
    }

}
