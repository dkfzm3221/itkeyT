package com.itkey.erpdev.member.service;

import com.itkey.erpdev.customer.dto.CustInfoResponse;
import com.itkey.erpdev.customer.dto.CustJoinForm;
import com.itkey.erpdev.customer.dto.CustSaveForm;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;

import javax.servlet.http.HttpSession;

public interface MemberService {
    int memJoin(MemberInsert mDTO);

    MemberInfoResponse memlogin(Member m, HttpSession session);
}
