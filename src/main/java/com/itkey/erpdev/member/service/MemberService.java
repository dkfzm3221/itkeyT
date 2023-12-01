package com.itkey.erpdev.member.service;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.*;

import javax.servlet.http.HttpSession;

public interface MemberService {
    int memJoin(MemberInsert mDTO);

    MemberInfoResponse memlogin(Member m, HttpSession session);

    Member findId(Member mDTO);

    Member findPw(Member mDTO);

    int newPw(String salt, String newPw, Integer seq);

    int memberIdCheck(String id);

    int updateMember(Member m);

    Member memberInfo(int memberIdx);

    KakaoResponse getKakaoAccessToken(String code, String redirect_uri);

    KakaoAccountInfo getkakaoAcountInfo(KakaoResponse kDTO);

    MemberInfoResponse getSnsId(SNSInfo sDTO);

    GoogleResponse getGoogleAccessToken(String code, String redirect_uri);

    GoogleAccountInfo getGoogleAcountInfo(GoogleResponse gDTO);

    int snsJoin(MemberInsert mDTO);
}
