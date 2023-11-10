package com.itkey.erpdev.project.domain;

import java.time.LocalDate;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class Project {

  Integer prjIdx;       //프로젝트 인덱스
  Integer cstmIdx;      //거래처 인덱스

  String prjNm;         //프로젝트 명
  String ordCom;        //발주사
  String skill;         //요구스킬
  Integer zipCd;        //우편번호
  String adr1;          //주소
  String adr2;          //상세주소
  String memo;          //메모

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate strDt;           //시작일
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate endDt;           //종료일
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate regDt;           //등록일자

}
