package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *packageName    : com.example.erpdev.company.dto
 * fileName       : retireList
 * author         : AHN
 * date           : 2022-12-21
 * description    : 퇴사자 리스트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-21        AHN       최초 생성
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RetireList {
  String empNm;
  String compNm;
  Integer finalEdu;
  String major;
  LocalDate outDt;
  Integer workY;
  Integer workM;
}
