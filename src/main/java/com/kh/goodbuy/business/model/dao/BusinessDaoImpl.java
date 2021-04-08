package com.kh.goodbuy.business.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
@Repository
public class BusinessDaoImpl implements BusinessDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Business> selectbList(String userId) {
		
		return sqlSession.selectList("businessMapper.selectbList");
	}

	@Override
	public List<Attachment> selectfList(String userId) {
		
		return sqlSession.selectList("businessMapper.selectfList");
	}

	@Override
	public List<NewsAttachment> selectnfList(String userId) {
		
		return sqlSession.selectList("businessMapper.selectnfList");
	}

	@Override
	public List<News> selectnList(String userId) {
		
		return sqlSession.selectList("businessMapper.selectnList");
	}

}
