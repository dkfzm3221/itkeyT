package com.itkey.erpdev.board.domain;

import lombok.Data;

@Data
public class Notice {
    String noticeSeq;
    String noticeType;
    String noticeTitle;
    String noticeContents;
    String regId;
    String regDate;
    String fileIdx;
    Integer inqCnt;
    String oriNm;
    String saveNm;
    String filePath;
}
