package com.kh.goodbuy.center.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.center.model.vo.Notice;

@Repository	
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.selectNoticeList");
	}
}
