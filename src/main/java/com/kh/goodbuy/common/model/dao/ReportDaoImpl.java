package com.kh.goodbuy.common.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.member.model.vo.PageInfo;

@Repository
public class ReportDaoImpl implements ReportDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Report> selectReportList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reportMapper.selectReportList");
	}

	@Override
	public Report selectReport(int re_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reportMapper.selectReport", re_no);
	}

	@Override
	public int updateReport(Report r) {
		// TODO Auto-generated method stub
		return sqlSession.update("reportMapper.updateReport", r);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reportMapper.selectListCount");
	}

	@Override
	public List<Report> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("reportMapper.selectList", null, rowBounds);
	}
}
