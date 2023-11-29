package com.itkey.erpdev.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GoogleResponse {
    private String token_type;  //토큰 타입, bearer로 고정
    private String access_token; //사용자 액세스 토큰 값
    private String expires_in;   //액세스 토큰과 ID 토큰의 만료 시간(초) 참고: 액세스 토큰과 ID 토큰의 만료 시간은 동일
    private String refresh_token;   //리프레시 토큰 만료 시간(초)
    private String scope;
    private String id_token;

}
