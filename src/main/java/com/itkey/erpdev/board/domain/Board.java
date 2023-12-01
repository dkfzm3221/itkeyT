package com.itkey.erpdev.board.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Board implements Serializable {
    Integer boardSeq;
    Integer menuSeq;
    String menuName;
    String menuUrl;
    String menuSite;
    String menuBoardType;

    String boardType;
    String boardTitle;
    String boardContent;
    String boardSecretYn;
    String boardDelYn;
    String replyYn;
    String replyContent;
    String replyMemberId;
    String replyDt;
    String attchFileCnt;
    Integer inqCnt;
    String regId;
    String regNm;
    String regDt;
    String updId;
    String updNm;
    String updDt;
    Integer pageNum;
    Integer pageSize;
    String password;
    Integer adminBoardNumber;
    String adminBoardName;
    Integer boardTypeCnt;
    String adminBoardDelYn;

    //댓글
    Integer replySeq;
    String replyContents;
    String useYn;
    String regDate;
    String regUser;
    String modUser;
    String modDate;


    String fileIdx;
    String oriNm;
    String saveNm;
    String filePath;

    String reportContents;
    String reportRegDate;
    String regName;
    int reportIdx;


}
