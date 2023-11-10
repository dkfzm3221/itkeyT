package com.itkey.erpdev.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *packageName    : com.example.erpdev.project.dto
 * fileName       : priceTableRequest
 * author         : AHN
 * date           : 2023-01-10
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-01-10        AHN       최초 생성
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PriceTableRequest {

  Integer compIdx;//소속회사
  Integer inpY;//년
  Integer inpM;//월
}
