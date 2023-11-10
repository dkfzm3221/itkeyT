package com.itkey.erpdev.customer.service;

import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.customer.domain.Customer;
import com.itkey.erpdev.customer.dto.*;
import com.itkey.erpdev.employee.domain.Employee;
import com.itkey.erpdev.project.dto.ProjDTO;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *packageName    : com.example.erpdev.company.service
 * fileName       : CustomerService
 * author         : AHN
 * date           : 2022-12-21
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
public interface CustomerService {

  List<CustList> custAll();

  int custJoinCheck(int bsnsNmbr);

  CustInfoResponse custInfo(int bsnsNmbr);

  int custJoinIdCheck(String cacId);

  int custJoin(CustJoinForm joinForm, CustSaveForm saveForm);

  CustInfoResponse login(CustLoginForm from, HttpSession session);

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
