package com.itkey.erpdev.member.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class KakaoAcountInfo {
    private Long id;//회원번호
    private Boolean has_signed_up;//자동 연결 설정을 비활성화한 경우만 존재 연결하기 호출의 완료 여부
    private Date connected_at;//서비스에 연결 완료된 시각, UTC*	X
    private Date synched_at;//카카오싱크 간편가입을 통해 로그인한 시각, UTC*	X
    private kakaoAccount kakao_account;//카카오 계정 정보


    @Data
    public class kakaoAccount{
        private boolean profile_needs_agreement;//사용자 동의 시 프로필정보(닉네임/사진)
        private boolean profile_nickname_needs_agreement;//닉네임
        private boolean profile_image_needs_agreement;
        private Profile profile;//프로필정보

        @Data
        class Profile {
            private String nickname;
            private String thumbnail_image_url;
            private boolean is_default_image;
        }

        private boolean name_needs_agreement;
        private String name;

        private boolean email_needs_agreement;
        private Boolean is_email_valid;
        private String email;

    }

}
