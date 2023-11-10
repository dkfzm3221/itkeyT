package com.itkey.erpdev.employee.domain;

import java.time.LocalDate;

import com.itkey.erpdev.customer.dto.CustEmpList;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@Alias("Employee")
public class Employee {

  Integer empIdx;     //직원인덱스
  Integer deptIdx;    //부서인덱스
  Integer compIdx;    //기업인덱스
  Integer pstnIdx;    //직급인덱스

  String empNm;       //이름
  String empId;       //아이디
  String empPw;       //패스워드
  String salt;         //솔트키
  String type;         //직원타입  A / E
  String imgPt;       //프로필 이미지 경로
  String oriImgNm;    //프로필 이미지명
  Integer jumin1;     //주민번호 앞자리
  Integer jumin2;     //주민번호 뒷자리
  Integer zipCd;      //우편번호
  String adr1;        //주소
  String adr2;        //상세주소
  Integer ph;         //휴대폰
  String email;       //이메일
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate entDt;         //입사일

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate cntDt;         //정규직 계약일
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate outDt;         //퇴사일
  String cntYn;       //정규직여부
  String wrkYn;       //재직여부
  String msYn;        //군필여부
  String exmRsn;      //미필사유
  String memo;        //메모
  String cert;        //자격증(JSON)
  String acdBck;      //학력(JSON)
  String gisaYn;      //기사여부
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate regDt;         //등록일자

  String skill;
  Integer workYF;
  Integer workMF;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate intrvDt;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  LocalDate ableDt;
  String openYn;

  String filePt1;   //첨부파일 경로1
  String fileNm1;   //첨부파일 명1
  String filePt2;   //첨부파일 경로2
  String fileNm2;   //첨부파일 명2
  String filePt3;   //첨부파일 경로3
  String fileNm3;   //첨부파일 명3
  String filePt4;   //첨부파일 경로4
  String fileNm4;   //첨부파일 명4
  String filePt5;   //첨부파일 경로5
  String fileNm5;   //첨부파일 명5

  CustEmpList custEmpList;
}