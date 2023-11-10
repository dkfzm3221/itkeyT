package com.itkey.erpdev.employee.service;

import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.employee.dto.AbleList;
import java.util.List;

public interface EmployeeService {


  List<AbleList> selectDashBoardList(Integer pageNum, Integer pageSize, SearchDto searchDto);
}
