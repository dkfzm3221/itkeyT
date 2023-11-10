package com.itkey.erpdev.project.service;

import com.itkey.erpdev.project.domain.ProjectPrice;
import com.itkey.erpdev.project.dto.PriceTableRequest;
import com.itkey.erpdev.project.dto.ProjectList;
import java.util.List;

/**
 *packageName    : com.example.erpdev.company.service
 * fileName       : ProjectService
 * author         : AHN
 * date           : 2022-12-23
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-23        AHN       최초 생성
 */
public interface ProjectService {

  List<ProjectList> projectAll();

  List<ProjectList> projectProg();

  List<ProjectList> projectEnd();

  List<ProjectPrice> priceTable(PriceTableRequest request);
}
