package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.CommonDTO;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.service.CommonService;
import com.itkey.erpdev.admin.service.TotalAdminService;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.Notice;
import com.itkey.erpdev.board.service.BoardService;
import com.itkey.erpdev.board.service.NoticeService;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/notice")
public class NoticeController {
    NoticeService ns;
    CommonService commonService;
    BoardService bs;

    @GetMapping(value="noticeList")
    public ModelAndView noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                   @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage
            , HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView("/board/notice");

        if(session.getAttribute("admin") != null ){
            TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");
            String userId = member.getId();

            mv.addObject("userId", userId);
            String memberType = member.getMemberType();
            mv.addObject("memberType", memberType);
        }else if(session.getAttribute("member") != null ){

            MemberInfoResponse member = (MemberInfoResponse) session.getAttribute("member");
            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }

        List<Notice> noticeList = ns.selectNoticeList();

        mv.addObject("noticeList", noticeList);

        List<Banner> bannerList = bs.bannerList();
        List<Board> menuList = bs.getMenuList();
        mv.addObject("menuList", menuList);
        mv.addObject("bannerList", bannerList);

        List<DesignDTO> designList = bs.getDegignList();
        mv.addObject("designList", designList);

        return mv;

    }

    @GetMapping(value="writeNoticeView")
    public ModelAndView noticeWriteView(HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView("/board/writeNoticeView");

        if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
            mv.setViewName("/login_admin");
            return mv;
        }
        // 메뉴 리스트
        List<CommonDTO> gnbMenuList = commonService.getGnbMenuListAjax();
        // 세션에 메뉴 저장
        session.setAttribute("gnbList", gnbMenuList);

        List<Banner> bannerList = bs.bannerList();
        List<Board> menuList = bs.getMenuList();
        mv.addObject("menuList", menuList);
        mv.addObject("bannerList", bannerList);

        List<DesignDTO> designList = bs.getDegignList();
        mv.addObject("designList", designList);

        return mv;
    }

    @PostMapping(value = "insertNotice")
    public ModelAndView insertNotice(Notice notice , HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");

        ns.insertNotice(notice, request);

        return mv;
    }


    /**
     *
     *
     *@author 김재섭
     *@date 2023-11-28
     *@comment 공지 상세
     *
     **/
    @GetMapping(value = "/noticeDetail")
    public ModelAndView noticeDetail(Notice notice, HttpSession session) throws Exception{

        ModelAndView mv = new ModelAndView("/board/noticeDetail");
        if(session.getAttribute("admin") != null ){
            TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");
            String userId = member.getId();

            mv.addObject("userId", userId);
            String memberType = member.getMemberType();
            mv.addObject("memberType", memberType);
        }else if(session.getAttribute("member") != null ){

            MemberInfoResponse member = (MemberInfoResponse) session.getAttribute("member");
            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }

        ns.updateInqCnt(notice);
        Notice noticeDetail = ns.noticeDetail(notice);
        mv.addObject("noticeDetail", noticeDetail);

        List<Banner> bannerList = bs.bannerList();
        List<Board> menuList = bs.getMenuList();
        mv.addObject("menuList", menuList);
        mv.addObject("bannerList", bannerList);

        List<DesignDTO> designList = bs.getDegignList();
        mv.addObject("designList", designList);

        return mv;
    }

    /**
     *
     * NoticeController
     *
     *@author 김재섭
     *@date 2023-11-23
     *@comment 공지사항 수정
     *
     **/
    @PostMapping(value = "/modiNotice")
    public ModelAndView updateBoard(Notice notice,HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/board/noticeDetail");
        ns.modiNotice(notice,request);

        return mv;
    }

    /**
     *
     * NoticeController
     *
     *@author 김재섭
     *@date 2023-11-23
     *@comment 공지사항 수정
     *
     **/
    @PostMapping(value = "/deleteNotice")
    public ModelAndView deleteNotice(Notice notice) throws Exception{
        ModelAndView mv = new ModelAndView("/board/noticeDetail");
        ns.deleteNotice(notice);

        return mv;
    }


}
