package com.itkey.erpdev.member.repository;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
import com.itkey.erpdev.member.dto.SNSInfo;

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
    //사용자 아이디 중복체크
    int memberIdCheck(String id);
    //사용자 정보 수정
    int updateMember(Member m);
    //사용자 정보 불러오기
    Member memberInfo(int memberIdx);
    //SNS 로그인(+가능 여부)
    MemberInfoResponse getSnsId(SNSInfo sDTO);
    //SNS로 가입
    int snsJoin(MemberInsert mDTO);
    //회원 탈퇴
    int deleteMember(Integer seq);
}
