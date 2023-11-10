package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/")
public class BoardController {

    BoardService bs;

    @GetMapping(value = "/")
    public ModelAndView boardList(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/index");

        List<Board> boardList = bs.boardList();

        mv.addObject("boardList", boardList);

        return mv;
    }
    @GetMapping(value = "/writeBoardView")
    public ModelAndView writeBoardView() throws Exception{
        ModelAndView mv = new ModelAndView("/board/writeBoardView");

        return mv;
    }

}
