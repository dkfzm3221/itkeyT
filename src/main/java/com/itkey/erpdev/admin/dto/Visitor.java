package com.itkey.erpdev.admin.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Visitor {
    String visitId;
    String visitIp;
    LocalDateTime visitTime;
    String visitRefer;
    String visitAgent;
    Integer urlCount;
    Integer IPCount;
    Integer visitDateCount;
    String visitTimeToDate;

}
