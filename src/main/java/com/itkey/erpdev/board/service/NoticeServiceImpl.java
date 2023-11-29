package com.itkey.erpdev.board.service;

import com.itkey.erpdev.admin.dto.FileDto;
import com.itkey.erpdev.board.domain.Notice;
import com.itkey.erpdev.board.repository.NoticeDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    NoticeDao dao;
    public static String uploadDir;
    @Value("${spring.servlet.multipart.location}")
    public void setKey(String value) {
        uploadDir = value;
    }


    @Override
    public List<Notice> selectNoticeList() throws Exception {
        return dao.selectNotice();
    }

    @Override
    public void updateInqCnt(Notice notice) throws Exception {
        dao.updateInqCnt(notice);
    }

    @Override
    public Notice noticeDetail(Notice notice) throws Exception {
        return dao.noticeDetail(notice);
    }

    @Override
    public void modiNotice(Notice notice, HttpServletRequest request) throws Exception {
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
                    dao.updateFile(fileDto);
                } else {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    dao.saveFile(fileDto);
                }
            }
        }

        String fileIdx = "";

        if (file == null) {
            fileIdx = notice.getFileIdx();
        } else {
            fileIdx = fileDto.getFileIdx();
        }
        notice.setFileIdx(fileIdx);

        dao.modiNotice(notice);
    }

    @Override
    public void deleteNotice(Notice notice) throws Exception {
        dao.deleteNotice(notice);
    }


    @Override
    public void insertNotice(Notice notice, HttpServletRequest request) throws Exception {

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
                    dao.updateFile(fileDto);
                } else {
                    fileDto.setSaveNm(newFileName);
                    fileDto.setOriNm(originalFileName);
                    fileDto.setFilePath(fileUrl);
                    dao.saveFile(fileDto);
                }
            }
        }

        String fileIdx = "";

        if (file == null) {
            fileIdx = notice.getFileIdx();
        } else {
            fileIdx = fileDto.getFileIdx();
        }
        notice.setFileIdx(fileIdx);

        dao.insertNotice(notice);
    }

}
