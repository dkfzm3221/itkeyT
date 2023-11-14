package com.itkey.erpdev.admin.service;

import java.util.List;

import com.itkey.erpdev.admin.dto.CommonDTO;
import com.itkey.erpdev.admin.dao.CommonDao;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CommonServiceImpl implements CommonService {

	CommonDao commonDAO;

	@Override
	public List<CommonDTO> getGnbMenuListAjax() {
		return commonDAO.getGnbMenuListAjax();
	}

	public List<CommonDTO> getMenuListAjax(){
		return commonDAO.getMenuListAjax();
	}
}
