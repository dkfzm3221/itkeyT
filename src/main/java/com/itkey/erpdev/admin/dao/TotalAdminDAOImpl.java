package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSessionEvent;
import java.util.List;

@Repository
@AllArgsConstructor
public class TotalAdminDAOImpl implements TotalAdminDAO {

	SqlSessionTemplate sql;

	@Override
	public TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO) {
		return sql.selectOne("mapper.totalAdmin.getAdminInfo", adminDTO);
	}

	@Override
	public List<Board> getAdminBoardList() {
		return sql.selectList("mapper.totalAdmin.selectBoardTypeList");
	}

	@Override
	public List<Board> getBoardList() {
		return sql.selectList("mapper.totalAdmin.selectBoardList");
	}

	@Override
	public List<Visitor> mostVisitURL() {
		return sql.selectList("mapper.visitor.mostVisitURL");
	}

	@Override
	public List<Visitor> mostVisitIP() {
		return sql.selectList("mapper.visitor.mostVisitIP");
	}

	@Override
	public List<Visitor> mostVisitDate() {
		return sql.selectList("mapper.visitor.mostVisitDate");
	}

	@Override
	public List<Board> boardTypeCnt() {
		return sql.selectOne("mapper.totalAdmin.boardTypeCnt");
	}

	@Override
	public void adminWriteBoard(Board board) {
		sql.insert("mapper.totalAdmin.adminWriteBoard", board);
	}
}