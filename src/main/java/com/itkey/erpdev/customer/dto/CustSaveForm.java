package com.itkey.erpdev.customer.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class CustSaveForm {

  Integer custIdx;
  String custNm;        //상호명
  String ceoNm;         //대표명
  Integer zipCd;        //우편번호
  String adr1;          //주소
  String adr2;          //상세주소
  String bsnsCndtn;     //업태
  String bsnsTyp;       //종목
  String email;         //이메일
  Integer ph;           //휴대폰
  LocalDate ceoBrth;         //대표생일
  String state;         //거래상태
  Integer bsnsNmbr;     //사업자번호
  String bank;          //거래은행
  Integer acntNmbr;     //계좌번호
  String acnHld;        //계좌주
  String memo;          //메모
  LocalDate regDt;           //등록일자
}