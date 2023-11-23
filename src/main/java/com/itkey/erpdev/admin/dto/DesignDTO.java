package com.itkey.erpdev.admin.dto;

import lombok.Data;

@Data
public class DesignDTO {

	private int designSeq;			// 순번
	private String type = "";		// 구분
	private String content = "";	// 내용
	private String updDt = "";		// 수정일자
}

