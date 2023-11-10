package com.itkey.erpdev.customer.domain;

import java.time.LocalDate;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Customer {

  String cacId;
  String cacPw;
  String salt;
  Integer cacIdx;
  String type;

  Integer custIdx;      //거래처 인덱스
  String custNm;        //상호명
  String ceoNm;         //대표명
  Integer zipCd;        //우편번호
  String adr1;          //주소
  String adr2;          //상세주소
  String bsnsCndtn;     //업태
  String bsnsTyp;       //종목
  String email;         //이메일
  Integer ph;           //휴대폰
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate ceoBrth;         //대표생일
  String state;         //거래상태
  Integer bsnsNmbr;     //사업자번호
  String bank;          //거래은행
  Integer acntNmbr;     //계좌번호
  String acnHld;        //계좌주
  String memo;          //메모
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate regDt;           //등록일자
}