package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.admin.service.TotalAdminService;
import com.itkey.erpdev.board.service.BoardService;
import com.itkey.erpdev.board.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/notice")
public class NoticeController {
    NoticeService ns;


    @GetMapping(value="noticeList")
    public ModelAndView noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                   @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage
            , HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView("/board/notice");

        if(session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
            mv.setViewName("/login_admin");
            return mv;
        }

        return mv;

    }

}
