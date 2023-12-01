package com.itkey.erpdev.admin.dao;

import com.itkey.erpdev.admin.domain.Report;
import com.itkey.erpdev.admin.domain.SearchReport;
import java.util.List;

public interface ReportDao {

    int getTotalReportCount();

    List<Report> reportList(int pageNum, int countPerPage, SearchReport searchReport);

    Report selectReportRead(Report report);

    void updateReportRead(Report report);

    void updateReportState(Report report);

    void deleteReportHistory(Report report);
}
