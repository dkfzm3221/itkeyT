package com.itkey.erpdev.member.dto;

import lombok.*;

import java.sql.Date;
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberInsert {
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
    String salt;

}
