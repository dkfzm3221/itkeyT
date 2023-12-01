package com.itkey.erpdev.admin.controller;

import com.itkey.erpdev.admin.dao.ReportDao;
import com.itkey.erpdev.admin.dao.VisitorDao;
import com.itkey.erpdev.admin.domain.Report;
import com.itkey.erpdev.admin.domain.SearchReport;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.admin.service.ReportService;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/report")
public class ReportController {
    ReportService reportService;
    /**
    *
    * report
    *@author 신금환
    *@date 2023-11-30
    *@comment 로그 저장
    *
    **/
    @GetMapping(value = "/reportList")
    public ModelAndView create(HttpSession session, HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
        @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage, Report report, SearchReport searchReport)throws Exception {
        ModelAndView mv = new ModelAndView("/board/reportList");
        // 관리자
        TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");
        String memberType = member.getMemberType();
        mv.addObject("memberType", memberType);

        //페이징
        int totalCount = reportService.getTotalReportCount();
        int startPage = (pageNum - 1) * countPerPage + 1;
        int endPage = startPage + countPerPage - 1;
        int currentPage = pageNum;
        int previousPage = currentPage > 1 ? currentPage - 1 : 1;
        int nextPage = currentPage < (totalCount / countPerPage) + 1 ? currentPage + 1 : (totalCount / countPerPage) + 1;

        int pageGroupSize = 5;
        int totalPage = (totalCount / countPerPage) + ((totalCount % countPerPage == 0) ? 0 : 1);
        int currentGroup = (currentPage - 1) / pageGroupSize;
        int startPageGroup = (currentGroup * pageGroupSize) + 1;
        int endPageGroup = startPageGroup + pageGroupSize - 1;

        if (endPageGroup > totalPage) {
            endPageGroup = totalPage;
        }

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("startPageGroup", startPageGroup);
        pageInfo.put("endPageGroup", endPageGroup);
        pageInfo.put("totalCount", totalCount);
        pageInfo.put("startPage", startPage);
        pageInfo.put("endPage", endPage);
        pageInfo.put("currentPage", currentPage);
        pageInfo.put("previousPage", previousPage);
        pageInfo.put("nextPage", nextPage);

        List<Report> reportList = reportService.reportList(pageNum, countPerPage,searchReport);
        mv.addObject("reportList", reportList);
        mv.addObject("searchRegName", searchReport.getSearchRegName());

        return mv;
    }



    /**
     *
     *@author 신금환
     *@date 2023-11-30
     *@comment 게시물 신고
     *
     **/
    @PostMapping(value = "/reportRead")
    public ModelAndView reportRead(Report report,HttpServletRequest request,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        Report selectReportRead= reportService.selectReportRead(report);
        String reportContents=selectReportRead.getReportContents();
        int boardSeq=selectReportRead.getBoardSeq();
        mv.addObject("reportContents", reportContents);
        mv.addObject("boardSeq", boardSeq);

        return mv;
    }

    /**
     *
     *@author 신금환
     *@date 2023-11-30
     *@comment 신고된 게시물 비공개전환
     *
     **/
    @Transactional(rollbackFor = Exception.class)
    @PostMapping(value = "/reportBoardDelete")
    public ModelAndView reportBoardDelete(Report report,HttpServletRequest request,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        reportService.updateReportRead(report);
        reportService.updateReportState(report);
        return mv;
    }

    /**
     *
     *@author 신금환
     *@date 2023-11-30
     *@comment 신고된 게시물 내역 삭제
     *
     **/
    @PostMapping(value = "/deleteReportHistory")
    public ModelAndView deleteReportHistory(Report report,HttpServletRequest request,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        reportService.deleteReportHistory(report);
        return mv;
    }

}
