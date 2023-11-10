package com.itkey.erpdev.customer.service;

import com.itkey.erpdev.common.encryption.SHA256;
import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.customer.dto.*;
import com.itkey.erpdev.customer.repository.CustomerDao;
import com.itkey.erpdev.customer.domain.Customer;
import com.itkey.erpdev.employee.domain.Employee;
import com.itkey.erpdev.project.dto.ProjDTO;
import java.util.List;
import javax.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 *packageName    : com.example.erpdev.company.service
 * fileName       : CustomerServiceImpl
 * author         : AHN
 * date           : 2022-12-21
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
@Slf4j
@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {

  CustomerDao dao;

  @Override
  public List<CustList> custAll() {
    return dao.custAll();
  }

  @Override
  public int custJoinCheck(int bsnsNmbr) {
    return dao.custJoinCheck(bsnsNmbr);
  }

  @Override
  public CustInfoResponse custInfo(int bsnsNmbr) {
    return dao.custInfo(bsnsNmbr);
  }

  @Override
  public int custJoinIdCheck(String cacId) {
    return dao.custJoinIdCheck(cacId);
  }

  @Override
  public int custJoin(CustJoinForm joinForm, CustSaveForm saveForm) {
    Customer customer = new Customer();
    customer.setCustIdx(joinForm.getCustIdx());
    customer.setCacId(joinForm.getCacId());
    customer.setSalt(SHA256.generateSalt());
    String encPw = SHA256.getEncrypt(joinForm.getCacPw(), customer.getSalt());
    customer.setCacPw(encPw);

    int result = dao.custJoin(customer);
    if (result == 1) {
      Customer custSave = custInfo(saveForm);
      return dao.customerUpdate(custSave);
    }
    return 0;
  }

  @Override
  public CustInfoResponse login(CustLoginForm from, HttpSession session) {
    CustInfoResponse response = new CustInfoResponse();

    Customer customer = new Customer();
    customer.setCacId(from.getCacId());
    customer.setCacPw(from.getCacPw());
    String salt = dao.getSalt(customer);
    if (salt == null) {
      response.setMsg("아이디 혹은 암호가 잘못되었습니다.");
      return response;
    }
    customer.setSalt(salt);
    String encPw = SHA256.getEncrypt(customer.getCacPw(), customer.getSalt());
    customer.setCacPw(encPw);
    int loginResult = dao.Login(customer);
    log.info("result=={}", loginResult);
    if (loginResult == 0) {
      response.setMsg("아이디 혹은 암호가 잘못되었습니다.");
      return response;
    }
    response = dao.custLoginInfo(customer);
    session.setAttribute("custInfo", response);
    return response;
  }

  private Customer custInfo(CustSaveForm form) {
    Customer customer = new Customer();
    customer.setCustIdx(form.getCustIdx());
    customer.setCustNm(form.getCustNm());
    customer.setCeoNm(form.getCeoNm());
    customer.setZipCd(form.getZipCd());
    customer.setAdr1(form.getAdr1());
    customer.setAdr2(form.getAdr2());
    customer.setBsnsCndtn(form.getBsnsCndtn());
    customer.setBsnsTyp(form.getBsnsTyp());
    customer.setEmail(form.getEmail());
    customer.setPh(form.getPh());
    customer.setCeoBrth(form.getCeoBrth());
    customer.setState(form.getState());
    customer.setBsnsNmbr(form.getBsnsNmbr());
    customer.setBank(form.getBank());
    customer.setAcnHld(form.getAcnHld());
    return customer;
  }

  @Override
  public int projInsert(ProjDTO projDTO) {

    return dao.projInsert(projDTO);
  }

  @Override
  public List<ProjDTO> projSelectList() {

    return dao.projSelectList();
  }

  /*프로젝트 투입중인 인력 COUNT*/
  @Override
  public int inputManpowerCount(int custIdx){
    return dao.inputManpowerCount(custIdx);
  }

  /*프로젝트 철수 인력 COUNT*/
  @Override
  public int evacuationManpowerCount(int custIdx){
    return dao.evacuationManpowerCount(custIdx);
  }

  /*프로젝트 등록 건수 COUNT*/
  @Override
  public int projectCount(int custIdx){
    return dao.projectCount(custIdx);
  }

  /*철수예정인력 COUNT*/
  @Override
  public int withdrawalScheduledCount(int custIdx){
    return dao.withdrawalScheduledCount(custIdx);
  }

  /*직원 목록(가용인력)*/
  @Override
  public List<CustEmpList> custAvailableList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session){
    return dao.custAvailableList(pageNum, pageSize, searchDto, session);
  }

  /*인력검색 LIST*/
  @Override
  public List<CustEmpList> manpowerList(int pageNum, int pageSize, SearchDto searchDto, HttpSession session){
    return dao.manpowerList(pageNum, pageSize, searchDto, session);
  }


  /*직원노출 여부(Y,N) UPDATE*/
  @Override
  public String updateStat(CustEmpList custEmpList){
    return dao.updateStat(custEmpList);
  }





}

