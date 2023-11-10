package com.itkey.erpdev.employee.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class ProjectInOut {

  String empNm;
  String prjNm;
  LocalDate inpDt;
  LocalDate outDt;

}
