package com.itkey.erpdev.admin.dto;

import lombok.Data;

@Data
public class HistoryDTO {

	private int historySeq;			// 순번
	private String year;			// 연도
	private String month;			// 월
	private String content = "";	// 내용
}

