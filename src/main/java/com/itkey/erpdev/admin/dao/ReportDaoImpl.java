package com.itkey.erpdev.admin.dao;

import com.itkey.erpdev.admin.domain.Report;
import com.itkey.erpdev.admin.domain.SearchReport;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class ReportDaoImpl implements ReportDao {
    SqlSessionTemplate sql;

    @Override
    public int getTotalReportCount() {
        return sql.selectOne("mapper.report.getTotalReportCount");
    }

    @Override
    public List<Report> reportList(int pageNum, int countPerPage, SearchReport searchReport) {
        int startIdx = (pageNum - 1) * countPerPage;
        Map<String, Object> params = new HashMap<>();
        params.put("startIdx", startIdx);
        params.put("countPerPage", countPerPage);
        params.put("searchRegName", searchReport.getSearchRegName());

        return sql.selectList("mapper.report.reportList", params);
    }

    @Override
    public Report selectReportRead(Report report) {
        return sql.selectOne("mapper.report.selectReportRead",report);
    }

    @Override
    public void updateReportRead(Report report) {
        sql.update("mapper.report.updateReportRead",report);
    }

    @Override
    public void updateReportState(Report report) {
        sql.update("mapper.report.updateReportState",report);
    }

    @Override
    public void deleteReportHistory(Report report) {
        sql.delete("mapper.report.deleteReportHistory",report);
    }
}
