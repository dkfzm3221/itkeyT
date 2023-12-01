package com.itkey.erpdev.admin.domain;

import lombok.Data;

@Data
public class Report {
    int reportIdx;
    Integer boardSeq;
    String reportContents;
    String reportRegDate;
    String regName;
    String reportState;
    String boardTitle;
    String boardDelYn;
}
