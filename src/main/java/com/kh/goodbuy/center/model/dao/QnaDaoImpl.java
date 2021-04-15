package com.kh.goodbuy.center.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.center.model.vo.QNA;

@Repository	
public class QnaDaoImpl implements QnaDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QNA> selectFAQList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaMapper.selectFAQList");
	}

	@Override
	public QNA selectFAQ(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaMapper.selectFAQ", qa_no);
	}

	@Override
	public int updateFAQ(QNA q) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.updateFAQ", q);
	}

	@Override
	public int deleteFAQ(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaMapper.deleteFAQ", qa_no);
	}
}
