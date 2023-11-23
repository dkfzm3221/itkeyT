package com.itkey.erpdev.admin.service;


import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.domain.DesignEntity;
import com.itkey.erpdev.admin.domain.MenuEntity;
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
	int updMenuMgmtAjax(List<MenuEntity> menuEntityList);

	// 메뉴 수
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

	List<DesignDTO> getDesignList();

	int upDatedesignMgmt(DesignEntity design);
}