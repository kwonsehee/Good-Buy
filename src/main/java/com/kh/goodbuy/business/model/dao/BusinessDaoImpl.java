package com.kh.goodbuy.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;

public class BusinessDaoImpl implements BusinessDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Business> selectbList() {
		
		return sqlSession.selectList("businessMapper.selectbList");
	}

	@Override
	public List<Attachment> selectfList() {
		
		return sqlSession.selectList("businessMapper.selectfList");
	}

	@Override
	public List<Attachment> selectnfList() {
		
		return sqlSession.selectList("businessMapper.selectnfList");
	}

	@Override
	public List<News> selectnList() {
		
		return sqlSession.selectList("businessMapper.selectnList");
	}

}
