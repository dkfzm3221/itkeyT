package com.itkey.erpdev.project.repository;

import com.itkey.erpdev.project.domain.ProjectPrice;
import com.itkey.erpdev.project.dto.ProjectList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 *packageName    : com.example.erpdev.project.repository
 * fileName       : ProjectDaoImpl
 * author         : AHN
 * date           : 2022-12-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-26        AHN       최초 생성
 */
@Slf4j
@Repository
@AllArgsConstructor
public class ProjectDaoImpl implements ProjectDao {

  SqlSessionTemplate sql;

  @Override
  public List<ProjectList> projectAll() {
    return sql.selectList("mapper.project.projectAll");
  }

  @Override
  public List<ProjectList> projectProg() {
    return sql.selectList("mapper.project.projectProg");
  }

  @Override
  public List<ProjectList> projectEnd() {
    return sql.selectList("mapper.project.projectEnd");
  }

  @Override
  public List<ProjectPrice> priceTable(ProjectPrice price) {
    return sql.selectList("mapper.project.priceTable", price);
  }
}

