package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.admin.dto.MenuDTO;
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

    @PostMapping(value = "/deleteBoard")
    public ModelAndView deleteBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.deleteBoard(board);

        return mv;
    }




}
