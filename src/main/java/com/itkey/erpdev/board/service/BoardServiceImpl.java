package com.itkey.erpdev.board.service;

import com.itkey.erpdev.admin.dao.TotalAdminDAO;
import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.DesignDTO;
import com.itkey.erpdev.admin.dto.FileDto;
import com.itkey.erpdev.admin.dto.HistoryDTO;
import com.itkey.erpdev.board.domain.Board;
import com.itkey.erpdev.board.domain.Notice;
import com.itkey.erpdev.board.domain.SearchBoard;
import com.itkey.erpdev.board.repository.BoardDao;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    BoardDao dao;
    TotalAdminDAO totalAdminDAO;
    public static String uploadDir;
    @Value("${spring.servlet.multipart.location}")
    public void setKey(String value) {
        uploadDir = value;
    }

    @Override
    public List<Board> boardList(int pageNum, int countPerPage, String boardType) throws Exception {
        return dao.boardList(pageNum, countPerPage, boardType);
    }
    /**
     *
     *
     *@author 신금환
     *@date 2023-11-28
     *@comment 첨부파일 등록및 게시물 수정
     *
     **/
    @Override
    public void writeBoard(Board board, HttpServletRequest request) throws Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("file");

        FileDto fileDto = new FileDto();

        if (file != null) {
            MultipartFile multipartFile = file;
            if (!multipartFile.isEmpty()) {
                String originalFileName = multipartFile.getOriginalFilename();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

                String newFileName = UUID.randomUUID().toString() + fileExtension;

                File dir = new File(uploadDir); //파일 저장경로(로컬)
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File newFile = new File(dir, newFileName);

                Path filePath = Paths.get(newFile.getAbsolutePath());

                String fileUrl = "/images/" + newFileName;

                Files.write(filePath, multipartFile.getBytes());

                //파일 idx별로 update, insert 구분
                if (fileDto.getFileIdx() != null) {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    totalAdminDAO.updateFile(fileDto);
                } else {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    totalAdminDAO.saveFile(fileDto);
                }
            }
        }

        String fileIdx = "";

        if (file == null) {
            fileIdx = board.getFileIdx();
        } else {
            fileIdx = fileDto.getFileIdx();
        }
        board.setFileIdx(fileIdx);

        dao.writeBoard(board);
    }

    @Override
    public Board boardDetail(Board board) throws Exception {
        return dao.boardDetail(board);
    }

    @Override
    public void updateInqCnt(Board board) throws Exception {
        dao.updateInqCnt(board);
    }

    @Override
    public int getTotalBoardCount(String boardType) throws Exception {
        return dao.getTotalBoardCount(boardType);
    }

    @Override
    public Board selectPassword(Board board) throws Exception {
        return dao.selectPassword(board);
    }

    /**
     *
     *
     *@author 신금환
     *@date 2023-11-28
     *@comment 첨부파일 수정 및 게시물 수정
     *
     **/
    @Override
    public void updateBoard(Board board, HttpServletRequest request) throws Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("file");

        FileDto fileDto = new FileDto();

        if (file != null) {
            MultipartFile multipartFile = file;
            if (!multipartFile.isEmpty()) {
                String originalFileName = multipartFile.getOriginalFilename();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

                String newFileName = UUID.randomUUID().toString() + fileExtension;

                File dir = new File(uploadDir); //파일 저장경로(로컬)
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File newFile = new File(dir, newFileName);

                Path filePath = Paths.get(newFile.getAbsolutePath());

                String fileUrl = "/images/" + newFileName;

                Files.write(filePath, multipartFile.getBytes());

                //파일 idx별로 update, insert 구분
                if (fileDto.getFileIdx() != null) {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    totalAdminDAO.updateFile(fileDto);
                } else {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    totalAdminDAO.saveFile(fileDto);
                }
            }
        }

        String fileIdx = "";

        if (file == null) {
            fileIdx = board.getFileIdx();
        } else {
            fileIdx = fileDto.getFileIdx();
        }

        board.setFileIdx(fileIdx);
        dao.updateBoard(board);
    }

    @Override
    public void deleteBoard(Board board) throws Exception {
        dao.deleteBoard(board);
    }

    @Override
    public List<Board> getMenuList() throws Exception {
        return dao.getMenuList();
    }

    @Override
    public List<Board> boardTypeList() throws Exception {
        return dao.boardTypeList();
    }

    @Override
    public List<Banner> bannerList() throws Exception {
        return dao.bannerList();
    }

    @Override
    public Board selectName(String boardType) {
        return dao.selectName(boardType);
    }

    @Override
    public List<Board> boardDetailReplyList(Board board) {
        return dao.boardDetailReplyList(board);
    }

    @Override
    public void insertBoardReply(Board board) {
         dao.insertBoardReply(board);
    }

    @Override
    public void updateBoardReply(Board board) {
        dao.updateBoardReply(board);
    }

    @Override
    public void deleteBoardReply(Board board) {
        dao.deleteBoardReply(board);
    }

    @Override
    public List<Board> boardDetailList(int pageNum, int countPerPage, String boardType, SearchBoard searchBoard) {
        return dao.boardDetailList(pageNum,countPerPage,boardType,searchBoard);
    }

    @Override
    public List<DesignDTO> getDesignList() {
        return dao.getDesignList();
    }

    @Override
    public void deleteBoardFile(Board board) {
        dao.deleteBoardFile(board);
    }

    @Override
    public void deleteBoardFileSeq(Board board) {
        dao.deleteBoardFileSeq(board);
    }

    @Override
    public List<Notice> noticeList(String boardType) throws Exception {
        return dao.noticeList(boardType);
    }

    @Override
    public Notice getNoticeOne() throws Exception {
        return dao.getNoticeOne();
    }

    @Override
    public void reportBoard(Board board, HttpServletRequest request) {
        dao.reportBoard(board,request);
    }


    @Override
    public List<HistoryDTO> getHistoryList() {
        return dao.getHistoryList();
    }
}
