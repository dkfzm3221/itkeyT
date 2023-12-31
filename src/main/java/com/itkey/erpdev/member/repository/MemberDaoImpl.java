package com.itkey.erpdev.member.repository;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
import com.itkey.erpdev.member.dto.SNSInfo;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class MemberDaoImpl implements MemberDao{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    SqlSessionTemplate sql;
    // 사용자 회원가입
    @Override
    public int memJoin(MemberInsert mDTO) {
        return sql.insert("mapper.member.memJoin", mDTO);
    }
    //salt 가져오기
    @Override
    public String getSalt(Member m) {
        return sql.selectOne("mapper.member.getSalt", m);
    }
    // 사용자 로그인
    @Override
    public int memLogin(Member m) {
        return sql.selectOne("mapper.member.memLogin", m);
    }
    //로그인 유저 정보 가져오기
    @Override
    public MemberInfoResponse memLoginInfo(Member m) {
        return sql.selectOne("mapper.member.memLoginInfo", m);
    }
    //아이디 찾기
    @Override
    public Member findId(Member mDTO) {return sql.selectOne("mapper.member.findId", mDTO);}
    //비밀번호 찾기
    @Override
    public Member findPw(Member mDTO) {
        return sql.selectOne("mapper.member.findPw", mDTO);
    }
    //비밀번호 재발급
    @Override
    public int newPw(MemberInsert mDTO) {
        return sql.update("mapper.member.newPw", mDTO);
    }
    //사용자 아이디 중복체크
    @Override
    public int memberIdCheck(String id) {
        return sql.selectOne("mapper.member.memberIdCheck", id);
    }
    //사용자 정보 수정
    @Override
    public int updateMember(Member m) {
        return sql.update("mapper.member.updateMember", m);
    }
    //사용자 정보 불러오기
    @Override
    public Member memberInfo(int memberIdx) {
        return sql.selectOne("mapper.member.memberInfo", memberIdx);
    }
    //SNS로 로그인
    @Override
    public MemberInfoResponse getSnsId(SNSInfo sDTO) {
        return sql.selectOne("mapper.member.getSnsId", sDTO);
    }
    //SNS로 가입
    @Override
    public int snsJoin(MemberInsert mDTO) {
        return sql.insert("mapper.member.snsJoin", mDTO);
    }
    //회원 탈퇴
    @Override
    public int deleteMember(Integer seq) {
        return sql.delete("mapper.member.deleteMember", seq);
    }


}
