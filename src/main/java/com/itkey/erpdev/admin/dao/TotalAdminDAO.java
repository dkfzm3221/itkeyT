package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.domain.*;
import com.itkey.erpdev.admin.dto.*;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.member.domain.Member;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import java.util.List;

public interface TotalAdminDAO {

	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	List<Board> getAdminBoardList();

	List<Board> getBoardList();

	List<Board> boardTypeCnt();

	void adminWriteBoard(Board board);

	List<Visitor> mostVisitURL();

	List<Visitor> mostVisitIP();

	List<Visitor> mostVisitDate();

	// 메뉴 등록/수정
	int updMenuMgmtAjax(List<MenuEntity> menuEntityList);

	// 메뉴 수
	int getMenuListCntAjax();
	
	// 메뉴 삭제시, 해당 게시글 삭제처리
	int delBoardAjax(List<MenuEntity> menuEntityList, String id);

    List<Banner> getBannerList() throws Exception;

	void saveBanner(Banner banner) throws Exception;

	void saveFile(FileDto fileDto);

	void updateFile(FileDto fileDto) throws Exception;

	void updateBanner(Banner newBanner) throws Exception;

	int countAdmin();

	int insertAdmin(AdminInsert aDTO);

	List<Admin> adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin);

	TotalAdminDTO getLoginInfo(int adminIdx);

	int deleteAdmin(Admin aDTO);

	int updateAdmin(Admin aDTO);

	List<Admin> del_adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin);

	Integer countDelAdmin();

	int returnAdmin(Admin aDTO);

	int adminIdCheck(String id);

	int realDeleteAdmin(int adminIdx);

	int blockMember(Member m);

	List<Member> block_adminList(Integer pageNum, Integer pageSize, SearchAdmin searchAdmin);

	Integer countBlockAdmin();

	int releaseMember(int memberIdx);

	void removeBanner(Banner banner) throws Exception;

	List<DesignDTO> getDesignList();

	void savePopup(Popup popup) throws Exception;

	List<Popup> popupList() throws Exception;

	int upDateDesignMgmt(DesignEntity design);

	void updatePopup(Popup popup) throws Exception;

	void removePopup(Popup popup) throws Exception;

	// 연혁관리 조회
	List<HistoryDTO> getHistoryList();

	// 연혁관리 수정
	int upDateHistoryMgmt(HistoryEntity history);

	// 연혁관리 최대 seq
	Integer getHistorySeq();
}