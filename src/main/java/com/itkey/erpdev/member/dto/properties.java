package com.itkey.erpdev.member.dto;

import lombok.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Data
public class properties {

    @Value("${google.client.id}")
    private String googleClient_id;

    @Value("${google.client.pw}")
    private String googleClient_pw;

    @Value("${kakao.client.id}")
    private String kakaoClient_id;
}
