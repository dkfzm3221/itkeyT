package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpList {

  Integer empIdx;
  String empNm;
  String compNm;
  String deptNm;
  String ph;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate cntDt;

  Integer workY;
  Integer workM;

  Integer eduBckGubun;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate eduBckGrdtnDay;

  String gisaYn;

  Integer deptIdx;
  Integer deptCnt;

}
