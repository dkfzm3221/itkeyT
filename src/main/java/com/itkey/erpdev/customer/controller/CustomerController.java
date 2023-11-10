package com.itkey.erpdev.customer.controller;

import com.github.pagehelper.PageInfo;
import com.itkey.erpdev.common.page.Paging;
import com.itkey.erpdev.common.page.SearchDto;
import com.itkey.erpdev.customer.dto.*;
import com.itkey.erpdev.customer.service.CustomerService;
import com.itkey.erpdev.employee.domain.Employee;
import com.itkey.erpdev.employee.service.EmployeeService;
import com.itkey.erpdev.project.dto.ProjDTO;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *packageName    : com.example.erpdev.company.controller
 * fileName       : CustomerController
 * author         : AHN
 * date           : 2023-02-09
 * description    : 거래처관리
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-09        AHN       최초 생성
 */
@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/cust")
public class CustomerController {

  CustomerService cs;
  EmployeeService es;

  // TODO: 2023-02-01 거래처 전용 로그인 및 관련 기능들 우선 개발

  /*거래처전용 로그인화면*/
  @GetMapping(value = "/login")
  public ModelAndView custLoginView() {
    return new ModelAndView("cust/custloginForm");
  }

  @PostMapping(value = "/login")
  public ModelAndView custLoginDo(CustLoginForm from, HttpSession session) {
    ModelAndView mv = new ModelAndView();

    CustInfoResponse login = cs.login(from, session);
    if (login.getCacSalt() == null) {
      mv.setViewName("redirect:login");
      return mv;
    }

    mv.addObject("login", login);
    mv.setViewName("redirect:dashboard");

    return mv;
  }

  /*거래처 가입*/
  @PostMapping(value = "/join")
  public ModelAndView custJoin(CustJoinForm joinForm, CustSaveForm saveForm) {
    ModelAndView mv = new ModelAndView();
    int resutl = cs.custJoin(joinForm, saveForm);

    return mv;
  }

  /*등록거래처 확인*/
  @PostMapping(value = "/join/check/bsnum")
  @ResponseBody
  public ModelAndView custJoinCheck(@RequestParam("bsnsNmbr") int bsnsNmbr) {
    ModelAndView mv = new ModelAndView("jsonView");
    int result = cs.custJoinCheck(bsnsNmbr);
    if (result == 0) {
      mv.addObject("result", "fail");
      mv.addObject("msg", "조회결과가 없습니다.");
    } else {
      CustInfoResponse custInfo = cs.custInfo(bsnsNmbr);
      mv.addObject("result", custInfo);
      mv.addObject("msg", "success");
    }
    return mv;
  }

  /*아이디 중복 확인*/
  @PostMapping(value = "/join/check/id")
  @ResponseBody
  public ModelAndView custJoinIdCheck(@RequestParam("cacId") String cacId) {
    ModelAndView mv = new ModelAndView("jsonView");
    int result = cs.custJoinIdCheck(cacId);
    if (result == 0) {
      mv.addObject("result", "success");
      mv.addObject("msg", "사용가능한 아이디입니다.");
    } else {
      mv.addObject("result", "fail");
      mv.addObject("msg", "사용중인 아이디입니다.");
    }
    return mv;
  }

  /*거래처 전용 대시보드*/
  @GetMapping(value = "/dashboard")
  public ModelAndView custDashBoard(HttpSession session) throws Exception {
    ModelAndView mv = new ModelAndView("/cust/custDashboard");


    CustInfoResponse response = (CustInfoResponse) session.getAttribute("custInfo");

    int custIdx = response.getCustIdx();

    /*프로젝트 투입중인 인력 COUNT*/
    int inputManpowerCount = cs.inputManpowerCount(custIdx);

    /*프로젝트 철수 인력 COUNT*/
    int evacuationManpowerCount = cs.evacuationManpowerCount(custIdx);

    /*프로젝트 등록 건수 COUNT*/
    int projectCount = cs.projectCount(custIdx);

    /*철수예정인력 COUNT*/
    int withdrawalScheduledCount = cs.withdrawalScheduledCount(custIdx);



    mv.addObject("inputManpowerCount", inputManpowerCount);
    mv.addObject("withdrawalScheduledCount", withdrawalScheduledCount);
    mv.addObject("evacuationManpowerCount", evacuationManpowerCount);
    mv.addObject("projectCount", projectCount);

    return mv;
  }

  /*직원 목록(가용인력)*/
  @GetMapping(value = "/available")
  public ModelAndView availableManpower(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10")
          Integer pageSize, SearchDto searchDto, HttpSession session){

    ModelAndView mv = new ModelAndView("/cust/custAvailable");

    CustInfoResponse response = (CustInfoResponse) session.getAttribute("custInfo");
    List<CustEmpList> customerList = cs.custAvailableList(pageNum, pageSize, searchDto, session);

    PageInfo page = new PageInfo(customerList);
    Map<String, Object> pagingMap = Paging.pageUtil(customerList, pageNum, pageSize);

    int startPage = (int) pagingMap.get("startPage");
    int endPage = (int) pagingMap.get("endPage");
    int totalPage = (int) pagingMap.get("totalPage");



    mv.addObject("customerList", customerList);
    mv.addObject("startPage", startPage);
    mv.addObject("totalPage", totalPage);
    mv.addObject("endPage", endPage);
    mv.addObject("pageList", page);
    mv.addObject("search", searchDto);
    return mv;
  }

  /*직원노출 여부 (Y,N) UPDATE*/
  @PostMapping(value = "/updateStat")
  public String updateStat(CustEmpList custEmpList, HttpServletRequest request){
    request.getParameter("openYn");
    request.getParameter("cEmpIdx");

    cs.updateStat(custEmpList);

    return "redirect:/cust/available";
  }

  /*인력검색 LIST*/
  @GetMapping(value = "/manpowerSearch")
  public ModelAndView manpowerSearch(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10")
          Integer pageSize, SearchDto searchDto, HttpSession session){
    ModelAndView mv = new ModelAndView("/cust/manpowerSearch");

    /*인력 union*/
    List<CustEmpList> manpowerList = cs.manpowerList(pageNum, pageSize, searchDto, session);

    PageInfo page = new PageInfo(manpowerList);
    Map<String, Object> pagingMap = Paging.pageUtil(manpowerList, pageNum, pageSize);


    int startPage = (int) pagingMap.get("startPage");
    int endPage = (int) pagingMap.get("endPage");
    int totalPage = (int) pagingMap.get("totalPage");



    mv.addObject("manpowerList", manpowerList);
    mv.addObject("startPage", startPage);
    mv.addObject("totalPage", totalPage);
    mv.addObject("endPage", endPage);
    mv.addObject("pageList", page);
    mv.addObject("search", searchDto);

    return mv;

  }


  @PostMapping(value = "/cust/test")
  public ModelAndView custTest(@RequestParam(value = "base64Sign", defaultValue = "") String base64Sign,@RequestParam(value = "base64Mark", defaultValue = "") String base64Mark) {

    String base64Replace = "";
    int width = 0,height = 0; //사이즈 나중에 변경

    base64Replace = base64Sign.replaceAll("data:image/png;base64,", "");
    if (base64Mark.isEmpty()) {
      base64Replace = base64Sign.replaceAll("data:image/png;base64,", "");
      width = 160;
      height = 120;
    } else if (base64Sign.isEmpty()){
      base64Replace = base64Mark.replaceAll("data:image/png;base64,", "");
      width = 120;
      height = 120;
    }
    System.out.println("parameter -------------"+base64Replace);
    byte decode[] = Base64.decodeBase64(base64Replace);

    try {
      ByteArrayInputStream bis = new ByteArrayInputStream(decode);

      ////////////////////////////////이미지 픽셀 품질 유지
      //ImageIO.write(bufImg, "png", new File("c:\\asd\\test.png"));
      //BufferedImage signImage = ImageIO.read(new File("c:\\asd\\puppy.jpg"));
      /*BufferedImage image1 = ImageIO.read(new File("c:\\asd\\puppy.jpg"));
      Image imgTarget = image1.getScaledInstance(40,30,Image.SCALE_SMOOTH);
      int pixels[] = new int[40 * 30];
      PixelGrabber pg = new PixelGrabber(imgTarget,0,0,40,30,pixels,0,40);
      pg.grabPixels();
      BufferedImage hightSignImage = new BufferedImage(40, 30, BufferedImage.TYPE_INT_RGB);
      hightSignImage.setRGB(0,0,40,30,pixels,0,40);
      ImageIO.write(hightSignImage,"png",new File("c:\\asd\\puppy.jpg"));*/
      //////////////////////////////////이미지 픽셀 품질 유지


      BufferedImage decodeImage = ImageIO.read(bis); //디코드 이미지
      BufferedImage contractImage = ImageIO.read(new File("c:\\asd\\newContract.jpg"));
      int contWidth = contractImage.getWidth();
      int contHeight = contractImage.getHeight();

//      System.out.println("contractImage width 크기 -------------"+contractImage.getWidth());
//      System.out.println("contractImage heigh 크기 ----------------"+contractImage.getHeight());

      BufferedImage mergedImage = new BufferedImage(contWidth, contHeight, BufferedImage.TYPE_INT_RGB);

      Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

      graphics.setBackground(Color.WHITE);
      graphics.drawImage(contractImage, 0, 0, null);
      graphics.drawImage(decodeImage, 1670 , 2507 , width ,height ,null);

      ImageIO.write(mergedImage, "jpg", new File("c:\\asd\\createContract.jpg"));

    }
    catch(Exception e) {
      e.printStackTrace();
    }
    return new ModelAndView("/cust/signPad");
  }

  @GetMapping(value = "/test2")
  public ModelAndView projectInsert() {

    List<ProjDTO> projList = cs.projSelectList();
    System.out.println("셀렉 리스트 -------------"+projList.get(0));

    ModelAndView mv = new ModelAndView();
    mv.setViewName("cust/projList");
    mv.addObject("projList",projList);

    return mv;
  }

  @PostMapping(value = "/test2/insertData")
  public String projectInsertData(HttpServletRequest request, ProjDTO projDTO) {
    System.out.println("컨트롤러 도착 -------------");

    int result = cs.projInsert(projDTO);

    return "redirect:/cust/test2";
  }




}
