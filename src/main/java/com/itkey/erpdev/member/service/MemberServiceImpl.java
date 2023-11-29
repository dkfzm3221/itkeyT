package com.itkey.erpdev.member.service;

import com.itkey.erpdev.common.encryption.SHA256;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.*;
import com.itkey.erpdev.member.repository.MemberDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

@Slf4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    MemberDao dao;
    //일반 회원 가입
    @Override
    public int memJoin(MemberInsert mDTO) {

        mDTO.setSalt(SHA256.generateSalt());
        String encPw = SHA256.getEncrypt(mDTO.getPassword(), mDTO.getSalt());
        mDTO.setPassword(encPw);
        mDTO.setMemberType("U");

        return dao.memJoin(mDTO);

    }
    //일반 회원 로그인
    @Override
    public MemberInfoResponse memlogin(Member m, HttpSession session) {
        MemberInfoResponse response  = new MemberInfoResponse();

        String salt = dao.getSalt(m);
        //로그인 불가능
        if (salt == null) {
            return response;
        }
        
        m.setSalt(salt);
        String encPw = SHA256.getEncrypt(m.getPassword(), m.getSalt());
        m.setPassword(encPw);
        int loginResult = dao.memLogin(m);
        //로그인 불가능
        if (loginResult == 0) {
            return response;
        }
        //로그인 가능
        response = dao.memLoginInfo(m);
        return response;
    }
    // 아이디 찾기
    @Override
    public Member findId(Member mDTO) {
        return dao.findId(mDTO);
    }
    //비밀번호 찾기
    @Override
    public Member findPw(Member mDTO) {
        return dao.findPw(mDTO);
    }
    //비밀번호 재발급
    @Override
    public int newPw(String salt, String newPw, Integer seq) {

        String encPw = SHA256.getEncrypt(newPw, salt);

        MemberInsert mDTO = MemberInsert.builder()
                        .password(encPw)
                        .seq(seq)
                        .build();

        return dao.newPw(mDTO);
    }
    //사용자 아이디 중복체크
    @Override
    public int memberIdCheck(String id) {
        return dao.memberIdCheck(id);
    }
    //사용자 정보 수정
    @Override
    public int updateMember(Member m) {
        if(!"".equals(m.getPassword())){
            String salt = dao.getSalt(m);
            String encPw = SHA256.getEncrypt(m.getPassword(), salt);

            m.setPassword(encPw);
        }
        return dao.updateMember(m);
    }
    //사용자 정보 불러오기
    @Override
    public Member memberInfo(int memberIdx) {
        return dao.memberInfo(memberIdx);
    }

    //카카오 토큰 가져오기
    @Override
    public KakaoResponse getKakaoAccessToken(String code) {

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("grant_type", "authorization_code");
        params.add("client_id","b5b49c204b8252329bb89fa1fd9cc45e");
        params.add("redirect_uri", "http://localhost:8888/mem/kakaoLogin");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        RestTemplate restTemplate = new RestTemplate();
        String url = "https://kauth.kakao.com/oauth/token";

        KakaoResponse kDTO = restTemplate.postForObject(url, body, KakaoResponse.class);
        logger.info("kakaoResponse: {}", kDTO);
        return kDTO;
    }
    //카카오에서 정보 가져오기
    @Override
    public KakaoAcountInfo getkakaoAcountInfo(KakaoResponse kDTO) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        headers.add("Authorization", "Bearer "+ kDTO.getAccess_token());

        HttpEntity<MultiValueMap<String, String>> header = new HttpEntity<>(headers);

        RestTemplate restTemplate = new RestTemplate();
        String url = "https://kapi.kakao.com/v2/user/me";

        KakaoAcountInfo kaDTO = restTemplate.postForObject(url, header, KakaoAcountInfo.class);
        logger.info("KakaoAcountInfo1 : {}", kaDTO);

        return kaDTO;
    }
    //카카오 로그인
    @Override
    public MemberInfoResponse getKakaoId(Long kakaoId) {
        return dao.getKakaoId(kakaoId);
    }

    //구글 토근 가져오기
    @Override
    public GoogleResponse getGoogleAccessToken(String code) {

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("grant_type", "authorization_code");
        params.add("clientId","1069124062680-3bu27g8kvtbeudanv8clutbt9mdeh22d.apps.googleusercontent.com");
        params.add("clientSecret","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");
        params.add("redirect_uri", "http://localhost:8888/mem/googleLogin");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        RestTemplate restTemplate = new RestTemplate();
        String url = "https://oauth2.googleapis.com/token";

        GoogleResponse gDTO = restTemplate.postForObject(url, body, GoogleResponse.class);
        logger.info("googleResponse: {}", gDTO);
        return gDTO;
    }



}
