package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class Visit {

  Integer vstIdx;    //방문 인덱스
  Integer empIdx;    //직원 인덱스
  Integer deptIdx;   //부서 인덱스
  Integer compIdx;   //기업 인덱스
  Integer pstnIdx;   //직급 인덱스

  LocalDate vstDt;        //방문일자
  LocalDate regDt;        //등록일자자

}
