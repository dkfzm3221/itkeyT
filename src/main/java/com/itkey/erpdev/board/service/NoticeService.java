package com.itkey.erpdev.board.service;

import com.itkey.erpdev.board.domain.Notice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface NoticeService {

    void insertNotice(Notice notice, HttpServletRequest request) throws Exception;

    List<Notice> selectNoticeList() throws Exception;

    void updateInqCnt(Notice notice) throws Exception;

    Notice noticeDetail(Notice notice) throws Exception;

    void modiNotice(Notice notice, HttpServletRequest request) throws Exception;

    void deleteNotice(Notice notice) throws Exception;
}
