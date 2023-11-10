package com.itkey.erpdev.project.controller;

import com.itkey.erpdev.project.domain.ProjectPrice;
import com.itkey.erpdev.project.dto.PriceTableRequest;
import com.itkey.erpdev.project.dto.ProjectList;
import com.itkey.erpdev.project.service.ProjectService;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *packageName    : com.example.erpdev.project.controller
 * fileName       : ProjectController
 * author         : AHN
 * date           : 2022-12-23
 * description    : 프로젝트 관리
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022-12-23        AHN       최초 생성
 */
@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/prj")
public class ProjectController {

  ProjectService ps;

  //전체
  // TODO: 2022-12-27 프로젝트 등록 작업해야함
  @GetMapping(value = "/all")
  public ModelAndView projectAll() {
    ModelAndView mv = new ModelAndView("프로젝트전체");
    List<ProjectList> list = ps.projectAll();
    mv.addObject("list", list);
    return mv;
  }

  //진행
  @GetMapping(value = "/prog")
  public ModelAndView projectProgress() {
    ModelAndView mv = new ModelAndView("진행중프로젝트");
    List<ProjectList> list = ps.projectProg();
    mv.addObject("list", list);
    return mv;
  }

  //종료
  @GetMapping(value = "/end")
  public ModelAndView projectEnd() {
    ModelAndView mv = new ModelAndView("종료프로젝트");
    List<ProjectList> list = ps.projectEnd();
    mv.addObject("list", list);
    return mv;
  }


  // TODO: 2023-01-16 스타일은 나중에 추가로 수정
  @GetMapping(value = "/excelDown")
  public void priceTableExcel(HttpServletResponse response, PriceTableRequest request) throws Exception {

    int rowNo = 0;
    int cIdx = 0;
    int csum = 0;
    int tsum = 0;
    int lastcol = 0;
    Cell cell = null;
    boolean chk = true;

    Workbook workbook = new HSSFWorkbook();
    Sheet sheet = workbook.createSheet("단가표");

    CellStyle headerStyle = workbook.createCellStyle();
    Font headerFont = workbook.createFont();
    headerFont.setFontName("맑은 고딕");
    headerFont.setFontHeightInPoints((short) 12);
    headerFont.setBold(true);
    headerStyle.setAlignment(HorizontalAlignment.CENTER);
    headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
    headerStyle.setFont(headerFont);

    CellStyle cellStyle = workbook.createCellStyle();
    Font font = workbook.createFont();
    font.setFontName("맑은 고딕");
    font.setFontHeightInPoints((short) 12);
    cellStyle.setAlignment(HorizontalAlignment.CENTER);
    cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
    cellStyle.setFont(font);

    sheet.setColumnWidth(0,5000);
    sheet.setColumnWidth(1,5000);
    sheet.setColumnWidth(2,5000);
    sheet.setColumnWidth(3,5000);
    sheet.setColumnWidth(4,10000);
    //sheet.setAutoFilter(CellRangeAddress.valueOf("A1:F1"));  필터

    Row headerRow = sheet.createRow(rowNo++);
    cell = headerRow.createCell(0);
    cell.setCellValue("거래처");
    cell.setCellStyle(headerStyle);
    cell = headerRow.createCell(1);
    cell.setCellValue("이름");
    cell.setCellStyle(headerStyle);
    cell = headerRow.createCell(2);
    cell.setCellValue("공급");
    cell.setCellStyle(headerStyle);
    cell = headerRow.createCell(3);
    cell.setCellValue("세금포함");
    cell.setCellStyle(headerStyle);
    cell = headerRow.createCell(4);
    cell.setCellValue("비고");
    cell.setCellStyle(headerStyle);

    List<ProjectPrice> list = ps.priceTable(request);
    for (ProjectPrice price : list) {
      if (chk) {
        cIdx = price.getCstmIdx();
        chk = false;
      }
      if (cIdx != price.getCstmIdx()) {
        Row csumRow = sheet.createRow(rowNo++);
        sheet.addMergedRegion(new CellRangeAddress(rowNo - 1, rowNo - 1, 0, 1));
        cell = csumRow.createCell(0);
        cell.setCellValue("합계");
        cell.setCellStyle(cellStyle);
        cell = csumRow.createCell(2);
        cell.setCellValue(csum);
        cell.setCellStyle(cellStyle);
        cell = csumRow.createCell(3);
        cell.setCellValue(csum + (csum / 10));
        cell.setCellStyle(cellStyle);

        cIdx = price.getCstmIdx();
        csum = 0;
        lastcol = 0;
      }
      Row row = sheet.createRow(rowNo++);
      cell = row.createCell(0);
      cell.setCellValue(price.getCstmNm());  //거래처명
      cell.setCellStyle(cellStyle);
      cell = row.createCell(1);
      cell.setCellValue(price.getEmpNm());   //이름
      cell.setCellStyle(cellStyle);
      cell = row.createCell(2);
      cell.setCellValue(price.getSalesPrice());  //단가
      cell.setCellStyle(cellStyle);
      cell = row.createCell(3);
      cell.setCellValue(price.getTaxPrice());  //단가(세금포함)
      cell.setCellStyle(cellStyle);

      csum += price.getSalesPrice();
      tsum += price.getSalesPrice();
      lastcol++;
    }
    Row csumRow = sheet.createRow(rowNo++);
    sheet.addMergedRegion(new CellRangeAddress(rowNo - 1, rowNo - 1, 0, 1));
    cell = csumRow.createCell(0);
    cell.setCellValue("합계");
    cell.setCellStyle(cellStyle);
    cell = csumRow.createCell(2);
    cell.setCellValue(csum);
    cell.setCellStyle(cellStyle);
    cell = csumRow.createCell(3);
    cell.setCellValue(csum + (csum / 10));
    cell.setCellStyle(cellStyle);

    Row tsumRow = sheet.createRow(rowNo++);
    sheet.addMergedRegion(new CellRangeAddress(rowNo - 1, rowNo - 1, 0, 1));
    cell = tsumRow.createCell(0);
    cell.setCellValue("총 합계");
    cell.setCellStyle(cellStyle);
    cell = tsumRow.createCell(2);
    cell.setCellValue(tsum);
    cell.setCellStyle(cellStyle);
    cell = tsumRow.createCell(3);
    cell.setCellValue(tsum + (tsum / 10));
    cell.setCellStyle(cellStyle);

    response.setContentType("ms-vnd/excel");

    String fileName = request.getInpY() + "년" + request.getInpM() + "월 단가표";
    String name = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
    response.setHeader("Content-Disposition", "attachment; filename=" + name + ".xls");
    workbook.write(response.getOutputStream());
    workbook.close();
  }

}
