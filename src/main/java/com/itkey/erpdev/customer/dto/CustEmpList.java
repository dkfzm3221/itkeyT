package com.itkey.erpdev.customer.dto;

import com.github.pagehelper.PageInfo;
import com.itkey.erpdev.common.masking.MaskString;
import com.itkey.erpdev.common.page.SearchDto;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class CustEmpList {
    Integer cacIdx;
    Integer custIdx;
    String cacId;
    String cacPw;
    String cacSalt;

    Integer cEmpIdx;
    @MaskString
    String cEmpNm;
    String jumin1;
    String jumin2;
    String adr1;
    String adr2;
    String phone;
    String email;
    Integer dept;
    String gisa;
    String gender;
    String openYn;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate regDt;

    Integer cRmsIdx;
    String prjNm;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate inpDt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate outDt;
    String ordCom;
    String role;
    String skill;
    String detail;
    Integer workYF;
    Integer workMF;
    LocalDate intrvDt;//인터뷰 가능일자
    LocalDate ableDt;//투입가능일자

    PageInfo pageInfo;
    SearchDto searchDto;


}
