package com.itkey.erpdev.employee.dto;

import com.github.pagehelper.PageInfo;
import java.time.LocalDate;

import com.itkey.erpdev.common.masking.MaskingUtil;
import com.itkey.erpdev.common.masking.MaskString;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *packageName    : com.itkey.erpdev.employee.dto
 * fileName       : AbleList
 * author         : AHN
 * date           : 2023-02-09
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-09        AHN       최초 생성
 */

@Data
public class AbleList {
  /*
   *  이름, 소속, 연차 , 지역, 인터뷰 가능일자, 투입가능일자, 상태(즉시, 협의)
   *  부서, 기사 여부 ,가용인력 노출상태
   * */

  Integer empIdx;
  @MaskString
  String empNm; //이름
  String compNm;// 소속
  String deptNm; //부서
  Integer workY;  //경력 연
  Integer workM;  //경력 월
  Integer workYF; //가경력 연
  Integer workMF; //가경력 월
  String area;   //지역
  LocalDate intrvDt;//인터뷰 가능일자
  LocalDate ableDt;//투입가능일자
  Integer ableState;// 상태(즉시 0, 협의1)
  String gisaYn;// 기사여부
  Integer ableShow;// ,가용인력 노출상태 (노출 0 미노출 1)
  LocalDate entDt;
  String skill;

  PageInfo pageInfo;

  public void setEmpNm(String empNm) {
    this.empNm = MaskingUtil.maskStringField(AbleList.class, "empNm", empNm);
  }
}
