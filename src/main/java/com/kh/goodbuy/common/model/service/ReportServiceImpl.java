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
}
