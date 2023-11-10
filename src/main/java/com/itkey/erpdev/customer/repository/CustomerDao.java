package com.itkey.erpdev.customer.repository;

import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.customer.dto.CustEmpList;
import com.itkey.erpdev.customer.dto.CustList;
import com.itkey.erpdev.customer.domain.Customer;
import com.itkey.erpdev.customer.dto.CustInfoResponse;
import com.itkey.erpdev.employee.domain.Employee;
import com.itkey.erpdev.project.dto.ProjDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *packageName    : com.example.erpdev.company.dao
 * fileName       : CustomerDao
 * author         : AHN
 * date           : 2022-12-21
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
public interface CustomerDao {

  List<CustList> custAll();


  int customerUpdate(Customer customer);

  int custJoinCheck(int bsnsNmbr);

  CustInfoResponse custInfo(int bsnsNmbr);

  int custJoinIdCheck(String cacId);

  int custJoin(Customer customer);

  String getSalt(Customer customer);

  int Login(Customer customer);

  CustInfoResponse custLoginInfo(Customer customer);

  List<ProjDTO> projSelectList(); //프로젝트 셀렉

  int projInsert(ProjDTO projDTO); //프로젝트 등록

  /*프로젝트 투입중인 인력 COUNT*/
  int inputManpowerCount(int custIdx);

  /*프로젝트 철수 인력 COUNT*/
  int evacuationManpowerCount(int custIdx);

  /*프로젝트 등록 건수 COUNT*/
  int projectCount(int custIdx);

  /*철수예정인력 COUNT*/
  int withdrawalScheduledCount(int custIdx);

  /*직원 목록(가용인력)*/
  List<CustEmpList> custAvailableList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session);

  /*인력검색 LIST*/
  List<CustEmpList> manpowerList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session);

  /*직원노출 여부(Y,N) UPDATE*/
  String updateStat(CustEmpList custEmpList);
}
