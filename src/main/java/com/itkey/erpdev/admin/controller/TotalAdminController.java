package com.itkey.erpdev.admin.controller;

import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.CommonDTO;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.admin.service.CommonService;
import com.itkey.erpdev.admin.service.TotalAdminService;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.service.BoardService;
import com.itkey.erpdev.common.page.Paging;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
//import com.itkey.sam.pay.service.PointService;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/totalAdmin")
public class TotalAdminController {

	TotalAdminService adminService;
	CommonService commonService;
	BoardService bs;


	// 관리자 로그인 화면
	@GetMapping(value = "/loginAdmin")
	public ModelAndView loginAdmin(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/login_admin");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}
		return mv;
	}

	// 로그인
 	@ResponseBody
	@RequestMapping("/login")
	public String getAdminInfo(HttpServletRequest request, TotalAdminDTO adminDTO) throws Exception {
 		HttpSession session = request.getSession();
		String result = "";

		TotalAdminDTO loginInfo = adminService.getAdminInfo(adminDTO);
		
		if (loginInfo != null) {
			session.setAttribute("admin", loginInfo);
			result = "W";
		}
		
		return result;
	}

	// 관리자 메인화면
	@ResponseBody
	@RequestMapping("/mainAdmin")
	public ModelAndView mainAdmin(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/index_admin");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}

		// 메뉴 리스트
		List<CommonDTO> gnbMenuList = commonService.getGnbMenuListAjax();

		List<Visitor> mostVisitURL = adminService.mostVisitURL();
		List<Visitor> mostVisitIP = adminService.mostVisitIP();
		List<Visitor> mostVisitDate = adminService.mostVisitDate();

		mv.addObject("mostVisitURL", mostVisitURL);
		mv.addObject("mostVisitIP", mostVisitIP);
		mv.addObject("mostVisitDate", mostVisitDate);

		// 세션에 메뉴 저장
		session.setAttribute("gnbList", gnbMenuList);

		return mv;
	}
 	
 	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {

		TotalAdminDTO loginDTO = (TotalAdminDTO) request.getSession().getAttribute("admin");
		if(loginDTO != null) {
			request.getSession().invalidate();
		}
		
		return "redirect:/totalAdmin/loginAdmin";
	}
	
	// 대시보드
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							  @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/index");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/index");

			//int totalCount = bs.getTotalBoardCount();
			int totalCount = 0;
			int startPage = (pageNum - 1) * countPerPage + 1;
			int endPage = startPage + countPerPage - 1;
			int currentPage = pageNum;
			int previousPage = currentPage > 1 ? currentPage - 1 : 1;
			int nextPage = currentPage < (totalCount / countPerPage) + 1 ? currentPage + 1 : (totalCount / countPerPage) + 1;

			int pageGroupSize = 5;
			int totalPage = (totalCount / countPerPage) + ((totalCount % countPerPage == 0) ? 0 : 1);
			int currentGroup = (currentPage - 1) / pageGroupSize;
			int startPageGroup = (currentGroup * pageGroupSize) + 1;
			int endPageGroup = startPageGroup + pageGroupSize - 1;

			if (endPageGroup > totalPage) {
				endPageGroup = totalPage;
			}

			Map<String, Object> pageInfo = new HashMap<>();
			pageInfo.put("startPageGroup", startPageGroup);
			pageInfo.put("endPageGroup", endPageGroup);
			pageInfo.put("totalCount", totalCount);
			pageInfo.put("startPage", startPage);
			pageInfo.put("endPage", endPage);
			pageInfo.put("currentPage", currentPage);
			pageInfo.put("previousPage", previousPage);
			pageInfo.put("nextPage", nextPage);

			//List<Board> boardList = bs.boardList(pageNum, countPerPage);

			mv.addObject("pageInfo", pageInfo);
			//mv.addObject("boardList", boardList);

			return mv;
		}

		return mv;
	}

	// 게시판 관리 페이지
	@ResponseBody
	@RequestMapping("/boardMgmg")
	public ModelAndView boardMgmg(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/boardMgmg");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}

		List<Board> adminBoardList = adminService.getAdminBoardList();
		var listSize = adminBoardList.size();
		session.setAttribute("listSize", listSize);
		/*List<Board> boardList = adminService.getBoardList();*/

		mv.addObject("adminBoardList", adminBoardList);

		return mv;
	}

	// 관리자 게시판 등록 화면
	@GetMapping(value = "/adminBoardReg")
	public ModelAndView adminBoardReg(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/adminBoardReg");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}
		return mv;
	}

	// 메뉴관리
	@GetMapping(value = "/menuMgmt")
	public ModelAndView menuMgmt(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/menuMgmt");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}

		return mv;
	}

	// 메뉴관리 - 리스트
	@ResponseBody
	@PostMapping("/getMenuMgmtAjax")
	public HashMap<String, Object> menuMgmt(Paging paging) throws Exception {
		HashMap<String, Object> rMap = new HashMap<String, Object>();

		// 메뉴 리스트
		List<CommonDTO> menuList = commonService.getMenuListAjax();
		// 총 메뉴 수
		int menuCnt = adminService.getMenuListCntAjax();

		rMap.put("menuList", menuList);
		rMap.put("menuCnt", menuCnt);

		return rMap;
	}

	// 메뉴 등록/수정
	@ResponseBody
	@PostMapping("/updMenuMgmtAjax")
	public int updMenuMgmtAjax(@RequestBody List< MenuEntity > menuEntityList) throws Exception {
		int result = adminService.updMenuMgmtAjax(menuEntityList);
		return result;
	}

	// 관리자 게시판 등록
	@PostMapping(value = "/adminWriteBoard")
	public ModelAndView adminWriteBoard(HttpServletRequest request, Board board) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/adminBoardReg");

		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/login_admin");
			return mv;
		}

		var boardNumber = session.getAttribute("listSize");
		board.setAdminBoardNumber((Integer) boardNumber);
		adminService.adminWriteBoard(board);
		return mv;
	}

	@GetMapping(value = "/banner")
	public ModelAndView banner() throws Exception{
		ModelAndView mv = new ModelAndView("/banner");

		// 메뉴 리스트
		List<CommonDTO> menuList = commonService.getMenuListAjax();
		// 총 메뉴 수
		int menuCnt = adminService.getMenuListCntAjax();

		List<Banner> bannerList = adminService.getBannerList();


		mv.addObject("menuList", menuList);
		mv.addObject("menuCnt", menuCnt);
		mv.addObject("bannerList", bannerList);

		return mv;
	}

	@PostMapping(value = "/saveBanner")
	public ModelAndView saveBanner(Banner banner, @RequestParam("file") MultipartFile[] file) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		adminService.saveBanner(banner, file);
		return mv;
	}




}
