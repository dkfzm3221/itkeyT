package com.itkey.erpdev.admin.repository;

import com.github.pagehelper.PageHelper;
import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.SearchAdmin;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.customer.domain.Customer;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class AdminDaoImpl implements AdminDao {

    SqlSessionTemplate sql;

    @Override
    public int countAdmin() {
        return sql.selectOne("mapper.admin.countAdmin");
    }

    @Override
    public int insertAdmin(AdminInsert aDTO) {
        return sql.insert("mapper.admin.insertAdmin", aDTO);
    }

    @Override
    public List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {
        PageHelper.startPage(pageNum, pageSize);

        return sql.selectList("mapper.admin.adminList", searchAdmin);
    }

    @Override
    public TotalAdminDTO getLoginInfo(int adminIdx) {
        return sql.selectOne("mapper.admin.getLoginInfo", adminIdx);
    }

    @Override
    public int deleteAdmin(int adminIdx) {
        return sql.update("mapper.admin.deleteAdmin", adminIdx);
    }


}
