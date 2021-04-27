package com.kh.goodbuy.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
import com.kh.goodbuy.business.model.vo.Payment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.member.model.vo.PageInfo;
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
	public List<News> selectDetailNews(int shopNo) {
		
		return sqlSession.selectList("businessMapper.selectDetailNews",shopNo);
	}

	@Override
	public List<Review> selectDetailReview(int shopNo) {
		
		return sqlSession.selectList("businessMapper.selectDetailReview",shopNo);
	}

	@Override
	public Business selectBusinessInfo(String userId) {
		
		return sqlSession.selectOne("businessMapper.selectBusinessInfo",userId);
	}

	@Override
	public int infoInsert(Business b) {
		
		
		return sqlSession.insert("businessMapper.infoInsert",b);
	}

	@Override
	public int fileInsert(Addfile a) {
		
		return sqlSession.insert("businessMapper.fileInsert",a);
	}

	@Override
	public int updateBstatus(String userId) {
		
		return sqlSession.update("businessMapper.updateBstatus",userId);
	}

	@Override
	public int newsInsert(News n) {
		
		return sqlSession.insert("businessMapper.newsInsert",n);
	}

	@Override
	public int newsFileInsert(Addfile a) {
		
		return sqlSession.insert("businessMapper.newsFileInsert",a);
	}

	@Override
	public int selectshopNo(String userId) {
		
		return sqlSession.selectOne("businessMapper.selectshopNo",userId);
	}

	@Override
	public List<News> selectNews(int shopNo) {
		
		return sqlSession.selectList("businessMapper.selectNews",shopNo);
	}

	@Override
	public int infoupdate(Business b) {
		System.out.println("dao b" + b);
		
		return sqlSession.update("businessMapper.infoupdate",b);
	}

	@Override
	public int changeFileInsert(Addfile a) {
		
		return sqlSession.insert("businessMapper.changeFileInsert",a);
	}

	@Override
	public int updateBfile(int shopNo) {
		
		return sqlSession.update("businessMapper.updateBfile",shopNo);
	}

	@Override
	public int updateFaCount(Map<String, String> map) {
		
		return sqlSession.insert("businessMapper.updateFaCount",map);
	}

	@Override
	public int deleteBusiness(int shopNo) {
		
		return sqlSession.update("businessMapper.deleteBusiness",shopNo);
	}

	@Override
	public int updateBstatus2(String userId) {
		
		return sqlSession.update("businessMapper.updateBstatus2",userId);
	}

	@Override
	public int insertReview(Review r) {
		
		return sqlSession.insert("businessMapper.insertReview",r);
	}

	@Override
	public int cashInsert(Payment p) {
		
		return sqlSession.insert("businessMapper.cashInsert",p);
	}

	@Override
	public int cashUpdate(Payment p) {
		
		return sqlSession.update("businessMapper.cashUpdate",p);
	}

	@Override
	public int selectViewCnt(int shopNo) {
		
		return sqlSession.selectOne("businessMapper.selectViewCnt",shopNo);
	}

	@Override
	public int updateCashUse(Map<String, Integer> map) {
		
		return sqlSession.update("businessMapper.updateCashUse",map);
	}

	@Override
	public int updateViewCnt(Map<String, Integer> map) {
		
		return sqlSession.update("businessMapper.updateViewCnt",map);
  }
  @Override
	public int selectMyFavShopCount(String user_id) {
		return sqlSession.selectOne("businessMapper.selectMyFavShopCount",user_id);
	}

	@Override
	public List<Business> selectMyFavShopList(String user_id, PageInfo pi) {
		return sqlSession.selectList("businessMapper.selectMyFavShopList",user_id);

	}

	

	

}
