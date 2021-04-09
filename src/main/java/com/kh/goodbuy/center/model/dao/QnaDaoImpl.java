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
	public List<QNA> selectQNAList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaMapper.selectQNAList");
	}

	@Override
	public int insertQNA(QNA q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaMapper.insertQNA", q);
	}

	@Override
	public QNA selectQNA(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaMapper.selectQNA", qa_no);
	}

	@Override
	public int updateFAQ(QNA q) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.updateFAQ", q);
	}

	@Override
	public int deleteQNA(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaMapper.deleteQNA", qa_no);
	}
}
