package com.itkey.erpdev.project.repository;

import com.itkey.erpdev.project.domain.ProjectPrice;
import com.itkey.erpdev.project.dto.ProjectList;
import java.util.List;

/**
 *packageName    : com.example.erpdev.project.repository
 * fileName       : ProjectDao
 * author         : AHN
 * date           : 2022-12-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-26        AHN       최초 생성
 */
public interface ProjectDao {

  List<ProjectList> projectAll();

  List<ProjectList> projectProg();

  List<ProjectList> projectEnd();

  List<ProjectPrice> priceTable(ProjectPrice price);
}
