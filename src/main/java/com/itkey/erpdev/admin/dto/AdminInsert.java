package com.itkey.erpdev.admin.dto;

import lombok.*;

import java.sql.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminInsert {
    Integer seq;
    String id;
    String password;
    String name;
    String hp;
    String email;
    String authCode;//권한그룹
    String memberType;//회원타입
    String memberStatus;
    String useYN;

    String regId;//등록자 Id;
    String regNm;//등록자명
    Date regDt;//등록일자






}
