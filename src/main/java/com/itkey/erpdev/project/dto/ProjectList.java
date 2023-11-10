package com.itkey.erpdev.project.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *packageName    : com.example.erpdev.project.dto
 * fileName       : ProjectAll
 * author         : AHN
 * date           : 2022-12-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-26        AHN       최초 생성
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("ProjectList")
public class ProjectList {

  Integer prjIdx;
  String prjNm; //프로젝트명
  String empNm; //진행자 리스트
  String cstmNm; //거래처
  String Memo; // 메모
  String status;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate strDt; //시작일자
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate endDt; //종료일자
}
