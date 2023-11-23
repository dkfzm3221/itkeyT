package com.itkey.erpdev.member.controller;

import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import com.itkey.erpdev.member.dto.MemberInsert;
import com.itkey.erpdev.member.service.MemberService;
import com.itkey.erpdev.member.service.smtpService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/mem")
public class MemberController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    MemberService ms;
    com.itkey.erpdev.member.service.smtpService smtpService;

    //로그인, 회원가입 폼 연결
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
        }else if("B".equals(login.getAuthCode())){
            mv.setViewName("memLoginForm");
            session.setAttribute("errorMsg", "차단된 회원입니다.");
            return mv;
        }

        session.setAttribute("member", login);
        mv.addObject("login", login);
        mv.setViewName("redirect:/");
        return mv;
    }
    //로그아웃
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    //아이디 찾기
    @RequestMapping(value="/findId")
    public ModelAndView findId(Member mDTO){
        ModelAndView mv = new ModelAndView("jsonView");

        Member findId = ms.findId(mDTO);
        log.info("findId?{}", findId);
        if (mDTO.getName() == "" || mDTO.getHp() == "") {

            mv.addObject("result", "zero");
        } else {
            if(findId != null){
                mv.addObject("result", "success");
                mv.addObject("foundId", findId.getId());
            }else{
                mv.addObject("result", "error");
                mv.addObject("errorMsg", "입력한 정보와 일치하는 아이디가 없습니다.");
            }
        }
        return mv;
    }

    //비밀번호 찾기
    @RequestMapping(value="/findPw")
    public ModelAndView findPw(Member mDTO){
        ModelAndView mv = new ModelAndView("jsonView");

        Member findPw = ms.findPw(mDTO);
        log.info("결과값{}", findPw);

        if (mDTO.getId() == "" || mDTO.getEmail() == "") {
            mv.addObject("result", "zero");
        } else if (findPw == null) {
            mv.addObject("result", "error");
            mv.addObject("errorMsg", "입력한 정보가 일치하지 않습니다.");
        } else {
            mv.addObject("result", "success");
            mv.addObject("name", findPw.getName());
            mv.addObject("seq", findPw.getSeq());
        }

        return mv;
    }

    //임시 비밀번호 발급
    @PostMapping(value = "/tempPwSend")
    public ModelAndView tempPwSend(HttpServletRequest request, Member mDTO) throws MessagingException, UnsupportedEncodingException, javax.mail.MessagingException {
        ModelAndView mv = new ModelAndView("jsonView");

        Member findPw = ms.findPw(mDTO);

        log.info("-----------mail controller start ----------------");
        String subject = "임시 비밀번호";
        String newPw = UUID.randomUUID().toString().substring(0, 7);
        String salt = findPw.getSalt();
        String content = "<!doctype html>\n" +
                "<html lang=\"ko\">\n" +
                "<head>\n" +
                "    <meta charset=\"utf-8\">\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div style=\"width: 670px; border: 1px solid #e9e9e9;\">\n" +
                "        <div style=\"padding: 1.5rem; padding-bottom: 1.3rem; margin-bottom: 1.7rem; background: #5600b8; \">></div>\n"
                +
                "        \n" +
                "        <div style=\"margin-bottom: 1.7rem; padding: 0 2rem;\">안녕하세요.<br>요청하신 임시 비밀번호는 다음과 같습니다.<br>임시 비밀번호로 로그인 하신 후 바로 비밀번호를 변경하시기 바랍니다.</div>\n" +
                "        \n" +
                "        <div style=\"border-top: 1px solid #6861CE; border-bottom: 1px solid #6861CE; background: #f9fbfd; text-align: center; padding: 2rem 0; margin: 0 2rem; font-weight: bold\">\n" +
                "            <p style=\"margin: 0;\">임시 비밀번호 : <span style=\"color: #5600b8;\">" + newPw + "</span></p>\n" +
                "            \n" +
                "            <p style=\"margin-top: 2.5rem;\">\n" +
                "                <a href=\"http://localhost:8888/mem/joinForm#\" target=\"_blank\" style=\"padding: 12px 18px; background:#5600B8; color: #fff; text-decoration: none; border-radius: 4px; font-weight: bold;\">로그인화면으로</a>\n" +
                "            </p>\n" +
                "        </div>\n" +
                "        \n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";
        String sender = "bibibig1451@gmail.com";
        String senderNm = "NAME";
        String receiverName = mDTO.getName();
        String email = mDTO.getEmail();
        smtpService.sendSimpleMessage(content, email, subject, sender, senderNm, receiverName);
        log.info("-----------mail controller end ----------------");

        int seq = findPw.getSeq();
        int result = ms.newPw(salt, newPw, seq);

        return mv;
    }

    //아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/memberIdCheck")
    public String adminIdCheck(String id){

        int result = ms.memberIdCheck(id);

        if(result>0){
            return "NN";
        }else{
            return "YY";
        }
    }

}
