package com.itkey.erpdev.project.domain;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectPrice {

  Integer pmbIdx;
  Integer empIdx;
  Integer prjIdx;
  Integer deptIdx;
  Integer compIdx;
  Integer pstnIdx;
  Integer cstmIdx;

  String cstmNm;
  String empNm;
  String prjNm;

  Integer salesPrice;        //매출단가
  Integer taxPrice;        //매출단가(세금포함)
  Integer prchsPrice;        //매입단가
  Integer inpY;                 //투입년도
  Integer inpM;                 //투입월
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate regDt;                //등록일자
}
