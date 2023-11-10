package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitList {

  Integer empIdx;
  String empNm;       //이름
  LocalDate cntDt;    //정규직 계약일
  String compNm;      //소속
  LocalDate inpDt;    //투입일자
  String prjNm;       //프로젝트명
  LocalDate vstDt;    //최근방문일자
  LocalDate watDt;    //차일수
}
