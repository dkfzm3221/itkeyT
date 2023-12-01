package com.itkey.erpdev.member.controller;

import com.itkey.erpdev.admin.service.TotalAdminService;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.*;
import com.itkey.erpdev.member.service.MemberService;
import com.itkey.erpdev.member.service.smtpService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/mem")
public class MemberController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    MemberService ms;
    smtpService smtpService;
    TotalAdminService adminService;

    properties pro;

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 로그인, 회원가입 폼 연결
     *
     **/
    @GetMapping(value = "/joinForm")
    public ModelAndView memJoinForm() {
        return new ModelAndView("memLoginForm");
    }

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 사용자 회원 가입
     *
     **/
    @PostMapping(value = "/join")
    public String memJoin(MemberInsert mDTO) {
        int result = ms.memJoin(mDTO);
        return "redirect:/mem/joinForm";
    }
    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 사용자 로그인
     *
     **/
    @PostMapping(value="/login")
    public ModelAndView memLogin(Member m, HttpSession session){

        ModelAndView mv = new ModelAndView();

        MemberInfoResponse login = ms.memlogin(m, session);

        if (login.getSalt() == null) {
            mv.setViewName("memLoginForm");
            session.setAttribute("errorMsg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
            return mv;
        }else if("N".equals(login.getUseYn())){
            mv.setViewName("memLoginForm");
            session.setAttribute("errorMsg", "탈퇴한 회원입니다.");
            return mv;
        }else if("B".equals(login.getMemberStatus())){
            mv.setViewName("memLoginForm");
            session.setAttribute("errorMsg", "차단된 회원입니다.");
            return mv;
        }
        session.setAttribute("member", login);
        mv.addObject("login", login);
        mv.setViewName("redirect:/");
        return mv;
    }
    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 사용자 로그아웃
     *
     **/
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 아이디 찾기
     *
     **/
    @RequestMapping(value="/findId")
    public ModelAndView findId(Member mDTO){
        ModelAndView mv = new ModelAndView("jsonView");

        Member findId = ms.findId(mDTO);

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

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 비밀번호 찾기
     *
     **/
    @RequestMapping(value="/findPw")
    public ModelAndView findPw(Member mDTO){
        ModelAndView mv = new ModelAndView("jsonView");

        Member findPw = ms.findPw(mDTO);

        if (mDTO.getId() == "" || mDTO.getEmail() == "") {
            mv.addObject("result", "zero");
        } else if (findPw == null) {
            //아이디, 비밀번호가 맞지 않거나 탈퇴한 회원인 경우
            mv.addObject("result", "error");
            mv.addObject("errorMsg", "입력한 정보가 없습니다.");
        } else {
            mv.addObject("result", "success");
            mv.addObject("name", findPw.getName());
            mv.addObject("seq", findPw.getSeq());
        }
        return mv;
    }

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 임시 비밀번호 발급
     *
     **/
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

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 아이디 중복 체크
     *
     **/
    @ResponseBody
    @RequestMapping(value="/memberIdCheck")
    public String adminIdCheck(String id){
        return ms.memberIdCheck(id) > 0 ? "NN" : "YY";
    }
    
    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 사용자 정보 불러오기
     *
     **/
    @ResponseBody
    @RequestMapping(value="/updateMemberInfo")
    public Member updateMemberInfo(int memberIdx){
        return ms.memberInfo(memberIdx);
    }

    /**
     *
     * MemberController
     *
     *@author 유은비
     *@date 2023-11-23
     *@comment 사용자 정보 수정
     *
     **/
    @RequestMapping(value="/updateMember")
    public String updateMember(Member m){
        int result = ms.updateMember(m);
        return "redirect:/";
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-29
     *@comment 카카오 계정 로그인하기
     *
     **/
    @RequestMapping("/kakaoLoginForm")
    public String kakaoLoginForm(){
        String url = "https://kauth.kakao.com/oauth/authorize?";
        String client_id = pro.getKakaoClient_id();
        String redirect_uri = "http://localhost:8888/mem/kakaoLogin";

        String kakaoURL = url+"client_id="+client_id+"&redirect_uri="+redirect_uri+"&response_type=code";
        return "redirect:" + kakaoURL;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-29
     *@comment 카카오 계정으로 로그인
     *
     **/
    @RequestMapping("/kakaoLogin")
    public ModelAndView kakaoLoginReady(String code, HttpSession session){
        ModelAndView mv = new ModelAndView();
        logger.info("콜백 후 code : {}", code);
        String redirect_uri = "http://localhost:8888/mem/kakaoLogin";
        //카카오에서 토큰 가져오기
        KakaoResponse kDTO = ms.getKakaoAccessToken(code, redirect_uri);
        //토큰으로 카카오측에 있는 정보 불러오기
        KakaoAccountInfo kaDTO = ms.getkakaoAcountInfo(kDTO);
        //가입 여부 확인
        SNSInfo sDTO = new SNSInfo();
        sDTO.setSnsId(String.valueOf(kaDTO.getId()));
        sDTO.setSnsCode("K");
        MemberInfoResponse login = ms.getSnsId(sDTO);
        if(login == null){
            //정보 없음 --> 회원가입
            mv.addObject("Kcode", code);
            mv.setViewName("memLoginForm");
            return mv;
        }
        //정보 있음
        session.setAttribute("member", login);
        mv.addObject("login", login);
        mv.setViewName("redirect:/");
        return mv;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-30
     *@comment 카카오 계정 가입 폼 띄우기
     *
     **/
    @RequestMapping("/kakaoJoinForm")
    public String kakaoJoinForm(){
        String url = "https://kauth.kakao.com/oauth/authorize?";
        String client_id = pro.getKakaoClient_id();
        String redirect_uri = "http://localhost:8888/mem/kakaoJoin";

        String kakaoURL = url+"client_id="+client_id+"&redirect_uri="+redirect_uri+"&response_type=code";
        return "redirect:" + kakaoURL;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-30
     *@comment 카카오 계정으로 가입
     *
     **/
    @RequestMapping("/kakaoJoin")
    public ModelAndView kakaoJoin(String code, ModelAndView mv){
        String redirect_uri = "http://localhost:8888/mem/kakaoJoin";
        //카카오에서 토큰 가져오기
        KakaoResponse kDTO = ms.getKakaoAccessToken(code, redirect_uri);
        //토큰으로 카카오측에 있는 정보 불러오기
        KakaoAccountInfo kaDTO = ms.getkakaoAcountInfo(kDTO);
        //기존 회원 여부 확인
        SNSInfo sDTO = new SNSInfo();
        sDTO.setSnsId(String.valueOf(kaDTO.getId()));
        sDTO.setSnsCode("K");
        MemberInfoResponse login = ms.getSnsId(sDTO);
        if(login != null){
            //기존 회원일 경우
            mv.addObject("returnJoin", "기존 회원입니다.");
            mv.setViewName("memLoginForm");
            return mv;
        }
        //DB에 가입정보 저장
        String kakaoEmail = kaDTO.getKakao_account().getEmail();
        String id = "K_" + kakaoEmail.substring(0, kakaoEmail.lastIndexOf("@"));
        MemberInsert mDTO = MemberInsert.builder()
                .id(id)
                .snsId(String.valueOf(kaDTO.getId()))
                .snsCode("K")
                .email(kakaoEmail)
                .memberType("U")
                .build();
        logger.info("가입 정보 : {}", mDTO);
        int result = ms.snsJoin(mDTO);
        mv.addObject("returnJoin", "회원가입 완료");
        mv.setViewName("memLoginForm");
        return mv;
    }

    /**
     *
     *@author 유은비
     *@date 2023-11-29
     *@comment 구글 계정 로그인
     *
     **/
    @RequestMapping("/googleLoginForm")
    public String loginUrlGoogle(){
        String url = "https://accounts.google.com/o/oauth2/v2/auth?";
        String googleClientId = pro.getGoogleClient_id();
        String redirect_uri = "http://localhost:8888/mem/googleLogin";

        String googleURL = url + "client_id=" + googleClientId
                + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=email%20profile%20openid&access_type=offline";
        return "redirect:" + googleURL;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-29
     *@comment 구글 계정으로 로그인
     *
     **/
    @RequestMapping("/googleLogin")
    public ModelAndView googleLoginReady(String code, HttpSession session){
        String redirect_uri = "http://localhost:8888/mem/googleLogin";
        ModelAndView mv = new ModelAndView();
        logger.info("콜백 후 code : {}", code, redirect_uri);
        //구글에서 토큰 가져오기
        GoogleResponse gDTO = ms.getGoogleAccessToken(code, redirect_uri);
        //토큰으로 구글 측에 있는 정보 불러오기
        GoogleAccountInfo gaDTO = ms.getGoogleAcountInfo(gDTO);
        //가입 여부 확인
        SNSInfo sDTO = new SNSInfo();
        sDTO.setSnsId(String.valueOf(gaDTO.getSub()));
        sDTO.setSnsCode("G");
        MemberInfoResponse login = ms.getSnsId(sDTO);
        if(login == null){
            //정보 없음 --> 회원가입
            mv.addObject("Gcode", code);
            mv.setViewName("memLoginForm");
            return mv;
        }
        //정보 있음
        session.setAttribute("member", login);
        mv.addObject("login", login);
        mv.setViewName("redirect:/");
        return mv;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-30
     *@comment 구글 계정 가입 폼 띄우기
     *
     **/
    @RequestMapping("/googleJoinForm")
    public String googleJoinForm(){
        String url = "https://accounts.google.com/o/oauth2/v2/auth?";
        String googleClientId = pro.getGoogleClient_id();
        String redirect_uri = "http://localhost:8888/mem/googleJoin";

        String googleURL = url + "client_id=" + googleClientId
                + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=email%20profile%20openid&access_type=offline";
        return "redirect:" + googleURL;
    }
    /**
     *
     *@author 유은비
     *@date 2023-11-30
     *@comment 구글 계정으로 가입
     *
     **/
    @RequestMapping("/googleJoin")
    public ModelAndView googleJoin(String code, ModelAndView mv){
        String redirect_uri = "http://localhost:8888/mem/googleJoin";
        //구글에서 토큰 가져오기
        GoogleResponse gDTO = ms.getGoogleAccessToken(code, redirect_uri);
        //토큰으로 구글 측에 있는 정보 불러오기
        GoogleAccountInfo gaDTO = ms.getGoogleAcountInfo(gDTO);
        //기존 회원 여부 확인
        SNSInfo sDTO = new SNSInfo();
        sDTO.setSnsId(String.valueOf(gaDTO.getSub()));
        sDTO.setSnsCode("G");
        MemberInfoResponse login = ms.getSnsId(sDTO);
        if(login != null){
            //기존 회원일 경우
            mv.addObject("returnJoin", "기존 회원입니다.");
            mv.setViewName("memLoginForm");
            return mv;
        }
        //DB에 가입정보 저장
        String id = "G_" + gaDTO.getEmail().substring(0, gaDTO.getEmail().lastIndexOf("@"));
        MemberInsert mDTO = MemberInsert.builder()
                                    .id(id)
                                    .snsId(gaDTO.getSub())
                                    .snsCode("G")
                                    .email(gaDTO.getEmail())
                                    .memberType("U")
                                    .build();
        logger.info("가입 정보 : {}", mDTO);
        int result = ms.snsJoin(mDTO);
        mv.addObject("returnJoin", "회원가입 완료");
        mv.setViewName("memLoginForm");
        return mv;
    }



}
