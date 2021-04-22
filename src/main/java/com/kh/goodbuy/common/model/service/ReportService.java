package com.kh.goodbuy.common.model.service;

import java.util.List;

import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface ReportService {

	public List<Report> selectReportList();

	public Report selectReport(int re_no);

	public int updateReport(Report r);

	public int selectListCount();

	public List<Report> selectReportList(PageInfo pi);

	//상품신고 
	public int insertGoodsReport(Report r, int gno, String report_id);
	

	
}
