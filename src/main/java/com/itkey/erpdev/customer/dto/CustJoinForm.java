package com.itkey.erpdev.customer.dto;

import java.time.LocalDate;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *packageName    : com.itkey.erpdev.customer.dto
 * fileName       : CustJoinFrom
 * author         : AHN
 * date           : 2023-02-02
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-02        AHN       최초 생성
 */
@Data
public class CustJoinForm {

  String cacId;
  String cacPw;
  String cacSalt;
  Integer custIdx;


}
