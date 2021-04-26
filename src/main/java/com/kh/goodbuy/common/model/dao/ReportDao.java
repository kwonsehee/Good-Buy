package com.kh.goodbuy.common.model.dao;

import java.util.List;

import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface ReportDao {

	public List<Report> selectReportList();

	public Report selectReport(int re_no);

	public int updateReport(Report r);

	public int selectListCount();

	public List<Report> selectList(PageInfo pi);
	//상품신고 
	public int insertGoodsReport(Report r, int gno, String report_id);
	// 내가 한 신고 리스트 카운트 
	public int selecMyReportCount(String user_id);
	// 내가 한 신고 리스트 조회 
	public List<Report> selectMyReportList(String user_id, PageInfo pi);
	// 신고 철회 
	public int deleteReport(int re_no);

	public List<Report> selectReportList1();

	public List<Report> selectReportList2();

	public List<Report> selectReportList3();

}
