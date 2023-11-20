package com.itkey.erpdev.member.repository;

import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
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
}
