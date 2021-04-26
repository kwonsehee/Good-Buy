package com.kh.goodbuy.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.common.model.dao.ReportDao;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.member.model.vo.PageInfo;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao rDao;

	@Override
	public List<Report> selectReportList() {
		// TODO Auto-generated method stub
		return rDao.selectReportList();
	}

	@Override
	public Report selectReport(int re_no) {
		// TODO Auto-generated method stub
		return rDao.selectReport(re_no);
	}

	@Override
	public int updateReport(Report r) {
		// TODO Auto-generated method stub
		return rDao.updateReport(r);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return rDao.selectListCount();
	}

	@Override
	public List<Report> selectReportList(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDao.selectList(pi);
	}

	@Override
	public int insertGoodsReport(Report r, int gno, String report_id, String reported_id) {
		// TODO Auto-generated method stub
		return rDao.insertGoodsReport(r, gno, report_id, reported_id);
	}

	@Override
	public int selectMyReportCount(String user_id) {
		return rDao.selecMyReportCount(user_id);
	}

	@Override
	public List<Report> selectMyReportList(String user_id, PageInfo pi) {
		return rDao.selectMyReportList(user_id, pi);
	}

	@Override
	public int deleteReport(int re_no) {
		return rDao.deleteReport(re_no);
	}

	@Override
	public int selectMyReportedCount(String user_id) {
		return rDao.selectMyReportedCount(user_id);
	}

	@Override
	public List<Report> selectReportedList(String user_id, PageInfo pi) {
		return rDao.selectReportedList(user_id, pi);
	}
}
