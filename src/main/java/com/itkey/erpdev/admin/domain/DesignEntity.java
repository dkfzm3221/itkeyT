package com.itkey.erpdev.admin.domain;

import lombok.Data;

@Data
public class DesignEntity {

	private int designSeq;			// 순번
	private String type = "";		// 구분
	private String content = "";	// 내용
	private String updDt = "";		// 수정일자
	private String regId = "";		// 등록자ID
	private String updId = "";		// 수정자ID
}

