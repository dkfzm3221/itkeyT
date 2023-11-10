package com.itkey.erpdev.customer.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *packageName    : com.itkey.erpdev.customer.dto
 * fileName       : custInfoResponse
 * author         : AHN
 * date           : 2023-02-02
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-02        AHN       최초 생성
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CustInfoResponse {
  Integer cacIdx;      //거래처 인덱스
  String cacId;
  String cacPw;
  String cacSalt;
  String Type;      //유저 타입 A: 관리자, E: 직원, C: 거래처

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

  String msg;

}
