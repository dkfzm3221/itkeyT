package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dao.ReportDao;
import com.itkey.erpdev.admin.domain.Report;
import com.itkey.erpdev.admin.domain.SearchReport;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@AllArgsConstructor
public class ReportServiceImpl implements ReportService {

	ReportDao reportDao;

	@Override
	public int getTotalReportCount() {
		return reportDao.getTotalReportCount();
	}

	@Override
	public List<Report> reportList(int pageNum, int countPerPage, SearchReport searchReport) {
		return reportDao.reportList(pageNum,countPerPage,searchReport);
	}

	@Override
	public Report selectReportRead(Report report) {
        return reportDao.selectReportRead(report);
    }

	@Override
	public void updateReportRead(Report report) {
		reportDao.updateReportRead(report);
	}

	@Override
	public void updateReportState(Report report) {
		reportDao.updateReportState(report);
	}

	@Override
	public void deleteReportHistory(Report report) {
		reportDao.deleteReportHistory(report);
	}
}
