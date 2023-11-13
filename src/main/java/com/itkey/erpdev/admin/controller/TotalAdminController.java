package com.itkey.erpdev.admin.controller;

import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.service.CommonService;
import com.itkey.erpdev.admin.service.TotalAdminService;
import com.itkey.erpdev.admin.dto.CommonDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
//import com.itkey.sam.pay.service.PointService;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/totalAdmin")
public class TotalAdminController {

	TotalAdminService adminService;
	CommonService commonService;

	// 관리자 로그인 화면
	@GetMapping(value = "/loginAdmin")
	public ModelAndView loginAdmin(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("/login_admin");

		System.out.println(mv);
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
			session.setAttribute("admin", adminDTO);
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

		System.out.println(mv);
		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/loginAdmin");
			return mv;
		}

		List<CommonDTO> gnbMenuList = commonService.getGnbMenuListAjax();

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
		
		return "redirect:/totalAdmin/index";
	}
	
	// 대시보드
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("/index");
		
		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/index");
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

		System.out.println(mv);
		if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
			mv.setViewName("/boardMgmg");
			return mv;
		}
		return mv;
	}
}
