package com.itkey.erpdev.member.service;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;

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
}
