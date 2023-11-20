package com.itkey.erpdev.member.controller;

import com.itkey.erpdev.customer.dto.CustInfoResponse;
import com.itkey.erpdev.customer.dto.CustJoinForm;
import com.itkey.erpdev.customer.dto.CustSaveForm;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
import com.itkey.erpdev.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/mem")
public class MemberController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    MemberService ms;

    @GetMapping(value = "/joinForm")
    public ModelAndView memJoinForm() {
        return new ModelAndView("memLoginForm");
    }

    //사용자 회원가입
    @PostMapping(value = "/join")
    public String memJoin(MemberInsert mDTO) {
        int result = ms.memJoin(mDTO);
        return "redirect:/mem/joinForm";
    }

    //사용자 로그인
    @PostMapping(value="/login")
    public ModelAndView memLogin(Member m, HttpSession session){

        ModelAndView mv = new ModelAndView();

        MemberInfoResponse login = ms.memlogin(m, session);
        if (login.getSalt() == null) {
            mv.setViewName("memLoginForm");
            session.setAttribute("errorMsg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
            return mv;
        }

        mv.addObject("login", login);
        mv.setViewName("redirect:/");

        return mv;
    }

}
