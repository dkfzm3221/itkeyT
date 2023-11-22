package com.itkey.erpdev.member.domain;

import lombok.Data;

import java.sql.Date;
@Data
public class Member {
    Integer seq;
    String id;
    String password;
    String name;
    String hp;
    String email;
    String authCode;//권한그룹
    String memberType;//회원타입 A : 관리자 U : 사용자
    String memberStatus;//회원상태 B: 차단, D : 디폴트
    String useYn;//사용여부
    Date passwordUpdDt;//비밀번호 변경일시
    Date lastCntnDt;//최종접속일시

    String whdwlRsn;//탈퇴사유
    Date whdwlYmd;//탈퇴일자

    Date joinAplyPrcsDt;//가입신청처리일시;
    String regId;//등록자 Id;
    String regNm;//등록자명
    Date regDt;//등록일자

    String updId;//수정자Id
    String updNm;//수정자명
    Date updDt;//수정일자

    String blockRsn;//차단사유
    String blockYmd;//차단일자

    Integer rowNum;
    String salt;
}
