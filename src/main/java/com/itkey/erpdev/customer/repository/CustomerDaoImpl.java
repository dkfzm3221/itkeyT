package com.itkey.erpdev.customer.repository;

import com.github.pagehelper.PageHelper;
import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.customer.dto.CustEmpList;
import com.itkey.erpdev.customer.dto.CustList;
import com.itkey.erpdev.customer.domain.Customer;
import com.itkey.erpdev.customer.dto.CustInfoResponse;
import com.itkey.erpdev.employee.domain.Employee;
import com.itkey.erpdev.project.dto.ProjDTO;
import java.util.List;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;

/**
 *packageName    : com.example.erpdev.company.dao
 * fileName       : CustomerDaoImpl
 * author         : AHN
 * date           : 2022-12-21
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
@Repository
@AllArgsConstructor
public class CustomerDaoImpl implements CustomerDao {

  SqlSessionTemplate sql;

  @Override
  public List<CustList> custAll() {
    return sql.selectList("mapper.customer.custAll");
  }

  @Override
  public int customerUpdate(Customer customer) {
    return sql.update("mapper.customer.customerUpdate", customer);
  }

  @Override
  public int custJoinCheck(int bsnsNmbr) {
    return sql.selectOne("mapper.customer.custJoinCheck", bsnsNmbr);
  }

  @Override
  public CustInfoResponse custInfo(int bsnsNmbr) {
    return sql.selectOne("mapper.customer.custInfo", bsnsNmbr);
  }

  @Override
  public int custJoinIdCheck(String cacId) {
    return sql.selectOne("mapper.customer.custJoinIdCheck", cacId);
  }

  @Override
  public int custJoin(Customer customer) {
    return sql.insert("mapper.customer.custJoin", customer);
  }

  @Override
  public String getSalt(Customer customer) {
    return sql.selectOne("mapper.customer.getSalt", customer);
  }

  @Override
  public int Login(Customer customer) {
    return sql.selectOne("mapper.customer.Login", customer);
  }

  @Override
  public CustInfoResponse custLoginInfo(Customer customer) {
    return sql.selectOne("mapper.customer.custLoginInfo", customer);
  }

  @Override
  public int projInsert(ProjDTO projDTO) {
    int projInsert = sql.insert("mapper.customer.projInsert", projDTO);
    return sql.insert("mapper.customer.projGradeInsert", projDTO);
  }

  @Override
  public List<ProjDTO> projSelectList() {
    return sql.selectList("mapper.customer.projectSelectList");
  }

  /*프로젝트 투입중인 인력 COUNT*/
  @Override
  public int inputManpowerCount(int custIdx){
    return sql.selectOne("mapper.customer.inputManpowerCount",custIdx);
  }

  /*프로젝트 철수 인력 COUNT*/
  @Override
  public int evacuationManpowerCount(int custIdx){
    return sql.selectOne("mapper.customer.evacuationManpowerCount", custIdx);
  }

  /*프로젝트 등록 건수 COUNT*/
  @Override
  public int projectCount(int custIdx){
    return sql.selectOne("mapper.customer.projectCount", custIdx);
  }

  /*철수예정인력 COUNT*/
  @Override
  public int withdrawalScheduledCount(int custIdx){
    return sql.selectOne("mapper.customer.withdrawalScheduledCount", custIdx);
  }

  /*직원 목록(가용인력)*/
  @Override
  public List<CustEmpList> custAvailableList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session){
    PageHelper.startPage(pageNum, pageSize);
    CustInfoResponse response = (CustInfoResponse) session.getAttribute("custInfo");

    int custIdx = response.getCustIdx();

    searchDto.setCustIdx(custIdx);
    return sql.selectList("mapper.customer.custAvailableList", searchDto);
  }

  /*인력검색 LIST*/
  @Override
  public List<CustEmpList> manpowerList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session){
    PageHelper.startPage(pageNum, pageSize);
    CustInfoResponse response = (CustInfoResponse) session.getAttribute("custInfo");

    int custIdx = response.getCustIdx();

    searchDto.setCustIdx(custIdx);
    return sql.selectList("mapper.customer.manpowerList", searchDto);
  }

  /*직원노출 여부(Y,N) UPDATE*/
  @Override
  public String updateStat(CustEmpList custEmpList){
    return String.valueOf(sql.update("mapper.customer.statChange", custEmpList));
  }



}
