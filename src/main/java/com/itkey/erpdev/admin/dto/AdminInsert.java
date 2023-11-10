package com.itkey.erpdev.admin.dto;

import lombok.*;

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
    String userYN;



}
