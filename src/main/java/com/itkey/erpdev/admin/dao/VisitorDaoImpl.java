package com.itkey.erpdev.admin.dao;

import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
@AllArgsConstructor
public class VisitorDaoImpl implements VisitorDao {
    SqlSessionTemplate sql;

    @Override
    public void saveVisitor(@RequestBody Visitor visitor) {
        sql.insert("mapper.visitor.saveVisitor", visitor);
    }

    @Override
    public Visitor selectById(@PathVariable Long id) {
        return sql.selectOne("mapper.visitor.selectById", id);
    }
}
