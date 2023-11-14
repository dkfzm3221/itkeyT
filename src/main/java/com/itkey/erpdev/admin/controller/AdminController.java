package com.itkey.erpdev.admin.controller;

import com.github.pagehelper.PageInfo;
import com.itkey.erpdev.admin.domain.Admin;
import com.itkey.erpdev.admin.dto.AdminInsert;
import com.itkey.erpdev.admin.dto.CommonDTO;
import com.itkey.erpdev.admin.dto.SearchAdmin;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.service.AdminService;
import com.itkey.erpdev.admin.service.CommonService;
import com.itkey.erpdev.admin.service.TotalAdminService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/totalAdmin")
public class AdminController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    AdminService as;
    TotalAdminService ts;
    CommonService commonService;

    //회원관리 홈
    @RequestMapping(value = "/adminHome")
    public ModelAndView adminIndex(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "3")
            Integer pageSize, SearchAdmin searchAdmin, HttpSession session) {

        TotalAdminDTO loginUser = ((TotalAdminDTO)session.getAttribute("admin"));

        if(loginUser == null){
            ModelAndView mv = new ModelAndView("login_admin");
            return mv;
        }else{
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

        List<CommonDTO> gnbMenuList = commonService.getGnbMenuListAjax();
        session.setAttribute("gnbList", gnbMenuList);

            return mv;
        }

    }

    //회원수
    @ResponseBody
    @RequestMapping(value="/countAdmin", produces="application/json; charset=UTF-8")
    public Integer countAdmin(){
        Integer result = as.countAdmin();
        logger.info("CONTROLLER COUNT ADMIN {}", result);
        return result;
    }

    //회원등록
    @RequestMapping(value = "/insertAdmin")
    public String insertAdmin(HttpSession session, AdminInsert aDTO) {

        TotalAdminDTO loginUser = ((TotalAdminDTO)session.getAttribute("admin"));

        aDTO.setRegId(loginUser.getId());
        aDTO.setRegNm(loginUser.getName());
        logger.info("CONTROLLER INPUT insertAdmin{}", aDTO);
        int result = as.insertAdmin(aDTO);

        return "redirect:/totalAdmin/adminHome";
    }

    //아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/adminIdCheck")
    public String adminIdCheck(String id){

        int result = as.adminIdCheck(id);

        if(result>0){
            return "NN";
        }else{
            return "YY";
        }
    }

    //빠른 로그인
    @ResponseBody
    @RequestMapping(value="/adminFastLogin", produces="application/json; charset=UTF-8")
    public String adminFastLogin(HttpServletRequest request, HttpSession session, int adminIdx){

        //빠른 로그인
        TotalAdminDTO adminDTO  = as.getLoginInfo(adminIdx);
        TotalAdminDTO loginInfo = ts.getAdminInfo(adminDTO);

        if (loginInfo != null) {
            session.setAttribute("admin", adminDTO);
            return "S";
        }else{
            return "F";
        }
    }
    
    //회원 정보 수정 폼
    @ResponseBody
    @RequestMapping(value="/updateAdminForm", produces="application/json; charset=UTF-8")
    public TotalAdminDTO updateAdminForm(int adminIdx){
        TotalAdminDTO adminDTO   = as.getLoginInfo(adminIdx);
        logger.info("CONTROLLER INPUT  updateAdmin{}", adminDTO);
        return adminDTO;
    }

    //회원 정보 수정
    @RequestMapping(value="/updateAdmin")
    public String updateAdmin(HttpServletRequest request, Admin aDTO){

        HttpSession session = request.getSession();
        TotalAdminDTO loginUser = ((TotalAdminDTO)session.getAttribute("admin"));
        aDTO.setUpdId(loginUser.getId());
        aDTO.setUpdNm(loginUser.getName());

        int result = as.updateAdmin(aDTO);

        return "redirect:/totalAdmin/adminHome";
    }

    //회원 탈퇴
    @ResponseBody
    @RequestMapping(value="/deleteAdmin", produces="application/json; charset=UTF-8")
    public String deleteAdmin(HttpSession session, int adminIdx){

        TotalAdminDTO loginUser = ((TotalAdminDTO)session.getAttribute("admin"));
        Admin aDTO = new Admin();
        aDTO.setSeq(adminIdx);
        aDTO.setUpdId(loginUser.getId());
        aDTO.setUpdNm(loginUser.getName());

        int result = as.deleteAdmin(aDTO);

        if(result>0){
            return "S";
        }else{
            return "F";
        }
    }

    //탈퇴 회원관리 홈
    @RequestMapping(value = "/del_adminHome")
    public ModelAndView del_adminIndex(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "3")
            Integer pageSize, SearchAdmin searchAdmin, HttpSession session) {
        ModelAndView mv = new ModelAndView("del_member_admin");
        List<Admin> adminList =  as.del_adminList(pageNum, pageSize, searchAdmin);

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

    //탈퇴 회원수
    @ResponseBody
    @RequestMapping(value="/countDelAdmin", produces="application/json; charset=UTF-8")
    public Integer countDelAdmin(){
        Integer result = as.countDelAdmin();
        logger.info("CONTROLLER COUNT ADMIN {}", result);
        return result;
    }
    
    //탈퇴 복귀
    @ResponseBody
    @RequestMapping(value="/returnAdmin", produces="application/json; charset=UTF-8")
    public String returnAdmin(HttpSession session, int adminIdx){
        TotalAdminDTO loginUser = ((TotalAdminDTO)session.getAttribute("admin"));
        Admin aDTO = new Admin();
        aDTO.setSeq(adminIdx);
        aDTO.setUpdId(loginUser.getId());
        aDTO.setUpdNm(loginUser.getName());

        int result = as.returnAdmin(aDTO);

        if(result>0){
            return "S";
        }else{
            return "F";
        }
    }
}
