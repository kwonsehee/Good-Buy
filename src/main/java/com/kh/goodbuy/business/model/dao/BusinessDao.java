package com.kh.goodbuy.business.model.dao;

import java.util.List;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.town.model.vo.Town;

public interface BusinessDao {

	public List<Business> selectbList(Town townInfo);

	public List<News> selectnList(Town townInfo);
	
	public List<Attachment> selectfList();

	public List<NewsAttachment> selectnfList();

	public List<Review> selectrList();

	public List<Business> selectGradebList(Town townInfo);

	public List<Business> selectReviewbList(Town townInfo);

	public List<News> selectJobnList(Town townInfo);

	public List<News> selectFruitnList(Town townInfo);

	public List<News> selectHousenList(Town townInfo);

	public List<News> selectCarnList(Town townInfo);

	public List<News> selectEventnList(Town townInfo);

	public List<News> selectCompanynList(Town townInfo);

	public List<News> selectStudynList(Town townInfo);

	public int updateReadCount(int shopNo);

	public Business selectDetail(int shopNo);

	public News selectDetailNews(int shopNo);

	public List<Review> selectDetailReview(int shopNo);


	
}
