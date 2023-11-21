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
        return dao.countAdmin();
    }

    @Override
    public int insertAdmin(AdminInsert aDTO) {
        return dao.insertAdmin(aDTO);
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
    public int deleteAdmin(Admin aDTO) {
        return dao.deleteAdmin(aDTO);
    }

    @Override
    public int updateAdmin(Admin aDTO) {
        return dao.updateAdmin(aDTO);
    }

    @Override
    public List<Admin> del_adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {
        return dao.del_adminList(pageNum, pageSize, searchAdmin);
    }

    @Override
    public Integer countDelAdmin() {
        return dao.countDelAdmin();
    }

    @Override
    public int returnAdmin(Admin aDTO) {
        return dao.returnAdmin(aDTO);
    }

    @Override
    public int adminIdCheck(String id) {
        return dao.adminIdCheck(id);
    }

    @Override
    public int realDeleteAdmin(int adminIdx) {
        return dao.realDeleteAdmin(adminIdx);
    }

    @Override
    public int blockMember(int memberIdx) {
        return dao.blockMember(memberIdx);
    }

}
