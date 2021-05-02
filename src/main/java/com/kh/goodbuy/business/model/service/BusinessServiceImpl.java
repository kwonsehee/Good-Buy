package com.kh.goodbuy.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.business.model.dao.BusinessDao;
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

@Service
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	private BusinessDao bDao;




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
	public List<News> selectDetailNews(int shopNo) {
		
		return bDao.selectDetailNews(shopNo);
	}


	@Override
	public List<Review> selectDetailReview(int shopNo) {
	
		return bDao.selectDetailReview(shopNo);
	}


	@Override
	public Business selectBusinessInfo(String userId) {
		
		return bDao.selectBusinessInfo(userId);
	}




	@Override
	public int infoInsert(Business b, Addfile a) {
		int result = bDao.infoInsert(b);
		if(result > 0) {
			return bDao.fileInsert(a);
				
		}else {
			return 0;
		}
	}




	@Override
	public int updateBstatus(String userId) {
		
		return bDao.updateBstatus(userId);
	}




	@Override
	public int newsInsert(News n, Addfile a) {
		int result = bDao.newsInsert(n);
		if(result > 0) {
			return bDao.newsFileInsert(a);
		}else {
			return 0;
		}
	
	}




	@Override
	public int selectshopNo(String userId) {
		
		return bDao.selectshopNo(userId);
	}




	@Override
	public List<News> selectNews(int shopNo) {
		
		return bDao.selectNews(shopNo);
	}




	@Override
	public int infoupdate(Business b, Addfile a) {
		
		int result = bDao.infoupdate(b);
		if(result > 0) {
			return bDao.changeFileInsert(a);
		}else {
			return 0;
		}
	
	}



	@Override
	public int updateBfile(int shopNo) {
		
		return bDao.updateBfile(shopNo);
	}




	@Override
	public int updateFacount(Map<String, String> map) {
		
		return bDao.updateFaCount(map);
	}




	@Override
	public int deleteBusiness(int shopNo) {
		
		return bDao.deleteBusiness(shopNo);
	}




	@Override
	public int updateBstatus2(String userId) {
		
		return bDao.updateBstatus2(userId);
	}




	@Override
	public List<Review> insertReview(Review r) {
			bDao.insertReview(r);
		return bDao.selectDetailReview(r.getShopNo());
	}




	@Override
	public int cashInsert(Payment p) {
		
		return bDao.cashInsert(p);
  }
  	@Override
	public int selectMyFavShopCount(String user_id) {
		return bDao.selectMyFavShopCount(user_id);

	}




	@Override
	public int cashUpdate(Payment p) {
		
		return bDao.cashUpdate(p);
	}




	@Override
	public int selectViewCnt(int shopNo) {
		
		return bDao.selectViewCnt(shopNo);
	}




	@Override
	public int updateCashUse(Map<String, Integer> map) {
		
		return bDao.updateCashUse(map);
	}




	@Override
	public int updateViewCnt(Map<String, Integer> map) {
		
		return bDao.updateViewCnt(map);
  }
  @Override
	public List<Business> selectMyFavShopList(String user_id, PageInfo pi) {
		return bDao.selectMyFavShopList(user_id, pi);

	}




@Override
public int selectFaUserList(Map<String, String> map) {

	return bDao.selectFaUserList(map);
}




@Override
public int deleteFacount(Map<String, String> map) {
	
	return bDao.deleteFaCount(map);
}




@Override
public int deleteReview(String reviewNo) {
			int result =  bDao.deleteReview(reviewNo);
			if(result >0 ) {
				return bDao.deleteReview2(reviewNo);
			}else {
				return 0;
			}
	
}




@Override
public int updateUserPoint(String userId) {
	
	return bDao.updateUserPoint(userId);
}




@Override
public int deleteNews(int n_no) {
	
	return bDao.deleteNews(n_no);
}













	











}
