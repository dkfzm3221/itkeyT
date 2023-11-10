package com.itkey.erpdev.admin.controller;

import com.itkey.erpdev.admin.dto.AdminInsert;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/admin")
public class AdminController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    //회원관리 홈
    @RequestMapping(value = "/adminHome.ad")
    public String adminIndex() {
        return "member_admin";
    }

    //회원등록
    @RequestMapping(value = "/insertAdmin")
    public ModelAndView insertAdmin(AdminInsert aDTO) {
        logger.info("CONTROLLER INPUT insertAdmin{}", aDTO);
        ModelAndView mv = new ModelAndView();

        return mv;
    }
}
