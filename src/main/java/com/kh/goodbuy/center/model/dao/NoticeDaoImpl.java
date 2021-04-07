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

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	@Override
	public Notice selectNotice(int nt_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNotice", nt_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	@Override
	public int deleteNotice(int nt_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("noticeMapper.deleteNotice", nt_no);
	}
}
