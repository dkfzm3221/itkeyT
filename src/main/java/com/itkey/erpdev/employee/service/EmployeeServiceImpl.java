package com.itkey.erpdev.employee.service;

import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.employee.dto.AbleList;
import com.itkey.erpdev.employee.repository.EmployeeDao;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

  EmployeeDao eDao;

  @Override
  public List<AbleList> selectDashBoardList(Integer pageNum, Integer pageSize, SearchDto searchDto) {
    return eDao.selectDashBoardList(pageNum, pageSize, searchDto);
  }
}
