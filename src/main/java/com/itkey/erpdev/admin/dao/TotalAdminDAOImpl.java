package com.itkey.erpdev.admin.dao;


import com.github.pagehelper.PageHelper;
import com.itkey.erpdev.admin.domain.*;
import com.itkey.erpdev.admin.dto.*;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.member.domain.Member;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSessionEvent;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int updMenuMgmtAjax(List<MenuEntity> menuEntityList) {
		return sql.update("mapper.totalAdmin.updMenuMgmtAjax", menuEntityList);
	}

	@Override
	public List<Board> boardTypeCnt() {
		return sql.selectOne("mapper.totalAdmin.boardTypeCnt");
	}

	@Override
	public void adminWriteBoard(Board board) {
		sql.insert("mapper.totalAdmin.adminWriteBoard", board);

	}

	@Override
	public int getMenuListCntAjax() {
		return sql.selectOne("mapper.totalAdmin.getMenuListCntAjax");
	}

	@Override
	public int delBoardAjax(List<MenuEntity> menuEntityList, String id) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("menuEntityList", menuEntityList);
		paramMap.put("id", id);

		return sql.update("mapper.totalAdmin.delBoardAjax", paramMap);
	}

	@Override
	public List<Banner> getBannerList() throws Exception {
		return sql.selectList("mapper.totalAdmin.getBannerList");
	}

	@Override
	public void saveBanner(Banner banner) throws Exception {
		sql.insert("mapper.totalAdmin.saveBanner", banner);
	}

	@Override
	public void saveFile(FileDto fileDto) {
		sql.insert("mapper.totalAdmin.saveFile", fileDto);
	}

	@Override
	public void updateFile(FileDto fileDto) throws Exception {
		sql.update("mapper.totalAdmin.updateFile", fileDto);
	}

	@Override
	public void updateBanner(Banner newBanner) throws Exception {
		sql.update("mapper.totalAdmin.updateBanner", newBanner);
	}

	@Override
	public int countAdmin() {
		return sql.selectOne("mapper.totalAdmin.countAdmin");
	}

	@Override
	public int insertAdmin(AdminInsert aDTO) {
		return sql.insert("mapper.totalAdmin.insertAdmin", aDTO);
	}

	@Override
	public List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {
		PageHelper.startPage(pageNum, pageSize);
		return sql.selectList("mapper.totalAdmin.adminList", searchAdmin);
	}

	@Override
	public TotalAdminDTO getLoginInfo(int adminIdx) {
		return sql.selectOne("mapper.totalAdmin.getLoginInfo", adminIdx);
	}

	@Override
	public int deleteAdmin(Admin aDTO) {
		return sql.update("mapper.totalAdmin.deleteAdmin", aDTO);
	}

	@Override
	public int updateAdmin(Admin aDTO) {
		return sql.update("mapper.totalAdmin.updateAdmin", aDTO);
	}

	@Override
	public List<Admin> del_adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {
		PageHelper.startPage(pageNum, pageSize);
		return sql.selectList("mapper.totalAdmin.del_adminList", searchAdmin);
	}

	@Override
	public Integer countDelAdmin() {
		return sql.selectOne("mapper.totalAdmin.countDelAdmin");
	}

	@Override
	public int returnAdmin(Admin aDTO) {
		return sql.update("mapper.totalAdmin.returnAdmin", aDTO);
	}

	@Override
	public int adminIdCheck(String id) {
		return sql.selectOne("mapper.totalAdmin.adminIdCheck", id);
	}

	@Override
	public int realDeleteAdmin(int adminIdx) {
		return sql.delete("mapper.totalAdmin.realDeleteAdmin", adminIdx);
	}

	@Override
	public int blockMember(Member m) {
		return sql.update("mapper.totalAdmin.blockMember", m);
	}

	@Override
	public List<Member> block_adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin) {
		PageHelper.startPage(pageNum, pageSize);
		return sql.selectList("mapper.totalAdmin.block_adminList", searchAdmin);
	}
	@Override
	public Integer countBlockAdmin() {return sql.selectOne("mapper.totalAdmin.countBlockAdmin");}

	@Override
	public int releaseMember(int memberIdx) {
		return sql.update("mapper.totalAdmin.releaseMember", memberIdx);
	}

	@Override
	public void removeBanner(Banner banner) throws Exception {
		sql.delete("mapper.totalAdmin.removeBanner", banner);
	}

	@Override
	public void savePopup(Popup popup) throws Exception {
		sql.insert("mapper.totalAdmin.savePopup", popup);
	}

	@Override
	public List<Popup> popupList() throws Exception {
		return sql.selectList("mapper.totalAdmin.popupList");
	}

	@Override
	public List<DesignDTO> getDesignList(){
		return sql.selectList("mapper.totalAdmin.getDesignList");
	}

	@Override
	public int upDateDesignMgmt(DesignEntity design) {
		return sql.update("mapper.totalAdmin.upDateDesignMgmt", design);
	}

	@Override
	public void updatePopup(Popup popup) throws Exception {
		sql.update("mapper.totalAdmin.updatePopup", popup);
	}

	@Override
	public void removePopup(Popup popup) throws Exception {
		sql.delete("mapper.totalAdmin.removePopup", popup);
	}

	@Override
	public List<HistoryDTO> getHistoryList(){
		return sql.selectList("mapper.totalAdmin.getHistoryList");
	}

	@Override
	public int upDateHistoryMgmt(HistoryEntity history) {
		return sql.update("mapper.totalAdmin.upDateHistoryMgmt", history);
	}

	@Override
	public Integer getHistorySeq(){
		return sql.selectOne("mapper.totalAdmin.getHistorySeq");
	}
}