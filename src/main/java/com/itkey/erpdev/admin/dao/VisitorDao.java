package com.itkey.erpdev.admin.dao;

import com.itkey.erpdev.admin.dto.Visitor;

public interface VisitorDao {
    void saveVisitor(Visitor visitor);

    Visitor selectById(Long id);
}
