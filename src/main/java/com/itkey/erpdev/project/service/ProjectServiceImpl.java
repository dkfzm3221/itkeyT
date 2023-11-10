package com.itkey.erpdev.project.service;

import com.itkey.erpdev.project.domain.ProjectPrice;
import com.itkey.erpdev.project.dto.PriceTableRequest;
import com.itkey.erpdev.project.dto.ProjectList;
import com.itkey.erpdev.project.repository.ProjectDao;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 *packageName    : com.example.erpdev.project.service
 * fileName       : ProjectServiceImpl
 * author         : AHN
 * date           : 2022-12-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-26        AHN       최초 생성
 */
@Slf4j
@Service
@AllArgsConstructor
public class ProjectServiceImpl implements ProjectService {

  ProjectDao pdao;

  @Override
  public List<ProjectList> projectAll() {
    return pdao.projectAll();
  }

  @Override
  public List<ProjectList> projectProg() {
    return pdao.projectProg();
  }

  @Override
  public List<ProjectList> projectEnd() {
    return pdao.projectEnd();
  }

  @Override
  public List<ProjectPrice> priceTable(PriceTableRequest request) {
    ProjectPrice price = new ProjectPrice();
    price.setCompIdx(request.getCompIdx());
    price.setInpY(request.getInpY());
    price.setInpM(request.getInpM());
    return pdao.priceTable(price);

  }
}
