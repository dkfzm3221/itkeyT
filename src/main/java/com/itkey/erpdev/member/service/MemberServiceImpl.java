package com.itkey.erpdev.member.service;

import com.itkey.erpdev.common.encryption.SHA256;
import com.itkey.erpdev.customer.domain.Customer;
import com.itkey.erpdev.customer.dto.CustJoinForm;
import com.itkey.erpdev.customer.dto.CustSaveForm;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
import com.itkey.erpdev.member.repository.MemberDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Slf4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

    MemberDao dao;
    //일반 회원 가입
    @Override
    public int memJoin(MemberInsert mDTO) {

        mDTO.setSalt(SHA256.generateSalt());
        String encPw = SHA256.getEncrypt(mDTO.getPassword(), mDTO.getSalt());
        mDTO.setPassword(encPw);
        mDTO.setAuthCode("member");

        return dao.memJoin(mDTO);

    }
    //일반 회원 로그인
    @Override
    public MemberInfoResponse memlogin(Member m, HttpSession session) {
        MemberInfoResponse response  = new MemberInfoResponse();

        String salt = dao.getSalt(m);
        if (salt == null) {
            return response;
        }

        m.setSalt(salt);
        String encPw = SHA256.getEncrypt(m.getPassword(), m.getSalt());
        m.setPassword(encPw);
        int loginResult = dao.memLogin(m);

        if (loginResult == 0) {
            return response;
        }
        response = dao.memLoginInfo(m);
        session.setAttribute("memInfo", response);
        return response;

    }
}
