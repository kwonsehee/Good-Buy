package com.kh.goodbuy.business.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.town.model.vo.Town;
@Repository
public class BusinessDaoImpl implements BusinessDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<Attachment> selectfList() {
		
		return sqlSession.selectList("businessMapper.selectfList");
	}

	@Override
	public List<NewsAttachment> selectnfList() {
		
		return sqlSession.selectList("businessMapper.selectnfList");
	}

	@Override
	public List<Business> selectbList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectbList",townInfo);
	}

	@Override
	public List<News> selectnList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectnList",townInfo);
	}

	@Override
	public List<Review> selectrList() {
		
		return sqlSession.selectList("businessMapper.selectrList");
	}

	@Override
	public List<Business> selectGradebList(Town townInfo) {
		
		return sqlSession.selectList("businessMapper.selectGradebList",townInfo);
	}

	@Override
	public List<Business> selectReviewbList(Town townInfo) {
		
		return sqlSession.selectList("businessMapper.selectReviewbList",townInfo);
	}

	@Override
	public List<News> selectJobnList(Town townInfo) {
		
		return sqlSession.selectList("businessMapper.selectJobnList",townInfo);
	}

	@Override
	public List<News> selectFruitnList(Town townInfo) {
		
		return sqlSession.selectList("businessMapper.selectFruitnList",townInfo);
	}

	@Override
	public List<News> selectHousenList(Town townInfo) {
		
		return sqlSession.selectList("businessMapper.selectHousenList",townInfo);
	}

	@Override
	public List<News> selectCarnList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectCarnList",townInfo);
	}

	@Override
	public List<News> selectEventnList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectEventnList",townInfo);
	}

	@Override
	public List<News> selectCompanynList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectCompanynList",townInfo);
	}

	@Override
	public List<News> selectStudynList(Town townInfo) {

		return sqlSession.selectList("businessMapper.selectStudynList",townInfo);
	}

	@Override
	public int updateReadCount(int shopNo) {
		
		return sqlSession.update("businessMapper.updateReadCount",shopNo);
		
	}

	@Override
	public Business selectDetail(int shopNo) {
	
		return sqlSession.selectOne("businessMapper.selectDetail",shopNo);
	}

	@Override
	public News selectDetailNews(int shopNo) {
		
		return sqlSession.selectOne("businessMapper.selectDetailNews",shopNo);
	}

	@Override
	public List<Review> selectDetailReview(int shopNo) {
		
		return sqlSession.selectList("businessMapper.selectDetailReview",shopNo);
	}

	

	

}
