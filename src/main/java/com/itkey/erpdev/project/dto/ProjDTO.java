package com.itkey.erpdev.project.dto;

import java.util.Date;
import lombok.Data;

/**
 *packageName    : com.itkey.erpdev.project.dto
 * fileName       : ProjDTO
 * author         : AHN
 * date           : 2023-02-09
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-09        AHN       최초 생성
 */
@Data
public class ProjDTO {

  String prjNm;
  String reqSkill;
  String memo;
  String prjAdr;
  //Date str_dt;
  //Date end_dt;
  Date regDt;
  Boolean delYn;
  Integer lv1;
  Integer lv2;
  Integer lv3;
  Integer cpIdx;

}

