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
	public int insertGoodsReport(Report r, int gno, String report_id, String reported_id);
	// 내가 한 신고 리스트 카운트 
	public int selecMyReportCount(String user_id);
	// 내가 한 신고 리스트 조회 
	public List<Report> selectMyReportList(String user_id, PageInfo pi);
	// 신고 철회 
	public int deleteReport(int re_no);
	// 내가 당한 신고 카운트 
	public int selectMyReportedCount(String user_id);
	// 내가 당한 신고 리스트 
	public List<Report> selectReportedList(String user_id, PageInfo pi);

	// 관리자가 신고 처리시 유저인포 DB 업데이트
	public int addCountReported(String reported_id);
	// 로그인 시 신고 이력 있는지 조회 
	public String selectMyReportedDate(String user_id);
	// 로그인 시 신고 이력 날짜 비교 -> 업데이트
	public int updateReportedDate(String user_id);

	//user신고
	public int insertUserReport(Report r);

	public List<Report> selectReportList1();

	public List<Report> selectReportList2();

	public List<Report> selectReportList3();



}
