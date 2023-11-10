package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.Data;

/**
 *packageName    : com.example.erpdev.company.dto
 * fileName       : EmpInputList
 * author         : AHN
 * date           : 2022-12-15
 * description    :
 * 직원 인덱스,종류(상태), 소속, 프로젝트명, 거래처, 투입일, 철수일, 단가(총매입, 총매출)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-15        AHN       최초 생성
 */
@Data
public class EmpInputHistory {


  Integer status; //투입 1, 철수 2, 철수중 3
  String compNm;
  String prjNm;
  String cstmNm;
  LocalDate inpDt;
  LocalDate outDt;
  Integer totalSales; //총매출
  Integer totalPrchs; //총매입
}
