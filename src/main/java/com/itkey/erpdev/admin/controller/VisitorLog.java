package com.itkey.erpdev.admin.controller;

import com.itkey.erpdev.admin.dao.VisitorDao;
import com.itkey.erpdev.admin.dto.Visitor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;


@RestController
@RequestMapping("/record")
public class VisitorLog{
    private final VisitorDao visitorDao;

    public VisitorLog(VisitorDao visitorDao) {
        this.visitorDao = visitorDao;
    }


    /**
    *
    * VisitorLog
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 로그 저장
    *
    **/
    @PostMapping(value = "/visitorLog")
    public Visitor create(@RequestBody Visitor visitor) {
        visitor.setVisitTime(LocalDateTime.now());
        visitorDao.saveVisitor(visitor);
        return visitor;
    }

    @GetMapping("/{id}")
    public Visitor getById(@PathVariable Long id) {
        return visitorDao.selectById(id);
    }
}
