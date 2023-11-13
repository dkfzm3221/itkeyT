package com.itkey.erpdev.admin.dao;

import com.itkey.erpdev.admin.dto.CommonDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@AllArgsConstructor
public class CommonDaoImpl implements CommonDao {

  SqlSessionTemplate sql;

  @Override
  public List<CommonDTO> getGnbMenuListAjax(){
    return sql.selectList("mapper.totalAdmin.getGnbMenuListAjax");
  }

}

