package com.kh.goodbuy.business.model.service;

import java.util.List;
import java.util.Map;

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

public interface BusinessService {

	public int infoInsert(Business b, Addfile a);

	public List<Business> selectbList(Town townInfo);

	public List<News> selectnList(Town townInfo);
	
	public List<Attachment> selectfList();

	public List<NewsAttachment> selectnfList();

	public List<Review> selectrList();

	public List<Business> selectGradebList(Town townInfo);

	public List<Business> selectReviewbList(Town townInfo);

	public List<News> selectJobnList(Town townInfo);

	public List<News> selectStudynList(Town townInfo);

	public List<News> selectCompanynList(Town townInfo);

	public List<News> selectEventnList(Town townInfo);

	public List<News> selectCarnList(Town townInfo);

	public List<News> selectHousenList(Town townInfo);

	public List<News> selectFruitnList(Town townInfo);

	public Business selectDetail(int shopNo, boolean flag);

	public List<News> selectDetailNews(int shopNo);

	public List<Review> selectDetailReview(int shopNo);

	public Business selectBusinessInfo(String userId);

	public int updateBstatus(String userId);

	public int newsInsert(News n, Addfile a);

	public int selectshopNo(String userId);

	public List<News> selectNews(int shopNo);

	public int infoupdate(Business b, Addfile a);

	public int updateBfile(int shopNo);

	public int updateFacount(Map<String, String> map);

	public int deleteBusiness(int shopNo);

	public int updateBstatus2(String userId);

	public List<Review> insertReview(Review r);


	public int cashInsert(Payment p);

	public int cashUpdate(Payment p);

	public int selectViewCnt(int shopNo);

	public int updateCashUse(Map<String, Integer> map);

	public int updateViewCnt(Map<String, Integer> map);

	public int selectMyFavShopCount(String user_id);

	public List<Business> selectMyFavShopList(String user_id, PageInfo pi);

	public int selectFaUserList(Map<String, String> map);

	public int deleteFacount(Map<String, String> map);

	public int deleteReview(String reviewNo);

	public int updateUserPoint(String userId);

	public int deleteNews(int nNo);









	

	


	



}
