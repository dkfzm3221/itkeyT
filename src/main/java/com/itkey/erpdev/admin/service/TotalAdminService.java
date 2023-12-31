package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.domain.*;
import com.itkey.erpdev.admin.dto.*;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.member.domain.Member;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import java.util.List;

public interface TotalAdminService {
	// 로그인  
	TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO);

	// 관리자 게시판 목록
	List<Board> getAdminBoardList();

	// 게시판 목록
	List<Board> getBoardList();

	// 게시판타입 갯수
	List<Board> boardTypeCnt();

	// 관리자 게시판 등록
	void adminWriteBoard(Board board);

    List<Visitor> mostVisitURL();

	List<Visitor> mostVisitIP();

    List<Visitor> mostVisitDate();

	// 메뉴관리
	int updMenuMgmtAjax(List<MenuEntity> menuEntityList, HttpServletRequest request);

	// 메뉴관리 메뉴 SEQ
	int getMenuListCntAjax();

	List<Banner> getBannerList() throws Exception;

	void saveBanner(Banner banner, HttpServletRequest request) throws Exception;

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

	// 디자인관리 조회
	List<DesignDTO> getDesignList();

    void savePopup(Popup popup, HttpServletRequest request) throws Exception;

	List<Popup> popupList() throws Exception;

	// 디자인관리 수정
	int upDateDesignMgmt(DesignEntity design, HttpServletRequest request);

	void updatePopup(Popup popup, HttpServletRequest request) throws Exception;

	void removePopup(Popup popup) throws Exception;

	// 연혁관리 조회
	List<HistoryDTO> getHistoryList();

	// 연혁관리 수정
	int upDateHistoryMgmt(HistoryEntity history, HttpServletRequest request);

	// 연혁관리 최대 seq
	Integer getHistorySeq();
}