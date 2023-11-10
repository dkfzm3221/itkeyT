package com.itkey.erpdev.customer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *packageName    : com.example.erpdev.company.dto.Customer
 * fileName       : CustList
 * author         : AHN
 * date           : 2022-12-21
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustList {

  /*사업자번호, 대표자, 이메일, 연락처, 주소, 상태*/
  String custmNm;        //상호명
  String ceoNm;         //대표명
  String adr1;          //주소
  String adr2;          //상세주소
  String email;         //이메일
  Integer ph;           //휴대폰
  String state;         //거래상태
  Integer bsnsNmbr;     //사업자번호

}
