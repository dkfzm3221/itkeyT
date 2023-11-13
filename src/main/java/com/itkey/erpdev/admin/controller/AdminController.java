package com.itkey.erpdev.admin.controller;

import com.github.pagehelper.PageInfo;
import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.SearchAdmin;
import com.itkey.erpdev.admin.service.AdminService;
import com.itkey.erpdev.common.page.Paging;
import com.itkey.erpdev.common.page.SearchDto;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@AllArgsConstructor
public class AdminController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    AdminService as;

    //회원관리 홈
    @RequestMapping(value = "/adminHome.ad")
    public ModelAndView adminIndex(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10")
            Integer pageSize, SearchAdmin searchAdmin, HttpSession session) {
        ModelAndView mv = new ModelAndView("member_admin");
        List<Admin> adminList =  as.adminList(pageNum, pageSize, searchAdmin);

        PageInfo page = new PageInfo(adminList);
        Map<String, Object> pagingMap = Paging.pageUtil(adminList, pageNum, pageSize);

        int startPage = (int) pagingMap.get("startPage");
        int endPage = (int) pagingMap.get("endPage");
        int totalPage = (int) pagingMap.get("totalPage");

        logger.info("CONTROLLER ADMIN LIST {}", adminList);

        mv.addObject("adminList", adminList);
        mv.addObject("startPage", startPage);
        mv.addObject("totalPage", totalPage);
        mv.addObject("endPage", endPage);
        mv.addObject("pageList", page);
        mv.addObject("search", searchAdmin);

        return mv;
    }

    //회원수
    @ResponseBody
    @RequestMapping(value="/countAdmin.ad", produces="application/json; charset=UTF-8")
    public Integer countAdmin(){
        Integer result = as.countAdmin();
        logger.info("CONTROLLER COUNT ADMIN {}", result);
        return result;
    }

    //회원등록
    @RequestMapping(value = "/insertAdmin.ad")
    public ModelAndView insertAdmin(HttpSession session, AdminInsert aDTO) {

//        Admin loginUser = ((Admin)session.getAttribute("loginUser"));
//        logger.info("CONTROLLER LOGIN SESSION{}", loginUser);
        aDTO.setRegId("admin");
        aDTO.setRegNm("관리자");
        logger.info("CONTROLLER INPUT insertAdmin{}", aDTO);
        int result = as.insertAdmin(aDTO);

        ModelAndView mv = new ModelAndView("member_admin");

        return mv;
    }
}
