package com.itkey.erpdev.employee.repository;

import com.github.pagehelper.PageHelper;
import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.employee.dto.AbleList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Slf4j
@Repository
@AllArgsConstructor
public class EmployeeDaoImpl implements EmployeeDao {

  SqlSessionTemplate sql;


  @Override
  public List<AbleList> selectDashBoardList(Integer pageNum, Integer pageSize, SearchDto searchDto) {
    PageHelper.startPage(pageNum, pageSize);
    return sql.selectList("mapper.employee.selectDashBoardList", searchDto);
  }
}
