package com.itkey.erpdev.member.service;

import com.itkey.erpdev.common.encryption.SHA256;
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
        mDTO.setMemberType("U");

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
        log.info("--new");
        String encPw = SHA256.getEncrypt(newPw, salt);

        MemberInsert mDTO = MemberInsert.builder()
                        .password(encPw)
                        .seq(seq)
                        .build();
        log.info("---MemberInsert---{}", mDTO);
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


}
