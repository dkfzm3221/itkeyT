package com.itkey.erpdev.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TotalAdminDTO {

	private int seq;				// 사용자 일련번호
	private String id;				// 사용자 ID
	private String password;		// 비밀번호
	private String name;			// 사용자명
	private String hp;				// 핸드폰 번호
	private String email;			// 이메일
	private String authCode;		// 권한그룹
	private String memberType;		// 회원타입
	private String memberStatus;	// 회원상태
	private String useYn;			// 사용여부
	private Date passwordUpdDt;	// 비밀번호 변경일시
	private Date lastCntnDt;		// 최종접속일시
	private String whdwlRsn;		// 탈퇴사유
	private Date whdwlYmd;			// 탈퇴일자
	private Date joinAplyPrcsDt;	// 가입신청처리일시
	private String regId;			// 등록자 ID
	private String regNm;			// 등록자명
	private Date regDt;				// 등록일자
	private String updId;			// 수정자 ID
	private String updNm;			// 수정자명
	private Date updDt;				// 수정일자
}
