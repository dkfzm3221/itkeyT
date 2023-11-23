package com.itkey.erpdev.board.controller;

import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.MenuDTO;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.SearchBoard;
import com.itkey.erpdev.board.service.BoardService;
import com.itkey.erpdev.member.domain.Member;
import com.itkey.erpdev.member.dto.MemberInfoResponse;
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

    /**
    *
    * BoardController
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 대시보드 게시판 리스트
    *
    **/
    @GetMapping(value = "/")
    public ModelAndView boardList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                  @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage
            , HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("/index");

        HttpSession session = request.getSession();
        List<Board> boardTypeList = bs.boardTypeList();
        mv.addObject("boardTypeList", boardTypeList);

        //게시판 타입별로 화면에 리스트 출력
        for (Board board : boardTypeList) {
            String boardType = board.getBoardType();
            List<Board> boardList = bs.boardList(pageNum, countPerPage, boardType);

            mv.addObject("section_" + board, boardList);
        }

        //세션에 배너, 메뉴 저장
        List<Banner> bannerList = bs.bannerList();
        List<Board> menuList = bs.getMenuList();
        session.setAttribute("menuList", menuList);
        session.setAttribute("bannerList", bannerList);

        List<DesignDTO> designList = bs.getDegignList();
        session.setAttribute("designList", designList);

        return mv;
    }

    // 게시물 등록 form
    @GetMapping(value = "/writeBoardView")
    public ModelAndView writeBoardView(Board board,HttpServletRequest request, HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("/board/writeBoardView");

        if(session.getAttribute("admin") != null ){
            TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");

            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }else if(session.getAttribute("member") != null ){

            MemberInfoResponse member = (MemberInfoResponse) session.getAttribute("member");
            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }

        String menuBoardType;
         if(board.getBoardType()== "" || board.getBoardType() == null){
             menuBoardType=board.getMenuBoardType();
         }else{
             menuBoardType=board.getBoardType();
         }

        mv.addObject("boardType",menuBoardType);
        return mv;
    }
    // 게시물 등록
    @PostMapping(value = "/writeBoard")
    public ModelAndView writeBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/index");
        bs.writeBoard(board);
        return mv;
    }

    // 게시판 상세
    @GetMapping(value = "/boardDetail")
    public ModelAndView boardDetail(Board board, HttpSession session) throws Exception{
        
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        if(session.getAttribute("admin") != null ){
            TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");
            String userId = member.getId();

            mv.addObject("userId", userId);
            String memberType = member.getMemberType();
            mv.addObject("memberType", memberType);
        }else if(session.getAttribute("member") != null ){

            MemberInfoResponse member = (MemberInfoResponse) session.getAttribute("member");
            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }

        List<Board> boardDetailReplyList = bs.boardDetailReplyList(board);

        mv.addObject("boardDetailReplyList", boardDetailReplyList);
        bs.updateInqCnt(board);
        Board boardDetail = bs.boardDetail(board);
        mv.addObject("boardDetail", boardDetail);

        return mv;
    }

    /**
    *
    * BoardController
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 게시글 비밀번호 체크
    *
    **/
    @PostMapping(value = "/boardPassword")
    public ModelAndView boardPassword(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        Board selectPassword = bs.selectPassword(board);
        String password = selectPassword.getPassword();

        mv.addObject("password", password);

        return mv;
    }

    /**
    *
    * BoardController
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 게시판 수정
    *
    **/
    @PostMapping(value = "/updateBoard")
    public ModelAndView updateBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.updateBoard(board);

        return mv;
    }

    /**
    *
    * BoardController
    *
    *@author 김재섭
    *@date 2023-11-23
    *@comment 게시판 삭제
    *
    **/
    @PostMapping(value = "/deleteBoard")
    public ModelAndView deleteBoard(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.deleteBoard(board);

        return mv;
    }


    // 댓글 등록
     @PostMapping(value = "/insertBoardReply")
    public ModelAndView insertBoardReply(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.insertBoardReply(board);

        return mv;
    }

    // 댓글 수정
    @PostMapping(value = "/modBoardReply")
    public ModelAndView modBoardReply(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.updateBoardReply(board);

        return mv;
    }

    // 댓글 삭제
    @PostMapping(value = "/deleteBoardReply")
    public ModelAndView deleteBoardReply(Board board) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        bs.deleteBoardReply(board);

        return mv;
    }

    @GetMapping(value = "/boardDetailList")
    public ModelAndView moveToListNumber(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
        @RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage, Board board, HttpSession session, SearchBoard searchBoard) throws Exception{
        ModelAndView mv = new ModelAndView("/boardDetailList");

        //session 구분
        if(session.getAttribute("admin") != null ){
            // 관리자
            TotalAdminDTO member = (TotalAdminDTO) session.getAttribute("admin");
            String memberType = member.getMemberType();
            mv.addObject("memberType", memberType);
        }else if(session.getAttribute("member") != null ){
            // 일반user
            MemberInfoResponse member = (MemberInfoResponse) session.getAttribute("member");
            String memberType = member.getMemberType();
            String userId = member.getId();
            mv.addObject("userId", userId);
            mv.addObject("memberType", memberType);
        }

        // type 설정
        String boardType= board.getMenuBoardType();

        //페이징
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

        List<Board> boardDetailList = bs.boardDetailList(pageNum, countPerPage,boardType,searchBoard);
        //게시판명 select
        Board selectName = bs.selectName(boardType);

        mv.addObject("pageInfo", pageInfo);
        mv.addObject("boardDetailList", boardDetailList);
        mv.addObject("boardType", boardType);
        mv.addObject("selectName", selectName.getMenuName());
        mv.addObject("searchBoardTitle", searchBoard.getSearchBoardTitle());

        return mv;
    }

}
