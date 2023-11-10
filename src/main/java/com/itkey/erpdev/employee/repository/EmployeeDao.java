package com.itkey.erpdev.employee.repository;

import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.employee.dto.AbleList;
import java.util.List;

public interface EmployeeDao {

  List<AbleList> selectDashBoardList(Integer pageNum, Integer pageSize, SearchDto searchDto);
}
