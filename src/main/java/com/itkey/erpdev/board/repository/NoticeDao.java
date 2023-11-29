package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.FileDto;
import com.itkey.erpdev.board.domain.Notice;

import java.util.List;

public interface NoticeDao {

    void insertNotice(Notice notice) throws Exception;

    void updateFile(FileDto fileDto) throws Exception;

    void saveFile(FileDto fileDto) throws Exception;

    List<Notice> selectNotice() throws Exception;

    void updateInqCnt(Notice notice) throws Exception;

    Notice noticeDetail(Notice notice) throws Exception;

    void modiNotice(Notice notice) throws Exception;

    void deleteNotice(Notice notice) throws Exception;
}
