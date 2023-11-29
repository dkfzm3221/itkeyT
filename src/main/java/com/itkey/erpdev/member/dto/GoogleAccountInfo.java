package com.itkey.erpdev.member.dto;

public class GoogleAccountInfo {
    private String iss; //토큰의 발급기관 또는 서명자
    private String azp; //선택사항. 토큰이 발급된 대상
    private String aud; //토큰의 사용 대상
    private String sub; //제목: 요청을 수행하는 주 구성원을 나타내는 ID
    private String email;
    private String email_verified; //사용자의 이메일 주소가 확인되면 true이고, 그렇지 않으면 false
    private String at_hash; //액세스 토큰 해시
    private String name;
    private String picture;
    private String given_name;
    private String family_name;
    private String locale; //BCP 47 언어 태그로 표현되는 사용자의 언어. name 클레임이 있는 경우 제공
    private String iat; //토큰이 발급된 Unix epoch 시간
    private String exp; //토큰이 만료되는 Unix epoch 시간
    private String alg;
    private String kid;
    private String typ;
}
