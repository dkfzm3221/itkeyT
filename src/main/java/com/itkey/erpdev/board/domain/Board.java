package com.itkey.erpdev.board.domain;

import lombok.Data;

@Data
public class Board {
    Integer boardSeq;
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
}
