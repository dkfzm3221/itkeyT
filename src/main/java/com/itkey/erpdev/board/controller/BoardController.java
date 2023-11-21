package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
                                  @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage
            , HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("/index");

        HttpSession session = request.getSession();
        List<Board> boardTypeList = bs.boardTypeList();
        mv.addObject("boardTypeList", boardTypeList);

        for (Board board : boardTypeList) {
            String boardType = board.getBoardType();
            List<Board> boardList = bs.boardList(pageNum, countPerPage, boardType);

            mv.addObject("section_" + board, boardList);
        }



        List<Board> menuList = bs.getMenuList();

        session.setAttribute("menuList", menuList);

        return mv;
    }
    @GetMapping(value = "/writeBoardView")
    public ModelAndView writeBoardView(Board board,HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/board/writeBoardView");
        String menuBoardType;
         if(board.getBoardType()== "" || board.getBoardType() == null){
             menuBoardType=board.getMenuBoardType();
         }else{
             menuBoardType=board.getBoardType();
         }

        mv.addObject("boardType",menuBoardType);
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

    @PostMapping(value = "/deleteBoard")
    public ModelAndView deleteBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.deleteBoard(board);

        return mv;
    }

    @GetMapping(value = "/boardDetailList")
    public ModelAndView moveToListNumber(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
        @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage, Board board, HttpSession session) throws Exception{

        TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");

        String memberType = member.getMemberType();

        ModelAndView mv = new ModelAndView("/boardDetailList");

        String boardType= board.getMenuBoardType();
        int totalCount = bs.getTotalBoardCount(boardType);
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
        pageInfo.put("boardType", boardType);

        List<Board> boardDetailList = bs.boardDetailList(pageNum, countPerPage,boardType);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("boardDetailList", boardDetailList);
        mv.addObject("boardType", boardType);
        mv.addObject("memberType", memberType);


        return mv;
    }



}
