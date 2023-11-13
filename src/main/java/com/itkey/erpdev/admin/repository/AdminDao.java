package com.itkey.erpdev.admin.repository;

import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.SearchAdmin;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;

import java.util.List;

public interface AdminDao {

    int countAdmin();

    int insertAdmin(AdminInsert aDTO);

    List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin);

    TotalAdminDTO getLoginInfo(int adminIdx);

    int deleteAdmin(int adminIdx);
}
