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

	// 상품신고 
	public int insertGoodsReport(Report r, int gno, String report_id, String reported_id);
	// 내가 한 신고 리스트 카운트 
	public int selectMyReportCount(String user_id);
	// 내가 한 신고 리스트 조회 
	public List<Report> selectMyReportList(String user_id, PageInfo pi);
	// 신고 철회 
	public int deleteReport(int re_no);


	// 관리자
	public List<Report> selectReport1List();
	public List<Report> selectReport2List();
	public List<Report> selectReport3List();

	// 내가 당한 신고 카운트 
	public int selectMyReportedCount(String user_id);
	// 내가 당한 신고 리스트 
	public List<Report> selectReportedList(String user_id, PageInfo pi);


	
}
