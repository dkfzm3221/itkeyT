package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.SearchAdmin;

import java.util.List;

public interface AdminService {

    int countAdmin();

    int insertAdmin(AdminInsert aDTO);

    List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin);
}
