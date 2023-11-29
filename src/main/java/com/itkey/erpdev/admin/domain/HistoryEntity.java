package com.itkey.erpdev.admin.domain;

import lombok.Data;

@Data
public class HistoryEntity {

	private int historySeq;				// 순번
	private String year = "";			// 연도
	private String month = "";			// 월
	private String useYn = "";			// 사용여부
	private String content = "";		// 내용
	private String regId = "";			// 등록자ID
	private String updId = "";			// 수정자ID
}

