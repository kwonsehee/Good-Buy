package com.kh.goodbuy.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.business.model.dao.BusinessDao;
import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.town.model.vo.Town;

@Service
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	private BusinessDao bDao;

	@Override
	public int infoInsert(Business bus) {
		
		return 0;
	}


	@Override
	public List<Business> selectbList(Town townInfo) {

		return bDao.selectbList(townInfo);
	}
	
	
	
	
	@Override
	public List<News> selectnList(Town townInfo) {

		return bDao.selectnList(townInfo);
	}


	@Override
	public List<Attachment> selectfList() {

		return bDao.selectfList();
	}

	@Override
	public List<NewsAttachment> selectnfList() {

		return bDao.selectnfList();
	}


	@Override
	public List<Review> selectrList() {
		
		return bDao.selectrList();
	}


	@Override
	public List<Business> selectGradebList(Town townInfo) {
		
		return bDao.selectGradebList(townInfo);
	}


	@Override
	public List<Business> selectReviewbList(Town townInfo) {
		
		return bDao.selectReviewbList(townInfo);
	}


	@Override
	public List<News> selectJobnList(Town townInfo) {
		
		return bDao.selectJobnList(townInfo);
	}


	@Override
	public List<News> selectStudynList(Town townInfo) {
		
		return bDao.selectStudynList(townInfo);
	}


	@Override
	public List<News> selectCompanynList(Town townInfo) {
		
		return bDao.selectCompanynList(townInfo);
	}


	@Override
	public List<News> selectEventnList(Town townInfo) {
		
		return bDao.selectEventnList(townInfo);
	}


	@Override
	public List<News> selectCarnList(Town townInfo) {
		
		return bDao.selectCarnList(townInfo);
	}


	@Override
	public List<News> selectHousenList(Town townInfo) {
		
		return bDao.selectHousenList(townInfo);
	}


	@Override
	public List<News> selectFruitnList(Town townInfo) {
		
		return bDao.selectFruitnList(townInfo);
	}


	@Override
	public Business selectDetail(int shopNo, boolean flag) {
		 if(flag)	bDao.updateReadCount(shopNo);
		return bDao.selectDetail(shopNo);
	}


	@Override
	public News selectDetailNews(int shopNo) {
		
		return bDao.selectDetailNews(shopNo);
	}


	@Override
	public List<Review> selectDetailReview(int shopNo) {
	
		return bDao.selectDetailReview(shopNo);
	}







}
