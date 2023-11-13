package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dto.CommonDTO;

import java.util.List;


public interface CommonService {

  // gnb메뉴
  public List<CommonDTO> getGnbMenuListAjax();
}
