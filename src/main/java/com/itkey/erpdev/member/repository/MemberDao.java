package com.itkey.erpdev.member.repository;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;

public interface MemberDao {
    //회원가입
    int memJoin(MemberInsert mDTO);
    //salt 가져오기
    String getSalt(Member m);
    //로그인
    int memLogin(Member m);
    //로그인 유저 정보 불러오기
    MemberInfoResponse memLoginInfo(Member m);
    //아이디 찾기
    Member findId(Member mDTO);
    //비밀번호 찾기
    Member findPw(Member mDTO);
    //비밀번호 재발급
    int newPw(MemberInsert mDTO);

    int memberIdCheck(String id);
}
