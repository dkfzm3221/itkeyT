package com.itkey.erpdev.board.controller;

import com.github.pagehelper.PageInfo;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.service.BoardService;
import com.itkey.erpdev.common.page.Paging;
import com.itkey.erpdev.customer.dto.CustInfoResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/")
public class BoardController {

    BoardService bs;

    @GetMapping(value = "/")
    public ModelAndView boardList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                  @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage) throws Exception {
        ModelAndView mv = new ModelAndView("/index");


        int totalCount = bs.getTotalBoardCount();
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

        List<Board> boardList = bs.boardList(pageNum, countPerPage);

        mv.addObject("pageInfo", pageInfo);
        mv.addObject("boardList", boardList);


        return mv;
    }
    @GetMapping(value = "/writeBoardView")
    public ModelAndView writeBoardView() throws Exception{
        ModelAndView mv = new ModelAndView("/board/writeBoardView");

        return mv;
    }

    @PostMapping(value = "/writeBoard")
    public ModelAndView writeBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/index");
        bs.writeBoard(board);
        return mv;
    }

    @GetMapping(value = "/boardDetail")
    public ModelAndView boardDetail(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");

        bs.updateInqCnt(board);
        Board boardDetail = bs.boardDetail(board);


        mv.addObject("boardDetail", boardDetail);

        return mv;
    }

    @PostMapping(value = "/boardPassword")
    public ModelAndView boardPassword(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        Board selectPassword = bs.selectPassword(board);
        String password = selectPassword.getPassword();

        mv.addObject("password", password);

        return mv;
    }

    @PostMapping(value = "/updateBoard")
    public ModelAndView updateBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.updateBoard(board);

        return mv;
    }




}
